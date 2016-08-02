# Dotfiles

> This is another dotfile repository.

This is set up for a remote tmux/emacs development VM in the cloud on LINUX.

** Feel free to use for inspiration or make a pull request for an improvement **

## Install

Use the bootstrap.sh script file to synch the dotfiles into your home directory.

```
cd ~
git clone https://github.com/ColinDensem/dotfiles.git
cd dotfiles
./bootstrap.sh
```

## Usage

Call bootstrap with options to save grind.
``` --sync``` 
Simply to rsync the config files. Skips GIT Updates.
