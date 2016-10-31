shopt -s autocd 2> /dev/null
shopt -s cdspell 2> /dev/null
shopt -s dirspell 2> /dev/null

# Allow `cd`ing into our $PROJECTS directory
CDPATH=".:$PROJECTS"
