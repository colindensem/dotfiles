#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DOTFILES=`pwd -P`
popd > /dev/null

puts() {
 printf "\033[00;34m$@\033[0m\n"
}

doUpdateRepo() {
	puts "Updating repository"
	git pull origin master
}


doLink() {
  ln -s $DOTFILES/.bash ~/.bash
  ln -s $DOTFILES/.bash_profile ~/.bash_profile
  ln -s $DOTFILES/.bashrc ~/.bashrc
  ln -s $DOTFILES/.editorconfig ~/.editorconfig
  ln -s $DOTFILES/.gemrc ~/.gemrc
  ln -s $DOTFILES/.gitconfig ~/.gitconfig
  ln -s $DOTFILES/.gitignore ~/.gitignore
  ln -s $DOTFILES/.tmux.conf ~/.tmux.conf
  ln -s $DOTFILES/.zshrc ~/.zshrc

}

doInstall() {
	puts "Installing helpers"
	source "$DOTFILES/installers/kerl.sh"
	source "$DOTFILES/installers/kiex.sh"
	source "$DOTFILES/installers/nvm.sh"
	source "$DOTFILES/installers/rbenv.sh"
}

reloadConfig() {
	puts "Reloading Config"
	git config --global core.excludesfile ~/.gitignore_global
	puts "Reloading ZSH"
	exec $SHELL
}

doAll() {
	doUpdateRepo
	doInstall
  doLink
}

if [ "$1" == "--link" ]; then
	doLink
elif [ "$1" == "--update" ]; then
  doUpdateRepo
elif [ "$1" == "--install" ]; then
	doInstall
else
	doAll
fi

#Always reload the config/shell environment
reloadConfig
