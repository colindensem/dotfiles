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

reloadConfig() {
	puts "Reloading Config"
	git config --global core.excludesfile ~/.gitignore_global
	puts "Reloading ZSH"
	exec /bin/zsh -l
}

doAll() {
	doUpdateRepo
	doRsync
}

if [ "$1" == "--sync" ]; then
	doRsync
else
	doAll
fi

#Always reload the config/shell environment
reloadConfig
