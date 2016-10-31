# Always append to the history file
shopt -s histappend
PROMPT_COMMAND='history -a'

# Force oe line for multiline commands
shopt -s cmdhist

# Make history a bit bigger
HISTFILESIZE=1000000
HISTSIZE=1000000

# ..and ignore stupid stuff
HISTCONTROL=ignoreboth
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
