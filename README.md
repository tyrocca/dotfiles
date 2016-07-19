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
cwd=$(pwd)
git clone https://github.com/tyrocca/dotfiles.git
```
This installs the repo.

### Installing my vim setup
I use the color scheme solarized with the powerline fonts. 
- To get my colorscheme install [this](http://ethanschoonover.com/solarized).
- For powerline install [this](https://github.com/powerline/fonts).
- I also included some of the colorscheme configs in the dotfiles

Then install vim
```
cd ~/
cwd=$(pwd)
rm -rf $cwd/.vim
mkdir $cwd/.vim
rm $cwd/.vimrc
ln -s $cwd/dotfiles/vim/vimrc $cwd/.vimrc
vim
```

### Installing Tmux
If you don't have tmux install it
- Ubuntu: `sudo apt-get install tmux`
- Mac: `brew install tmux`

link my config files
```
cd ~/
cwd=$(pwd)
rm $cwd/.tmux.conf
ln -s $cwd/dotfiles/tmux/tmux.conf $cwd/.tmux.conf
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
cd ~/
cwd=$(pwd)
rm $cwd/.bash_profile
ln -s $cwd/dotfiles/zsh/bash_profile $cwd/.bash_profile
```

You can also install my zshrc!
##### Mac zshrc
```
cd ~/
cwd=$(pwd)
rm $cwd/.zshrc
ln -s $cwd/dotfiles/zsh/zsh-mac $cwd/.zshrc
```

##### Ubuntu zshrc
```
cd ~/
cwd=$(pwd)
rm $cwd/.zshrc
ln -s $cwd/dotfiles/zsh/zshrc $cwd/.zshrc
```

### Installing BASH things
```
cd ~/
cwd=$(pwd)
rm $cwd/.bash_profile
ln -s $cwd/dotfiles/bash/bash_profile $cwd/.bash_profile
```


### Quorum specific
```
cd quorum-site
rm -rf .git/hooks/pre-commit
cwd=$(pwd)
ln -s $cwd/tests/pre-commit.sh $cwd/.git/hooks/pre-commit
```
