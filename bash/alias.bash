alias ..='cd ..'
alias cd='>/dev/null cd'

if [ `uname -s` == "Darwin"   ]; then
  alias ls='ls -FG'
else
  alias ls='ls --color=yes'
fi
alias ll='ls -l'
alias la='ls -A'

# Alias vim to neovim
type nvim >/dev/null 2>&1 && alias vim='nvim'
type vimr >/dev/null 2>&1 && alias mvim='vimr'

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

# Keynote-bat: syntax highlighting for keynote (use with a light iTerm theme)
alias knbat='bat -p --theme=OneHalfLight'

alias reload='source ~/.bash_profile'
