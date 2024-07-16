#!/bin/bash

: '
    Run --> sh init.sh
    to initialise the project
'

text_log() { echo "\n ### $1 "; }

# read bash parameters
: '
    -f
    --force

    v15
'
__force=false;
base_url="https://raw.githubusercontent.com/BA-Creative/Roxify"
branch="v15"

for p in $@; do
    if [ $p == "--force" ] || [ $p == "-f" ]; then
        __force=true
    fi
    if [[ $p == *"v"* ]]; then
        branch=$p
    fi
done

files=(".shopifyignore")
for file in "${files[@]}"
do
    curl -s "${base_url}/${branch}/${file}" -o "${PWD}/${file}"
done