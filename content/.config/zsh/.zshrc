export CLICOLOR=1
autoload -U colors && colors
PS1="%{$fg[white]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
alias ls='ls --color=auto'

# Ruby versions are managed by RVM
export PATH="$PATH:$HOME/.rvm/bin"

# NodeJS versions are managed by NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
