#!/bin/bash

DIR="`dirname "${0}"`/scratch-gui"

if [ -d "$DIR" ]; then
    # update existing scratch repository
    cd $DIR
    git pull origin develop
    cd ..
else
    # clone whole new scratch repository
    git clone https://github.com/LLK/scratch-gui.git
fi

docker build -t scratch:latest .
