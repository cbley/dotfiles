# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="frisk"

. ~/.zsh/aliases.zsh

plugins=(git bundler brew mercurial osx pip rvm)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# add local configs
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

# startup virtualenv-burrito
#if [ -f $HOME/.venvburrito/startup.sh ]; then
#    source $HOME/.venvburrito/startup.sh
#fi
