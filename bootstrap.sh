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

doRsync(){ 
  	puts "Syncing"
    	rsync --exclude ".git/" \
		--exclude "installers/" \
 	       	--exclude "bootstrap.sh" \
        	--exclude "README.md" \
	        --exclude "LICENSE" \
       	 	--exclude ".gitignore" \
	 	--filter=':- .gitignore' \
		-avh --no-perms . ~;
}

doInstall() {
	puts "Installing helpers"
	source "$DOTFILES/installers/kerl.sh"
	source "$DOTFILES/installers/kiex.sh"
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
	doRsync
}

if [ "$1" == "--sync" ]; then
	doRsync
elif [ "$1" == "--install" ]; then
	doInstall
else
	doAll
fi

#Always reload the config/shell environment
reloadConfig
