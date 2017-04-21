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

# Usage
Now you can edit the `.bash_profile`, `.vimrc`, `.inputrc` and `.gitconfig` files directly in your home
directory and they will get updated in the git repo.
Once you've made a few changes you can then send them back to github.
