#!/usr/bin/env zsh

# Run without downloading:
# curl https://raw.githubusercontent.com/wesselvanree/dotfiles/HEAD/macos.sh | bash

echo "Hello $(whoami)! Let's get you set up."

echo "Installing Command Line Tools..."
xcode-select --install || echo "Command Line Tools already installed!"

mkdir -p ~/code

# set global git config
printf "Do you want to configure your git user? (Y/n): "
read -r configure_git_user

if [[ $configure_git_user == "Y" || $configure_git_user == "y" ]]
then
    printf "Enter your git name (leave empty to skip): "
    read -r git_user

    printf "Enter your git email (leave empty to skip): "
    read -r git_email

    if [[ ! -z "$git_user" ]]; then
        git config --global user.name "$git_user"
        echo "git config --global user.name \"$git_user\""
    fi

    if [ ! -z "$git_email" ]; then
        git config --global user.email "$git_email"
        echo "git config --global user.email \"$git_email\""
    fi
fi


printf "Do you want to install packages? (Y/n): "
read -r install_packages

if [[ $install_packages == "Y" || $install_packages == "y" ]]
then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "Installing Node.js..."
    brew install node

    echo "Installing Shopify CLI..."
    brew tap shopify/shopify
    brew install shopify-cli
fi

echo "\nFinal Steps"
echo "Setup SSH with Github:"
echo "https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent"
echo "Setup GPG with Github:"
echo "https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification"
echo "Download GPG Suite:"
echo "https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification"
