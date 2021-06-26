#!/bin/bash
yes | sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade
yes | sudo apt-get install git zsh python3 curl wget python3-pip

# brew
echo "======================== brew ========================="
BREW_INSTALL_COMMAND="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW_DIR="/home/linuxbrew"
if [ -d "$BREW_DIR" ]; then
  echo "Do you want to reinstall brew? (yes), followed by [ENTER]"
  select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Reinstalling brew start"; sudo rm -rf $BREW_DIR; yes | /bin/bash -c "$BREW_INSTALL_COMMAND"; break;;
        No ) echo "Installing brew abort"; break;;
    esac
  done
else
  echo "Installing brew start"
  yes | /bin/bash -c "$BREW_INSTALL_COMMAND"
fi

# n
echo "======================== n ========================="
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
sudo bash n lts

echo "======================== Setup Script finished ========================"
