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


# Alias settings
## tmux configuration
alias t='(){tmux}'
alias tnew='(){tmux new -s $1}'
alias tkill='(){tmux kill-session -t $1}'
alias tls='(){tmux ls}'
alias ta='(){tmux a -t $1}'
alias texit='(){tmux kill-server}'

## Docker configuration
alias dstart='(){docker-machine start default}'
alias dup='(){eval $(docker-machine env default) && docker-compose up}'
alias dbuild='(){eval $(docker-machine env default) && docker-compose up --build}'
alias denv='(){eval $(docker-machine env default)}'
alias dbash='(){docker-compose run web bash}'
alias dmysql='(){docker-compose run web mysql -hdb -uroot -p}'
alias dmigrate='(){eval $(docker-machine env default) && docker-compose run web php ./oil refine migrate}'

HISTFILE="$HOME/.zsh_history"
HISTSIZE=16384
SAVEHIST=16384

setopt share_history
setopt notify

tmux

COWS=( `cowsay -l | grep -v ^Cow | cut -f1-` )
cowsay -f ${COWS[$((RANDOM%${#COWS[@]}))]} $(fortune)

