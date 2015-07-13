#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ ! -f $DIR/.vimrc ]; then
    echo "$DIR/.vimrc not found."
    exit 1
fi

cp -i $DIR/.vimrc ~/.vimrc
