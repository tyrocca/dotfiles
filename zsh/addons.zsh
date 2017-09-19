# fzf searching
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# this is the iterm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# OPAM configuration
. /Users/tyrocca/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
