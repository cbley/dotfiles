# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gianu"

. ~/.zsh/aliases.zsh

plugins=(git brew mercurial pip)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# add local configs
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi


