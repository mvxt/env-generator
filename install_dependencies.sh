#!/bin/bash

PACKAGES=git node emacs tmux markdown

###############################
#####   COPIED SECTION   ######
###############################
# Download and install command line tools, automated
# See http://apple.stackexchange.com/questions/107307/how-can-i-install-the-command-line-tools-completely-from-the-command-line
#  Also see http://www.mokacoding.com/blog/how-to-install-xcode-cli-tools-without-gui/,
#  where I downloaded the following snippet of code from.

echo "Checking Xcode CLI tools"
# Only run if the tools are not installed yet
# To check that try to print the SDK path
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Xcode CLI tools not found. Installing them..."
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$PROD" -v;
else
  echo "Xcode CLI tools OK"
fi

###############################
##### END COPIED SECTION ######
###############################

# Install brew, update, upgrade
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# Install rvm, Ruby Version Manager.
# No documentation download
echo "gem: --no-document" >> ~/.gemrc
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails

# Install latest default ruby
rvm get stable
rvm use ruby --install --default

# Install all packages listed above in $PACKAGES
brew install $PACKAGES

# Install .oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
