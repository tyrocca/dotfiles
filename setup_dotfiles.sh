#!/bin/bash

# setting up vim if you dont have it
setupVim() {
    rm -rf /home/$USER/.vim
    mkdir /home/$USER/.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    rm /home/$USER/.vimrc
    ln -s /home/$USER/dotfiles/vim/vimrc /home/$USER/.vimrc
    vim +PluginInstall +qall
}

# setuptmux
setupTmux() {
    rm /home/$USER/.tmux-conf
    ln -s /home/$USER/dotfiles/tmux/tmux.conf /home/$USER/.tmux.conf
}

setupVim
