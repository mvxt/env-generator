#!/bin/bash
##############################################
# For all dotfiles in the directory, creates
#  a symlink from the home directory to source
#  in this repo. If file exists in home, move files
#  to .bak
##############################################

DOTFILES=(
  ".profile"
  ".tmux.conf"
  ".gitconfig"
)

PROFILES=(
  ".bashrc"
  ".zshrc"
)

# Folder to back up files to if they exist
mkdir -p backup

# Move standard dotfiles first
for f in "${DOTFILES[@]}"; do
    echo "Creating symbolic link for $f..."

    # If file/directory exists, move it to backups dir
    if [ -f ~/$(basename $f) ] || [ -d ~/$(basename $f) ]; then
        mv ~/$(basename $f) ./backup/
    fi

    ln -s $(pwd)/$f ~/$(basename $f)
done

# Move profiles separately since they require special logic
for f in "${PROFILES[@]}"; do
    echo "Sourcing $(pwd)/$f in existing $f..."

    # If file exists, move it to backups dir
    if [ -f ~/$(basename $f) ]; then
        mv ~/$(basename $f) ./backup/
    fi

    touch ~/$(basename $f)
    echo "source $(pwd)/$f" >> ~/$(basename $f)
    echo "source $(pwd)/.aliases" >> ~/$(basename $f)
done

# Move vim/nvim files
mkdir -p ~/.config/nvim
ln -s ~/env-generator/init.vim ~/.config/nvim/init.vim
