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


export CFLAGS="$CFLAGS -I$(brew --prefix openssl@1.1)/include"
export LDFLAGS="$LDFLAGS -L$(brew --prefix openssl@1.1)/lib -L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export ARCHFLAGS="$ARCHFLAGS -arch x86_64"

# Useful when installing virtualenv management outside of/before pyenv. Not using
# quotes permits tilde expansion.

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init - 2>/dev/null)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# export PYENV_ROOT=${PYENV_ROOT:-~/.pyenv/}

export CQLSH_NO_BUNDLED=TRUE

klaviyo_services() {
    local action="${1:?Argument must be one of [re]start|stop|status}"

    if [[ $action == "restart" ]]; then
        klaviyo_services stop
        klaviyo_services start
    elif [[ $action == "start" || $action == "stop" ]]; then
        echo memcached rabbitmq mysql@5.7 redis | xargs -n1 brew services $action
        ccm $action
    else
        brew services list
        echo Cassandra:
        ccm status
    fi
}

#################################
# Helpful Aliases and Functions #
#################################

# quick view
alias gitbr='git branch | lolcat'

# for editing
alias kl_bash="nvim ~/$USER/dotfiles/zsh/klaviyo_dev_profile.zsh"

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
    # nvm use node;
    # nvm use 12.17.0;
    if [[ $# -eq 0 ]] ; then
        return 0
    else
        git pull;
        yarn && yarn dev:all
    fi
}

klms() {
    if [[ $# -eq 0 ]] ; then
        nvim ~/Klaviyo/Scratch/klmisc
    else
        nvim ~/Klaviyo/Scratch/klmisc/$1
    fi
}

klhb() {
    cd ~/Klaviyo/Repos/eng-handbook/;
    git br
}

rmpyc() {
    find . -name '*.pyc' -exec rm -rf {} \;
    find . -name __pycache__ -exec rm -rf {} \;
}

klapp() {
    cd ~/Klaviyo/Repos/app/;
}

klapp3() {
    cd ~/Klaviyo/Repos/app-py3/;
}

klcs() {
    cd ~/Klaviyo/Repos/commerceservice/;
    if [[ $# -eq 0 ]] ; then
        return 0
    else
        GRPC_SERVE_PORT=50052 ./manage.py serve
    fi
}

klhb() {
    cd ~/Documents/eng-handbook/;
    if [[ $# -eq 0 ]] ; then
        return 0
    else
        git pull;
    fi
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
    klapp && make COMMAND="exec app bash" compose
}

kllogs() {
    klapp && make COMMAND='logs -ft app' composee
}


alias klworkers='klapp && bin/wrk -d'
alias klfix='klapp && git checkout -- src/learning/media/dev-js/react/account_management/user_management-bundle.js src/learning/media/dev-js/react/folders/folders-bundle.js src/learning/media/dev-js/react/profiles/profiles-bundle.js src/learning/media/js/react/profiles/profiles-bundle.js src/learning/media/js/react/folders/folders-bundle.js src/learning/media/js/react/account_management/user_management-bundle.js'

alias klserve='klapp && bin/django runserver 127.0.0.1:8765'
alias kl-compile-statics="bin/django compile_assets --closure-jar=~/Klaviyo/Misc/js_compiler.jar && bin/django remove_sourcemaps"

# Kick celery so it starts running again:
alias kl-chuck-norris-celery='bin/django celery inspect active_queues'

# Detect duplicate migrations caused by upstream commits:
alias kl-dup-migrations='ls -1 src/learning/app/migrations/*.py | sed "s/^[a-z\/]*\([0-9]*\)\(.*\)$/\1/" | uniq -d'

# component-library
alias klcomponents='cd ~/Klaviyo/Repos/fender/packages/component-library'

#utils
alias klutils='cd ~/Klaviyo/Repos/fender/packages/utils'

alias klemail='python -m smtpd -n -c DebuggingServer localhost:8766'

alias klsettings='klapp && nvim ~/Klaviyo/Repos/app/src/learning/local_settings.py'

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

# OP HELPERS
OP_FILE="/tmp/op_temp";
op_login() {
    if ! op list items > /dev/null; then
        op signin rocca_family > $OP_FILE;
        . $OP_FILE;
    fi
}
if [[ -f "$OP_FILE" ]]; then
    . $OP_FILE;
fi

# AWS MFA Helpers
avprod() {
  # If you are not authenticated for 1pass then authenticate first
  op_login
  aws-vault exec --mfa-token="$(op get totp aws-klaviyo)" klaviyo-prod -- zsh
}

alias klprod='op_login && aws-vault exec --mfa-token="$(op get totp aws-klaviyo)" klaviyo-prod'

alias kldev='op_login && aws-vault exec --mfa-token="$(op get totp aws-klaviyo-dev)" klaviyo-dev'

avdev() {
  # If you are not authenticated for 1pass then authenticate first
  op_login
  aws-vault exec --mfa-token="$(op get totp aws-klaviyo-dev)" klaviyo-dev -- zsh
}

# PIP Things
export KL_PIP_INSTALL=1

update_commerceservice() {
    curdir=$(PWD);
    klcs \
    && cp -r client/commerceservice/client /Users/$USER/.pyenv/versions/2.7.18/envs/app/lib/python2.7/site-packages/commerceservice \
    && cd $curdir
}

# alias klaviyocli='/Users/$USER/.klaviyocli/.venv/bin/klaviyocli'

export PATH="$PATH:/Users/ty.rocca/.klaviyocli/.bin"
autoload -Uz compinit && compinit
fpath=('/Users/ty.rocca/.klaviyocli/.zshcompletions' $fpath)

export KL_DEMAND='qw-on-demand-small-02d664a1582c76234'
alias klssh="ssh $KL_DEMAND"

eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"


function s2a-login {
        export SAML2AWS_CREDENTIALS_FILE=$(mktemp)
        saml2aws login --force --skip-prompt --cache-saml "$@" && {
                AWS_ROLE=$(grep ^x_principal_arn "${SAML2AWS_CREDENTIALS_FILE}" 2>/dev/null | cut -d/ -f2)
                source <(saml2aws script)
                export S2A_AWS_ROLE="[${AWS_ROLE}] "
        }
        rm -rf ${SAML2AWS_CREDENTIALS_FILE}
        unset SAML2AWS_CREDENTIALS_FILE
}


function kl_vpn {
    networksetup -connectpppoeservice "OFFICE-BOS-VPN"
}

alias s2a-team="s2a-login --role=arn:aws:iam::${LEARNLY_AWS_KEY}:role/Okta-TeamCCC-prod --session-duration=28800"
export MAINLINE_PYTHON=/Users/ty.rocca/.pyenv/versions/app/bin/python

source ~/Klaviyo/Repos/app/config/app/osx_dev_profile.bash


export KL_SSH_USERNAME=tyrocca
alias kssh="klaviyocli ssh prod"


export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin
export KL_AWS_CUSTOM_S3_ENDPOINT=http://localhost:9000
export KL_LOCAL_DYNAMODB_ENDPOINT=http://localhost:4566
export KL_LOCAL_KMS_ENDPOINT=http://localhost:4566
