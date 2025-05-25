#!/bin/bash

# Append to our .bashrc
echo "
# Alias Definitions
# this line shoves all the aliases into a .bash_aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Environment Variables
#this line defines all the environment variables in a seperate file
if [ -f ~/.bash_vars ]; then
    . ~/.bash_vars
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> ~/.bashrc
