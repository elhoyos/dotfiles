export NODE_PATH="/usr/local/lib/node_modules:/usr/local/lib/node:$NODE_PATH"
export NPM_BIN_PATH="/usr/local/share/npm/bin"
export PATH="$NPM_BIN_PATH:$PATH"

# brew bash_completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# git
GIT_PS1_SHOWDIRTYSTATE=true

# bash prompts
PS1='\W$(__git_ps1 "(%s)") $ '

eval "$(rbenv init -)"
