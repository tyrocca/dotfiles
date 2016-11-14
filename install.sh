#!/bin/bash
# install.sh - this installs all of my stuff

# install repo
# cd ~/;
# git clone https://github.com/tyrocca/dotfiles.git;

# install vim
installVim(){
    cd ~/;
    cwd=$(pwd);

    # enable ctags
    rm -rf ~/.ctags;
    ln -s "$cwd/dotfiles/ctags/ctags" "$cwd/.ctags";

    # enable tern
    rm -rf ~/.tern-project;
    ln -s "$cwd/dotfiles/tern-project" "$cwd/.tern-project";

    # do vim things
    rm -rf "$cwd/.vim";
    mkdir "$cwd/.vim";
    rm "$cwd/.vimrc";
    ln -s "$cwd/dotfiles/vim/vimrc" "$cwd/.vimrc";
    vim +VimEnter +PlugInstall +qall +silent;
}

# link neo vim (only if apt things were setup first
linkNeoVim(){
    cd ~/;
    cwd=$(pwd);
    mkdir "$cwd/.config";
    rm -rf "$cwd/.config/nvim";
    mkdir "$cwd/.config/nvim";
    rm "$cwd/.config/nvim/init.vim";
    ln -s "$cwd/dotfiles/vim/vimrc" "$cwd/.config/nvim/init.vim";
    nvim +VimEnter +PlugInstall +qall +silent;
}

enableItalics(){
    cd ~/dotfiles;
    tic xterm-256color-italic.terminfo;
    tic screen-256color-italic.terminfo;
    cd ~/;
}

# this turns on great javascript autocomplete
enableTern(){
    cd ~/.vim/plugged/tern_for_vim/
    npm install;
    cd ~/;
}

# enable iterm2
enableTmux() {
    cd ~/
    cwd=$(pwd)
    rm "$cwd/.tmux.conf"
    ln -s "$cwd/dotfiles/tmux/tmux.conf" "$cwd/.tmux.conf"
    cd ~/
}

# link neo vim (only if apt things were setup first
linkEslint(){
    cd ~/;
    cwd=$(pwd);

    # enable ctags
    rm -rf ~/.ctags;
    ln -s "$cwd/dotfiles/eslintrc.js" "$cwd/.eslintrc.js";
}

# run these
installVim;
linkNeoVim;
enableTern;
enableItalics;
enableTmux;


# most people won't want to overwrite their eslintrc
# linkEslint;
