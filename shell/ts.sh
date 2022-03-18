#!/bin/bash
set -e

# defaut date format
fmt='+%Y-%m-%d %H:%M:%S.%3N'

if [ -n "$1" ]; then
        fmt="$1"
fi

if [ -p /dev/stdin ]; then
        while IFS= read line; do
                if [ -n "$fmt" ]; then
                        echo "$(date "$fmt") ${line}"
                else
                        echo "$(date) ${line}"
                fi
        done
fi
