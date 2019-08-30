# dotfiles
Dotfile management

### Setting up a new laptop
Generate a new ssh key (set a password):
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

To start the ssh-agent in the background:
```
eval "$(ssh-agent -s)"
```
or you can use the `ssh-agent` plugin for zsh.

Then add the ssh key to the agent and store the password in keychain (Mac OSX specific):
```
ssh-add -K ~/.ssh/id_rsa
```
Add the ssh key to github.com.

Install homebrew (Mac OSX specific):
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install Nix (Linux specific):
```
curl https://nixos.org/nix/install | sh
```
Note: I should probably move away from dotfiles to something more like: https://github.com/nmattia/homies
(see article: https://www.nmattia.com/posts/2018-03-21-nix-reproducible-setup-linux-macos.html)



### Requirements
You need to use stow. Install it with:
```
brew install stow
```
or
```
nix-env -i stow
```

### Setup
Clone the dotfiles repo:
```
mkdir -p ~/src/github.com/mec07
cd ~/src/github.com/mec07
git clone git@github.com:mec07/dotfiles.git
cd dotfiles
```

To use these dotfiles, make a backup of your current dotfiles, e.g.
```
mv ~/.bash_profile ~/.bash_profile_old
mv ~/.bashrc ~/.bashrc_old
```
Note that if you're going to use the fish/zsh shell, you don't really care about the `.bash_profile` anymore.

To start using the `.bash_profile` & `.bashrc` files type the following:
```
stow -t $HOME bash
```
This copies the `.bash_profile` & `.bashrc` files into your home directory and makes a symlink back to here.

To start using the `.vimrc` file type the following:
```
stow -t $HOME vim
```
This copies the `.vimrc` file into your home directory and makes a symlink back to here.

Annoyingly for the snippets we have to do a couple of extra steps (although on linux I didn't have to do this...):
```
cd vim
stow -t $HOME/.vim
cd ..
```

Copy the ssh config file:
```
stow -t $HOME ssh
```

If you're going to use zsh then:
```
stow -t $HOME zsh
```

And it's the same for the input and git folders:
```
stow -t $HOME input
stow -t $HOME git
stow -t $HOME nix
```

### Git
Annoyingly you will have to manually update the home directories mentioned in the `.gitconfig` file to match the home directory of the laptop you're using.
Don't forget to add your new public ssh key to github.com.

### Fish setup
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

### Zsh setup
Install zsh:
```
brew install zsh
```
Then install oh-my-zsh:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
There is a nice article about it (it also includes setting up colours in iterm2): https://medium.com/ayuth/iterm2-zsh-oh-my-zsh-the-most-power-full-of-terminal-on-macos-bdb2823fb04c

### Vim setup
There is a lot of customisation. A lot of it comes from a good tutorial on setting up your vim environment for coding:
https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

To make the vim setup work as I have follow these instructions.
Make sure you update your vim to version 8:
```
brew install vim
```
or
```
nix-env -i vim
```
Then close your terminal and reopen it and verify that it is indeed version 8 or greater with the command
```
vim --version | grep IMproved
```
The output should be something like:
```
VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Apr 20 2017 20:02:24)
```
You will also need to install vim-plug (https://github.com/junegunn/vim-plug):
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Now open up a vim file and type:
```
:PlugInstall
```
It should open a panel and start downloading the plugins.

You will also need to install the go binaries for `vim-go` to work properly:
```
:GoInstallBinaries
```

If you want to use powerline (I have commented it out as I don't use it anymore...):
You will probably also need to install a font that has the powerline special characters.
My preferred font is Meslo LG M which I downloaded from
https://github.com/powerline/fonts/tree/master/Meslo%20Slashed

You can then update your font used by your terminal.

You'll also want to install FZF as a commandline utility too:
```
brew install fzf
```

Note: you can format your comment blocks (or code) with `gqq` for 1 line,
`gq2j` for 2 lines, etc. or just highlight the lines to format (in visual mode)
and do: `gq`.

### gh tool

Setup gh tool:
https://github.com/jdxcode/gh
```
mkdir -p ~/src/github.com/jdxcode
cd ~/src/github.com/jdxcode
git clone git@github.com:jdxcode/gh.git
```
To install in zsh (with oh-my-zsh):
```
ln -s ~/src/github.com/jdxcode/gh/zsh/gh ~/.oh-my-zsh/custom/plugins/gh
ln -s ~/src/github.com/jdxcode/gh/zsh/bb ~/.oh-my-zsh/custom/plugins/bb
```
You may have to refresh the zsh autocompletions dumpfile:
```
rm $HOME/.zcompdump-*
```

For fish shell:
```
ln -s ~/src/github.com/jdxcode/gh/functions/gh.fish ~/.config/fish/functions/gh.fish
ln -s ~/src/github.com/jdxcode/gh/completions/gh.fish ~/.config/fish/completions/gh.fish
```


### Mutt setup

This took a long time to do and I didn't document it, so this will be an imperfect recollection.
Here are some packages to install:
```
brew install msmtp --with-gsasl
brew install lua
brew install imapfilter
brew install mutt-notmuch
brew install links
brew install offlineimap
brew install neomutt/homebrew-neomutt/neomutt
```
All the config files are in the mutt directory of these dotfiles, so just type:
```
stow mutt
```
to symlink them all.

To open up mutt just type:
```
mutt
```

To sync your mailboxes just run offlineimap in a terminal:
```
offlineimap
```


### Usage
Now you can edit the `.bash_profile`, `.vimrc`, `.inputrc` and `.gitconfig` files directly in your home
directory and they will get updated in the git repo.
Once you've made a few changes you can then send them back to github.
