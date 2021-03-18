#!/bin/sh

#Get updates
updates=$(dnf list upgrades -q | wc -l)

# Remove the extra empty line
let "updates=$updates - 1"

# Check if dnf returns an integer. If not, let the user know something went wrong.
if expr "$updates" : '[0-9][0-9]*$'>/dev/null; then
  if [ "$updates" -gt 0 ]; then
    echo "$updates"
  fi
else
  echo "Error"
fi

