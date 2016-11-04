#!/bin/sh

# Setup user and email
LOCAL_CONFIG=$HOME/.gitconfig.local

if [ ! -f $LOCAL_CONFIG ]; then
  printf "Git username: "
  read username

  printf "Git email: "
  read email

  cat << EOF > $LOCAL_CONFIG
[user]
  name = ${username}
  email = ${email}
EOF
fi

# Download last version of diff-highlight
if [ ! -f ~/bin/diff-highlight ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight > ~/bin/diff-highlight && chmod +x ~/bin/diff-highlight
fi
