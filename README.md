# dotfiles
Dotfile management

# Requirements
You need to use stow. I think it usually comes with Linux but it doesn't come with Mac OSX, so install it with:
```
brew install stow
```

# Setup
To use these dotfiles, make a backup of your current dotfiles, e.g.
```
mv ~/.bash_profile ~/.bash_profile_old
```
then cd into this git repo.

To start using the `.bash_profile` file type the following:
```
stow bash
```
This copies the `.bash_profile` file into your home directory and makes a symlink back to here.

To start using the `.vimrc` file type the following:
```
stow vim
```
This copies the `.vimrc` file into your home directory and makes a symlink back to here.

And it's the same for the `.inputrc` in the input folder and and `.gitconfig` file in the git folder.

# Vim setup
There is a lot of customisation. A lot of it comes from a good tutorial on setting up your vim environment for coding:
https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

To make the vim setup work as I have follow these instructions.
Make sure you update your vim to version 8:
```
brew install macvim --with-override-system-vim
```
Then close your terminal and reopen it and verify that it is indeed version 8 or greater with the command
```
vim --version | grep IMproved
```
The output should be something like:
```
VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Apr 20 2017 20:02:24)
```
You will also need to install vundle:
```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Now open up a vim file and type:
```
:PluginInstall
```
It should open a panel and start downloading the plugins.
Then you need to install YouCompleteMe:
```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
If that throws an error, you may be missing cmake, so install it with
```
brew install cmake
```

You will probably also need to install a font that has the powerline special characters.
My preferred font is Meslo LG M which I downloaded from
https://github.com/powerline/fonts/tree/master/Meslo%20Slashed

You can then update your font used by your terminal.

You'll also want to install FZF as a commandline utility too:
```
brew install fzf
```

# Fish setup
Install the fish and omf directories underneath `~/.config`, so create it if necessary:
```
mkdir -p ~/.config
```
and then run stow
```
stow config -t ~/.config/
```

You need to install fish. You can do so with brew:
```
brew install fish
```
Next you will want to install oh-my-fish
```
curl -L https://get.oh-my.fish | fish
```

# Mutt setup
This took a long time to do and I didn't document it, so this will be an imperfect recollection.
Here are some packages to install:
```
brew install msmtp --with-gsasl
brew install lua
brew install imapfilter
brew install mutt-notmuch
brew install links
brew install offlineimap
brew tap sgeb/mutt
brew install sgeb/mutt/mutt --with-sidebar-patch
```
All the config files are in the mutt directory of these dotfiles, so just type:
```
stow mutt
```
to symlink them all.



# Usage
Now you can edit the `.bash_profile`, `.vimrc`, `.inputrc` and `.gitconfig` files directly in your home
directory and they will get updated in the git repo.
Once you've made a few changes you can then send them back to github.
