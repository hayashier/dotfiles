# Auto completion
autoload -U compinit
compinit

autoload -Uz colors
colors

setopt hist_expand
setopt inc_append_history
setopt correct

# VCS settings
autoload -Uz vcs_info    
setopt prompt_subst    

zstyle formats '][* %F{green}%b%f'    
zstyle actionformats '][* %F{green}%b%f(%F{red}%a%f)'    
precmd() { vcs_info }    
PROMPT='${vcs_info_msg_0_}:%~/%f '

# Validate zsh command history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=16384
SAVEHIST=16384

setopt share_history
setopt notify

# display result of `ls` command after moving with `cd` command
setopt auto_cd
function chpwd() { ls }

# Go
export GOPATH=${HOME}/.golang
export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin

# Maven
export M3_HOME=/usr/local/apache-maven-3.3.9
M3=$M3_HOME/bin
export PATH=$M3:$PATH

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# PHP
export PATH=/usr/local/php5/bin:$PATH

# Coloring result of `less` command
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/shogo/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/shogo/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/shogo/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/shogo/google-cloud-sdk/completion.zsh.inc'
fi

# Enable to Direnv
eval "$(direnv hook zsh)"

# For display of various animals saying dictum
COWS=( `cowsay -l | grep -v ^Cow | cut -f1-` )
cowsay -f ${COWS[$((RANDOM%${#COWS[@]}))]} $(fortune)

# SSH agent
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa

# Alias settings
alias gip='curl inet-ip.info'

## tmux configuration
alias t='tmux'
alias tnew='(){tmux new -s $1}'
alias tkill='(){tmux kill-session -t $1}'
alias tls='tmux ls'
alias ta='(){tmux a -t $1}'
alias texit='tmux kill-server'

## Docker configuration
alias dstart='docker-machine start default'
alias dup='eval $(docker-machine env default) && docker-compose up'
alias dcom='(){ docker-compose run web $* }'
alias dbuild='eval $(docker-machine env default) && docker-compose build'
alias denv='docker-machine start default && eval $(docker-machine env default)'
alias dbash='docker-compose run web bash'
alias dmysql='docker-compose run web mysql -hdb -uroot -proot'
alias dmigrate='eval $(docker-machine env default) && docker-compose run web php ./oil refine migrate'

## PostgreSQL
alias pqstart='postgres -D /usr/local/var/postgres'

# Mario AI Competition 2009~2012
## https://sites.google.com/a/marioai.com/www/gameplay-track/getting-started
alias mario='(){
  if [ "$1" != "" ]; then
     java ch.idsia.scenarios.Play $1 -classpath ~/workspace/mario/MarioAI+Benchmark/bin/
  else
     java -classpath ~/workspace/mario/MarioAI+Benchmark/bin/ ch.idsia.scenarios.Play
  fi
 }'
## http://www.marioai.org/LevelGeneration/getting-started
alias mario2='(){
  if [ "$1" != "" ]; then
     java dk.itu.mario.engine.Play $1 -classpath ~/workspace/mario/MarioLevelComp2011/bin/
  else
     java -classpath ~/workspace/mario/MarioLevelComp2011/bin/ dk.itu.mario.engine.Play
  fi
 }'
alias mario3='(){
  if [ "$1" != "" ]; then
     java dk.itu.mario.engine.Play $1 -classpath ~/workspace/mario/MarioLevelComp/bin/
  else
     java -classpath ~/workspace/mario/MarioLevelComp/bin/ dk.itu.mario.engine.Play
  fi
 }'
## http://julian.togelius.com/mariocompetition2009/gettingstarted.php
alias mario4='(){
  if [ "$1" != "" ]; then
     java ch.idsia.scenarios.Play $1 -classpath ~/workspace/mario/marioai/classes/
  else
     java -classpath ~/workspace/mario/marioai/classes/ ch.idsia.scenarios.Play
  fi
 }'

export PATH=$PATH:/Users/shogo/.nodebrew/current/bin
eval $(/usr/libexec/path_helper -s)

tmux
