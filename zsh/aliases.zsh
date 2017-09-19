###########
# aliases #
###########
# this is recommended when using npm / node modules
alias npm-exec='PATH=$(npm bin):$PATH'
# quick edits
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimconfig="nvim ~/.vimrc"
alias vimplugins="nvim ~/dotfiles/vim/plugins.vim"
# quick source
alias activate_env="source env/bin/activate"
# chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# cd to volumes
export HARD_DRIVE='/Volumes/Macintosh\ HD/Symlinks'
alias hd_folder="cd $HARD_DRIVE"
alias desktop="cd ~/Desktop/"
alias code="cd ~/Code/"
alias cs121_psets="cd ~/Code/LaTeX/psets/cs121/"

#bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
