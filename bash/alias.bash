alias ..='cd ..'
alias cd='>/dev/null cd'

if [ `uname -s` == "Darwin"   ]; then
  alias ls='ls -FG'
else
  alias ls='ls --color=yes'
fi
alias ll='ls -l'
alias la='ls -A'

# Augment git
type hub >/dev/null 2>&1 && alias git='hub'

# Syntaxt highlight cat
function ccat {
  type pygmentize >/dev/null 2>&1 || exit

  if [ "$ITERM_PROFILE" == "Demos" ]; then
    style="solarizedlight"
  else
    style="monokai"
  fi

  pygmentize -O style=$style -f console256 -g $*
}

alias reload='source ~/.bash_profile'
