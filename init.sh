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
'
__force=false;
for item in $@; do
    if [ $item == "--force" ] || [ $item == "-f" ]; then
        __force=true
    fi
done

# Create .shopifyignore file
shopifyignore="${PWD}/.shopifyignore"
if [ ! -f $shopifyignore ] || [ $__force == true ]; then
    /bin/cat <<EOM > $shopifyignore
src/*
EOM
fi

# Create SRC directory
source_dir="${PWD}/src/"
if [ ! -d $source_dir ] || [ $__force == true ]; then
  mkdir -p $source_dir; # /src
  mkdir -p "${source_dir}css"; # /src/css
  mkdir -p "${source_dir}scss"; # /src/scss
  mkdir -p "${source_dir}js"; # /src/js
fi