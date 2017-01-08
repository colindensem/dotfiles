source ~/.bash/aliases
source ~/.bash/colours
source ~/.bash/env
source ~/.bash/functions
source ~/.bash/paths


if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi
