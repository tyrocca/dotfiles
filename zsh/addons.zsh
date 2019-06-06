# this is the iterm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# OPAM configuration
. /Users/tyrocca/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


# http://owen.cymru/sf-a-quick-way-to-search-for-some-thing-in-bash-and-edit-it-with-vim-2/
sf() {
    if [ "$#" -lt 1 ]; then echo "Supply string to search for!"; return 1; fi
    printf -v search "%q" "$*"
    include="yml,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst"
    exclude=".config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist"
    rg_command='rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" -g "*.{'$include'}" -g "!{'$exclude'}/*"'
    files=`eval $rg_command $search | fzf --ansi --multi --reverse | awk -F ':' '{print $1":"$2":"$3}'`
    [[ -n "$files" ]] && ${EDITOR:-vim} $files
}


gcob() {
    local branches branch
    branches=$(git --no-pager branch -vv --sort=-committerdate) &&
        branch=$(echo "$branches" | fzf +m --reverse --height 40%) &&
        git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

###########
# Klaviyo #
###########
# source ~/.klaviyo_dev_profile.zsh

