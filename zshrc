# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="frisk"

. ~/.zsh/aliases.zsh

plugins=(git bundler brew mercurial osx pip rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export TEMP=/tmp
export TMP=/tmp

export PATH=/Users/chris/.venvburrito/bin:/usr/local/mysql/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/python:/Users/chris/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/chris/.rvm/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

bindkey -v

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    source $HOME/.venvburrito/startup.sh
fi

# add local configs
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
