#!/bin/sh

DOTFILES=`pwd`
set -e

# Shamelessly copied from https://github.com/holman/dotfiles
link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        echo "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      echo "Removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      echo "Moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      echo "Skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    echo "Linked $1 to $2"
  fi
}

# Link all relevant files
overwrite_all=false
backup_all=false
skip_all=false
echo 'Installing dotfiles...'
echo $DOTFILES
for src in $(find -H $DOTFILES -maxdepth 2 -name '*.symlink' -not -path '*.git*')
do
  echo $src
  dst="$HOME/.$(basename "${src%.*}")"
  link_file "$src" "$dst"
done


# Find all the installers and execute them
find $DOTFILES -name install.sh -mindepth 2 | while read installer; do
  echo "Running \`$installer\`..."
  sh -c "${installer}"
done

# Post-install checks (setup proper shell, etc)
