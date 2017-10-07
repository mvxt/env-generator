#!/bin/bash
##############################################
# For all dotfiles in the directory, creates
#  a symlink from the home directory to source
#  in this repo. If file exists in home, move files
#  to .bak
##############################################

# TODO: symlink all config and rc files in home to dotfiles
# TODO: If symlink creation fails because file exists,
#   move existing file to $FILE.bak

FILES=$(pwd)/.*

for f in $FILES; do
    echo "Creating symbolic link for $f..."
    if [[ $(ln -s $f ~/$(basename $f)) != 0 ]]; then
        mv ~/$(basename $f) ~/$(basename $f).bak
        ln -s $f ~/$(basename $f)) != 0
    fi
done
