#!/bin/sh

# Don't bother if it's not Darwin
if [ "$(uname)" != "Darwin" ]; then
  echo 'Not in macOS. Skipping `brew`'
  exit
fi

# Skip if already installed
if [ `which brew` ]; then
  echo '`brew` already installed.'
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Run Brewfile
current_dir=`pwd`
cd "$(dirname "$0")" && brew bundle
cd $current_dir
