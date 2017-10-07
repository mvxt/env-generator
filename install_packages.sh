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
    # TODO: install xcode
    # TODO: install brew
    # TODO: use brew and Brewfile, Caskfile to install apps
else
    source Linuxfile
    # TODO: Differentiate between debian and ubuntu, apt-get vs yum
    # TODO: Install all packages in packages array
    for p in $PACKAGES; do
        sudo apt-get install -y $p
        echo 'Installed ' $p
    done
fi


# # Auto-load redshift on startup
# sudo echo << EOF > /etc/init.d/redshift.sh
# #!/bin/sh
# echo "Starting redshift"
# redshift
# EOF

# sudo chmod +x /etc/init.d/redshift.sh
# sudo update-rc.d /etc/init.d/redshift.sh defaults 100

################################
## Installs fuzzy file finder ##
################################
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

############################
## Installs emacs plugins ##
############################
git submodule init
cd .emacs.d/plugins/helm && make

# ##################################
# ## Miscellaneous Administrative ##
# ##################################
# # Disables guest sessions
# sudo sh -c "echo 'allow-guest=false' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf"

# # Show name in top right panel
# gsettings set com.canonical.indicator.session show-real-name-on-panel true

# # One-click minimize on tray icons
# gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
