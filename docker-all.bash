#!/bin/bash

function execute {
    dir=$(dirname $1)
    file=$(basename $1)
    cd $dir
    bash $file
}

export -f execute
find . -name 'docker.bash' -exec bash -c 'execute "$0"' {} \;