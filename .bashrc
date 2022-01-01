#        _       _                _      
#       | |     | |              (_)     
#   __ _| |_ __ | |__   __ ___  ___ _ __ 
#  / _` | | '_ \| '_ \ / _` \ \/ / | '__| Shivaji Chalise (alphajr)
# | (_| | | |_) | | | | (_| |>  <| | |    http://www.github.com/shivajichalise
#  \__,_|_| .__/|_| |_|\__,_/_/\_\ |_|   
#         | |                   _/ |     
#         |_|                  |__/      
#
# DOTBASHRC

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Run startx on login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	  exec startx
fi

# EXPORTS
export PS1='\[\e[0m\][\[\e[0;2;38;5;214m\]\u\[\e[0m\]@\[\e[0;91m\]\h\[\e[0m\]] \[\e[0m\]\W \[\e[0m\]$(parse_git_branch)\[\e[0m\]› \[\e[0m\]'
export HISTCONTROL=ignoredups:erasedups                 # no duplicate entries
export TERM="xterm-256color"                            # getting proper colors
# export MANPAGER="nvim -c 'set ft=man' -"              # nvim as manpager
export EDITOR="vim"
export PATH="~/.config/composer/vendor/bin:$PATH"

# ALIASES
alias wifi='nmtui'
alias vim='nvim'
alias vi3='nvim ~/.config/i3/config'
alias vpolybar='nvim ~/.config/polybar/config'
alias install='sudo pacman -S'
alias config='/usr/bin/git --git-dir=/home/alphajr/dotfiles/ --work-tree=/home/alphajr' #git bare alias
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias dmon='$HOME/.config/mysh/dualmon.sh' # dual monitor detection
alias lamp='sudo systemctl start {httpd,mariadb}'
alias lampstop='sudo systemctl stop {httpd,mariadb}'

# Changing "ls" to "exa"
alias ls='exa -l --color=always --group-directories-first'    # my preferred listing
alias la='exa -al --color=always --group-directories-first'   # all files and dirs

# Confirm before overwriting something
alias cp="cp -ig"
alias mv='mv -ig'
alias rm='rm -i'

# NAVIGATION
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# EXIT
alias :q="exit"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Show git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
