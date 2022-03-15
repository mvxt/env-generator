#!/bin/bash
##############################################
# Runs a bunch of administrative tasks
#  such as installing packages/dependencies
#  as well as setting up other critical items
#  like configuration files
##############################################

#######################
## Installs packages ##
#######################
DIST=$(uname)
if [[ "$DIST" == "Darwin" ]]; then
    source Darwinfile
elif [[ "$DIST" == "Linux" ]]; then
    source Linuxfile
    # TODO: Differentiate between debian and ubuntu, apt-get vs yum
    for p in $PACKAGES; do
        sudo apt-get install -y $p
        echo 'Installed ' $p
    done
    for f in $FUNCTIONS; do
        $f
    done
else
    echo 'INFO: distribution ${DIST} not currently supported'
    exit 0
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Creates symlinks to dotfiles and other files in home directory
source ./create_links.sh

# Installs NVM and adds NVM hook into .zshrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

cat > ~/.zshrc <<- EOF
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOF
