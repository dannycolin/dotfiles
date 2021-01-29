#!/bin/sh

updates=$(dnf check-update -q | sed '/^\s*$/d' | wc -l)

if [ "$updates" -gt 0 ]; then
    echo "$updates"
else
    echo ""
fi
