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
alias add_alias="nvim ~/dotfiles/zsh/aliases.zsh"
alias disable_zsh_git='git config oh-my-zsh.hide-status 1'
alias mypy='/Users/$USER/.pyenv/versions/neovim/bin/mypy'
# for mypy
export MYPY_CACHE_DIR='/Users/$USER/.cache/mypy/'
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

####################
# Helper Functions #
####################
# things for vim - swp files
ls_swp() {
    ls ~/.vim/.swp/
}
rm_swp() {
    rm ~/.vim/.swp/*
}
# backups
ls_backups() {
    ls ~/.vim/.backup/
}
rm_backups() {
    rm ~/.vim/.backup/*
}
# undo files
ls_undo() {
    ls ~/.vim/.undo/
}
rm_undo() {
    rm ~/.vim/.undo/*
}

##########
# CS 165 #
##########

alias ssh165='cd ~/Code/cs165; vagrant up > /dev/null 2>&1; vagrant ssh -- -t "cd /vagrant/src; bash"'

make_milestone() {
    git tag -d milestone$1-submit
    git tag milestone$1-submit
    git push --tags -f
}

# This function makes a file with the sanitizer. It can take in the file with or
make_san() {
    export ASAN_OPTIONS=allocator_may_return_null=1;
    # export ASAN_OPTIONS=allocator_may_return_null=1,detect_leaks=1;
    base=${1%.*};
    rm $base > /dev/null 2>&1;
    clang -std=c99 -ggdb3 -fsanitize=undefined,address -fno-omit-frame-pointer -Wall -Wextra -pedantic -O0 -o $base $base.c
}

