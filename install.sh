#!/bin/bash
# install.sh - this installs all of my stuff

# install repo
# cd ~/;
# git clone https://github.com/tyrocca/dotfiles.git;

ubuntu_install() {
    # start install
    sudo apt-get -y --force-yes update
    sudo apt-get -y --force-yes upgrade
    sudo apt-get -y --force-yes install curl
    sudo apt-get -y --force-yes install git
    # npm
    sudo apt-get -y --force-yes install npm

    # C Things
    sudo apt-get -y --force-yes install clang
    sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 50
    sudo apt-get -y --force-yes install git kcachegrind linux-tools-generic bochs qemu

    # zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # programming tools
    sudo apt-get -y --force-yes install exuberant-ctags
    sudo apt-get -y --force-yes install tmux

    # neovim
    sudo apt-get -y --force-yes install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get -y --force-yes update
    sudo apt-get -y --force-yes install neovim
    sudo apt-get -y --force-yes install python-dev python-pip python3-dev python3-pip
    sudo apt-get -y --force-yes install python3-venv
    pip install virtualenv
}



###########
# Z-shell #
###########
# Add zsh for the zsh users

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
    nvim +PlugInstall +PythonSupportInitPython3 +PythonSupportInitPython2 +qall +silent;
}

enableItalics(){
    cd ~/dotfiles/terminal/;
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
    rm -rf ~/.eslintrc.js;
    ln -s "$cwd/dotfiles/eslintrc.js" "$cwd/.eslintrc.js";
}

# run these
ubuntu_install;
installVim;
linkNeoVim;
enableTern;
enableItalics;
enableTmux;


# most people won't want to overwrite their eslintrc
# linkEslint;
