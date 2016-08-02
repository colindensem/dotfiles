mkdir $HOME/bin
cd $HOME/bin && { 
	curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl; 
	cd -; 
}
chmod a+x $HOME/bin/kerl

