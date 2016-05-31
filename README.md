# My Dotfiles

### Background
I am trying to start to manage my dotfiles on github. Here is my attempt.

Dev Env:
- Vim
- iTerm2
- Tmux
- Zsh (oh-my-zsh)

### Installation
For the bare minimum run this:
```
cd ~/
git clone https://github.com/tyrocca/dotfiles.git
```
This installs the repo.

### Installing my vim setup
I use the color scheme solarized with the powerline fonts. 
- To get my colorscheme install [this](http://ethanschoonover.com/solarized).
- For powerline install [this](https://github.com/powerline/powerline).
- I also included some of the colorscheme configs in the dotfiles

Then install vim
```
rm -rf /home/$USER/.vim
mkdir /home/$USER/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm /home/$USER/.vimrc
ln -s /home/$USER/dotfiles/vim/vimrc /home/$USER/.vimrc
vim +PluginInstall +qall
```

### Installing Tmux
If you don't have tmux install it
- Ubuntu: `sudo apt-get install tmux`
- Mac: `brew install tmux`

link my config files
```
rm /home/$USER/.tmux-conf
ln -s /home/$USER/dotfiles/tmux/tmux.conf /home/$USER/.tmux.conf
```

### Install zsh
I just switched to zsh and I really like it. I use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

##### Installation:
via curl
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
via wget
```
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
Then make it the default shell with `chsh -s /bin/zsh`, if you can't do that, add this to your bash profile
```
export SHELL=/bin/zsh
exec /bin/zsh -l
```
or do this
```
rm /home/$USER/.bash_profile
ln -s /home/$USER/dotfiles/zsh/bash_profile /home/$USER/.bash_profile
```

You can also install my zshrc!
```
rm /home/$USER/.zshrc
ln -s /home/$USER/dotfiles/zsh/zshrc /home/$USER/.zshrc
```

### Installing BASH things
```
rm /home/$USER/.bash_profile
ln -s /home/$USER/dotfiles/bash/bash_profile /home/$USER/.bash_profile
```


### Quorum specific
```
rm -rf .git/hooks/pre-commit; cwd=$(pwd); ln -s $cwd/tests/pre-commit.sh $cwd/.git/hooks/pre-commit
```
