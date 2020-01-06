# This is a Bash user-profile script containing things that are regularly needed
# when developing on the Klaviyo stack. It is not required by the Klaviyo software
# in any way; it just makes some things more convenient when developing.

# Files like this have a tendency to be "write-only" and grow as people find
# and add new things, but never have anything removed. As a result, please only
# add things to this file if they meet all of the following criteria:

# 1. Additions must be things that are regularly needed when working with
# Klaviyo code; not just things needed once at initial-setup time. Those things
# belong in the setup documentation.
# 2. Additions must be directly relevant to the Klaviyo codebase and products.
# No "this time-saving bash trick saves me tons of time!"-type additions; only
# things that directly pertain to Klaviyo. Productivity tricks should be shared
# with your friends.
# 3. Additions must be compatible with Bash 3.
# 4. Additions must work in the presence of all 4 combinations of the 'e' and 'u'
# shell options.
# 5. This file is (at present) OSX/Homebrew-only; support for additional platforms
# belongs elsewhere.

# OpenSSL fixups for many, many module installs.
export CFLAGS="$CFLAGS -I$(brew --prefix openssl)/include"
export LDFLAGS="$LDFLAGS -L$(brew --prefix openssl)/lib"

# Remove 32bit defaulting for some parts of the 2.7.6 build system.
export ARCHFLAGS="$ARCHFLAGS -arch x86_64"

# Useful when installing virtualenv management outside of/before pyenv. Not using
# quotes permits tilde expansion.
export PYENV_ROOT=${PYENV_ROOT:-~/.pyenv/}

export CQLSH_NO_BUNDLED=TRUE

klaviyo_services() {
    local action="${1:?Argument must be one of [re]start|stop|status}"

    if [[ $action == "restart" ]]; then
        klaviyo_services stop
        klaviyo_services start
    elif [[ $action == "start" || $action == "stop" ]]; then
        echo memcached rabbitmq mysql@5.6 redis | xargs -n1 brew services $action
        ccm $action
    else
        brew services list
        echo Cassandra:
        ccm status
    fi
}

# If you use other tools that intercept shell builtins/common navigation commands
# (e.g. things using the "bash preexec" tools or debug traps to intercept "cd"
# calls and/or hook filesystem navigation to run commands), you may encounter issues
# when using the functions initialized below, since pyenv-virtualenv also does this.
eval "$(pyenv init - 2>/dev/null)"
eval "$(pyenv virtualenv-init - 2>/dev/null)"


################
# SETUP THINGS #
################

# NVM setup
export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"
NVM_HOMEBREW="/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_HOMEBREW" ] && \. "$NVM_HOMEBREW"
[ -x "$(command -v npm)" ] && export NODE_PATH=$NODE_PATH:`npm root -g`

# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This


# Possibly needed?
# export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

#################################
# Helpful Aliases and Functions #
#################################

# quick view
alias gitbr='git branch | lolcat'

# for editing
alias kl_bash="nvim ~/.klaviyo_dev_profile.zsh"

