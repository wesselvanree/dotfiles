#!/usr/bin/env bash

echo "Hello $(whoami)! Let's get you set up."

echo "Installing Command Line Tools if not installed..."
xcode-select -p > /dev/null 2>&1

echo "Creating code directory..."
mkdir -p ~/code

# set global git config
read -p "Do you want to configure your git user? (Y/n): " configure_git_user < /dev/tty

if [[ $configure_git_user == "Y" || $configure_git_user == "y" ]]
then
    read -p "Enter your git name (leave empty to skip): " git_user < /dev/tty
    read -p "Enter your git email (leave empty to skip): " git_email < /dev/tty

    if [[ ! -z "$git_user" ]]; then
        git config --global user.name "$git_user"
        echo "git config --global user.name \"$git_user\""
    fi

    if [ ! -z "$git_email" ]; then
        git config --global user.email "$git_email"
        echo "git config --global user.email \"$git_email\""
    fi
fi

printf "\nDone!\n\n"
