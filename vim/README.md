
### Installing your Vim environment on another machine

Once your vim configuration is under version control, it’s quite straightforward to import your settings to any machine that has git installed. If you followed the instructions above to put your vimrc and plugins in a dotvim directory, then you can follow these steps to synchronise them to another machine:
```
cd ~
rm -rf ~/.vim
git clone git@github.com:tyrocca/vimrc.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall

if gvim
ln -s ~/.vim/gvimrc ~/.gvimrc

```


###Keeping your dotfiles in git (if lost)

The following instructions assume that your home directory contains a .vimrc file, a .vim directory and a .gvimrc file (optional)

Move the .vimrc and .gvimrc files into the .vim directory:
```
mv .vimrc ~/.vim/vimrc
mv .gvimrc ~/.vim/gvimrc
```
Create symbolic links so that `~/.vimrc` points to the `~/.vim/vimrc` file:
```
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
```

Change to the .vim directory, and initialize it as a git repository:
```
cd ~/.vim
git init
```
Add all files, and make an initial commit:
```
git add .
git commit -m "Initial commit"
```

source: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
