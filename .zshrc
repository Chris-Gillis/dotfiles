export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
# Git shortcuts
alias gs="git status"
alias gfa="git fetch --all"

alias vim="nvim"

alias dcp="docker-compose -f docker-compose-ngrok.yml -f docker-compose.yml"
alias datt="docker attach amplify-app-1"
alias fixtest="RAILS_ENV=test rails db:setup && RAILS_ENV=test bundle exec rake"

export PATH=$PATH:$(go env GOPATH)/bin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=/Users/chris/.local/bin:$PATH
export PATH=/Users/chris/.local/nvim/bin:$PATH
export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
export FREEDESKTOP_MIME_TYPES_PATH=/Users/chris/freedesktop.org.xml

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(rbenv init - zsh)"

fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "$(zoxide init zsh)"
