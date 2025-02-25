#!/bin/bash

text_log() { echo "### $1"; }
print_done_and_exit() { printf "\n~ DONE ~\n\n"; exit; }

clear;
# read bash parameters
: ' =======================================================
Local dev
    Run --> sh init.sh
    to initialise the project

===========================================================
Remote BASH script
    -f
    --force

    v15
===========================================================
'

branch="v15"

for p in $@; do
    if [[ $p == *"v"* ]]; then
        branch=$p
    fi
done

repo="BA-Creative/Roxify"
repo_ssh="git@github.com:BA-Creative/Roxify.git"
repo_zip="https://github.com/BA-Creative/Roxify/tar.gz/$branch"
repo_url="https://raw.githubusercontent.com/BA-Creative/Roxify"

printf "======================================================== \n";
printf "Please enter a Shopify Store handle \n";
printf "Example: \"online-store\" for online-store.myshopify.com \n\n";
read -p "--> " myshopify;
printf "\n========================================================\n\n";

root="$PWD/$myshopify"

if [ -d $root ]; then
    printf "!!! Folder already exists. Would you like to OVERWRITE ? \n";
    read -p "(y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || print_done_and_exit;
    rm -rf $root;
fi

# Create directory
mkdir -p $root;

# Clone lastest version of Dawn
git clone "https://github.com/Shopify/dawn.git" $root;

# Clone Roxify
curl -L "https://api.github.com/repos/$repo/tarball/$branch" | tar xzf - --strip-components=1 -C $root;

# Remove .git folder
rm -rf "$root/.git";

# Done
print_done_and_exit;