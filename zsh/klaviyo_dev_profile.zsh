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
. "/usr/local/opt/nvm/nvm.sh"

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
    else
        date="$(date '+%Y%m')"
        git checkout -b "${date}_$1"
    fi
}
alias gmb=git_month_branch

git_month_checkout() {
    if [[ $# -eq 0 ]] ; then
        echo 'ERROR: Please provide a branch name'
    else
        date="$(date '+%Y%m')"
        git checkout "${date}_$1"
    fi
}
alias gmco=git_month_checkout

kljs() {
    cd ~/Klaviyo/Repos/fender/;
}

klapp() {
    cd ~/Klaviyo/Repos/app/;
}

kldbshell() {
    klapp && ./bin/django dbshell;
}

klshell() {
    klapp && ./bin/django shell;
}


alias klworkers='klapp && bin/wrk -d'
alias klfix='klapp && git checkout -- src/learning/media/dev-js/react/account_management/user_management-bundle.js src/learning/media/dev-js/react/folders/folders-bundle.js src/learning/media/dev-js/react/profiles/profiles-bundle.js src/learning/media/js/react/profiles/profiles-bundle.js src/learning/media/js/react/folders/folders-bundle.js src/learning/media/js/react/account_management/user_management-bundle.js'

alias klserve='klfix && sudo bin/django runserver 127.0.0.1:80'
alias klflows-js='klfix && yarn react'
alias grafana='ssh -L 8888:127.0.0.01:8888 -L 3000:localhost:3000 ubuntu@grafana.klaviyodevops.com'

# needs to be run on init
kl_init_cassandra() {
    sudo ifconfig lo0 alias 127.0.0.2 up;
    sudo ifconfig lo0 alias 127.0.0.3 up;
    ccm start;
}

# Wrap buildout so we skip librabbitmq:
alias kl-bin-buildout="sed -i -re \"s/(\s'librabbitmq)/#\1/\" setup.py && bin/buildout && sed -i -re \"s/#('librabbitmq)/\1/\" setup.py"

# Kick celery so it starts running again:
alias kl-chuck-norris-celery='bin/django celery inspect active_queues'

# Detect duplicate migrations caused by upstream commits:
alias kl-dup-migrations='ls -1 src/learning/app/migrations/*.py | sed "s/^[a-z\/]*\([0-9]*\)\(.*\)$/\1/" | uniq -d'

# component-library
alias klcomponents='cd ~/Klaviyo/Repos/fender/packages/component-library'

#utils
alias klutils='cd ~/Klaviyo/Repos/fender/packages/utils'

alias klemail='sudo python -m smtpd -n -c DebuggingServer localhost:25'
