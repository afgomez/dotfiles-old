#!/bin/sh

set -e


# Link all relevant files

# Find all the installers and execute them
find . -name install.sh -mindepth 2 | while read installer; do
  echo "Running \`$installer\`..."
  sh -c "${installer}"
done
