#!/bin/sh

#Get updates
updates=$(dnf list upgrades -q | wc -l)

# Check if dnf returns an integer. If not, let the user know something went wrong.
if expr "$updates" : "[0-9]" > /dev/null; then
  if [ "$updates" -gt 0 ]; then
    let "updates=$updates -1"
    echo "U: $updates"
  else
    echo ""
  fi
else
  echo "U: Error"
fi

