#!/bin/bash

echo "Hello $(whoami)! Let's get you set up."

homebrew_installed="false"
brew help > /dev/null 2>&1 && homebrew_installed="true"

if [[ $homebrew_installed == "false" ]]
then
    read -p "Homebrew not found on this machine, do you want to install homebrew? (Y/n): " install_homebrew < /dev/tty

    if [[ $install_homebrew == "false" ]]
    then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && homebrew_installed="true"
    fi
else
    echo "Homebrew is already installed on this machine."
fi


if [[ $homebrew_installed == "true" ]]
then
    read -p "Do you want to install packages? (Y/n): " install_packages < /dev/tty

    if [[ $install_packages == "Y" || $install_packages == "y" ]]
    then
        echo "Installing Shopify CLI..."
        brew tap shopify/shopify
        brew install shopify-cli

        echo "Installing GPG"
        brew install gnupg

        echo "Installing n and Node.js..."
        brew install n
        n lts
    fi
fi

printf "\nDone!\n\n"
