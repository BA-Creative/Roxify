#!/bin/bash

clear;
: '
    Run --> sh init.sh
    to initialise the project
'

text_log() { echo "\n ### $1 "; }

printf "======================================================== \n";
printf "Please enter a Shopify Store handle \n";
printf "Example: \"online-store\" for online-store.myshopify.com \n\n";
read -p "--> " myshopify;
printf "\n\n========================================================\n\n";

root="$PWD/$myshopify"

if [ -d $root ]; then
    echo "\n!!! Folder already exists. Please DELETE or RENAME the existing folder, then try again. \n";
    exit;
fi

# Create directory
mkdir -p $root;

# Clone lastest version of Dawn
git clone "https://github.com/Shopify/dawn.git" $root;

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
    curl -s "$base_url/$branch/$file" -o "$root/$file"
done