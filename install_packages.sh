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

# Creates symlinks to dotfiles and other files in home directory
source ./create_links.sh