# usage: gmb my_feature_branch > git checkout -b YYYYmm_my_feature_branch
git_month_branch() {
    if [[ $# -eq 0 ]] ; then
        echo 'ERROR: Please provide a branch name'
        return 1
    else
        date="$(date '+%Y%m')"
        git checkout -b "${date}_ty_$1"
    fi
}
alias gmb=git_month_branch

git_month_checkout() {
    if [[ $# -eq 0 ]] ; then
        echo 'ERROR: Please provide a branch name'
        return 1
    else
        date="$(date '+%Y%m')"
        git checkout "${date}_ty_$1"
    fi
}
alias gmco=git_month_checkout

kljs() {
    cd ~/Klaviyo/Repos/fender/;
    nvm use node;
    if [[ $# -eq 0 ]] ; then
        return 0
    else
        git pull;
        yarn && yarn dev
    fi
}

rmpyc() {
    find . -name '*.pyc' -exec rm -rf {} \;
    find . -name __pycache__ -exec rm -rf {} \;
}

klapp() {
    cd ~/Klaviyo/Repos/app/;
}

klmaster() {
    cd ~/Klaviyo/Repos/app-master/ && git pull
}

kldeploy() {
    cd ~/Klaviyo/Repos/infrastructure-deployment/ && git pull;
}

klinfra() {
    cd ~/Klaviyo/Repos/infrastructure-deployment/ && git pull;
}

kldbshell() {
    klapp && ./bin/django dbshell;
}

klshell() {
    klapp && ./bin/django shell;
}


alias klworkers='klapp && bin/wrk -d'
alias klfix='klapp && git checkout -- src/learning/media/dev-js/react/account_management/user_management-bundle.js src/learning/media/dev-js/react/folders/folders-bundle.js src/learning/media/dev-js/react/profiles/profiles-bundle.js src/learning/media/js/react/profiles/profiles-bundle.js src/learning/media/js/react/folders/folders-bundle.js src/learning/media/js/react/account_management/user_management-bundle.js'

alias klserve='klapp && sudo bin/django runserver 127.0.0.1:80'
alias kl-compile-statics="bin/django compile_assets --closure-jar=~/Klaviyo/Misc/js_compiler.jar && bin/django remove_sourcemaps"

alias grafana='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -L 8888:127.0.0.01:8888 -L 7878:localhost:3000 ubuntu@grafana.klaviyodevops.com'

# needs to be run on init
kl_init_cassandra() {
    sudo ifconfig lo0 alias 127.0.0.2 up;
    sudo ifconfig lo0 alias 127.0.0.3 up;
    ccm start;
}

# Kick celery so it starts running again:
alias kl-chuck-norris-celery='bin/django celery inspect active_queues'

# Detect duplicate migrations caused by upstream commits:
alias kl-dup-migrations='ls -1 src/learning/app/migrations/*.py | sed "s/^[a-z\/]*\([0-9]*\)\(.*\)$/\1/" | uniq -d'

# component-library
alias klcomponents='cd ~/Klaviyo/Repos/fender/packages/component-library'

#utils
alias klutils='cd ~/Klaviyo/Repos/fender/packages/utils'

alias klemail='sudo python -m smtpd -n -c DebuggingServer localhost:25'

alias klsettings='klapp && nvim ~/Klaviyo/Repos/app/src/learning/local_settings.py'

alias ssh_micro='ssh qw-on-demand-micro-0aa1a7b73f7464c18'

alias qw_pagerduty='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no qw-on-demand-small-01a8099de57e7675d'

export django_1_7='1.7.11'
export django_1_8='1.8.19'

kl_update_buildout() {
    django_version=""
    if [[ $# -eq 0 ]] ; then
        django_version=$django_1_7
    else
        django_version=$1
    fi
    echo "Setting django version to ${django_version}"

    # sed -i .bak "s/^Django = [^']*/Django = ${django_version}/" buildout.cfg && \
    # sed -i .bak "s/\(pyOpenSSL\)[^']*/\1 == 16.2.0/; s/\(django ==\) [^']*/\1 ${django_version}/" setup.py && \
    # mv buildout.cfg.bak buildout.cfg
    export KLAVIYO_FORCE_DJANGO_VERSION=$django_version
    klapp && \
        sed -i .bak "s/\(pyOpenSSL\)[^']*/\1 == 16.2.0/" setup.py && \
        KLAVIYO_FORCE_DJANGO_VERSION=${django_version} ./bin/buildout && \
        mv setup.py.bak setup.py
    unset KLAVIYO_FORCE_DJANGO_VERSION
}

kl_migrate() {
    export KLAVIYO_FORCE_DJANGO_VERSION=$django_1_8
    klapp && \
        kl_update_buildout $django_1_8 && \
        ./bin/django migrate_klaviyo_databases --fast && \
        kl_update_buildout $django_1_7
    unset KLAVIYO_FORCE_DJANGO_VERSION
}

export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# alias klfab='kldeploy && fab'
#
export INFRASTRUCTURE_DEPLOYMENT_REPO_PATH="$HOME/klaviyo/infrastructure-deployment"

function MarkUnhealthy() {
    aws autoscaling set-instance-health --instance-id $1 --health-status Unhealthy;
}
function CompleteTerminatingLifecycleHook() {
    if [[ "$1" == "help" || "$1" == "-h" || "$1" == "" ]]; then
        echo "Usage: CompleteTerminatingLifecycleHook [ASG NAME] [INSTANCE ID]"
    else
        aws autoscaling complete-lifecycle-action --auto-scaling-group-name $1 --lifecycle-action-result CONTINUE --lifecycle-hook-name "$(echo $1 | sed 's/\./_/g')/hook_terminating" --instance-id $2
    fi
}
function CompleteLaunchingLifecycleHook() {
    if [[ "$1" == "help" || "$1" == "-h" || "$1" == "" ]]; then
        echo "Usage: CompleteLaunchingLifecycleHook [ASG NAME] [INSTANCE ID]"
    else
        aws autoscaling complete-lifecycle-action --auto-scaling-group-name $2 --lifecycle-action-result CONTINUE --lifecycle-hook-name "$(echo $2 | sed 's/\./_/g')/hook_launching" --instance-id $3
    fi
}
function tf() {
    if [[ "$1" == "help" || "$1" == "-h" || "$1" == "" ]]; then
        echo "Usage: tf [ENV] [MODULE] [COMMAND]";
    else
        if [[ "$4" == "" ]]; then
            cmd="terraform.py --env $1 --module $2 --command $3"
            echo $cmd
            $cmd
        else
            cmd="terraform.py --env $1 --module $2 --command $3 --parallelism $4"
            echo $cmd
            $cmd
        fi
    fi
}
