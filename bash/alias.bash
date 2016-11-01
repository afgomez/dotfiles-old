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
type pygmentize >/dev/null 2>&1 && alias ccat='pygmentize -O style=monokai -f console256 -g'


alias reload='source ~/.bash_profile'
