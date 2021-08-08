#!/bin/bash

echo "Hello $(whoami)! Let's set up your local environment."

homebrew_installed="false"
brew help > /dev/null 2>&1 && homebrew_installed="true"

if [[ $homebrew_installed == "false" ]]
then
    read -p "Homebrew not found on this machine, do you want to install homebrew? (Y/n): " install_homebrew < /dev/tty

    if [[ $install_homebrew == "Y" || $install_homebrew == "y" ]]
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

vscode_installed="false"
code -v > /dev/null 2>&1 && vscode_installed="true"

if [[ $vscode_installed == "true" ]]
then
    echo "VSCode 'code' command detected!"
    read -p "Do you want to install VSCode extensions? (Y/n): " install_vscode_extensions < /dev/tty

    if [[ $install_vscode_extensions == "Y" || $install_vscode_extensions == "y" ]]
    then
        code --install-extension github.github-vscode-theme
        code --install-extension ritwickdey.liveserver
        code --install-extension eamodio.gitlens
        code --install-extension pkief.material-icon-theme
        code --install-extension dbaeumer.vscode-eslint
        code --install-extension esbenp.prettier-vscode
        code --install-extension ms-vscode.atom-keybindings
    fi
else
    echo "Could not find VSCode 'code' command."
fi

printf "\nDone!\n\n"
say Done
