# dotfiles

Set up development environment on a new mac to start coding.

## Setting up a new mac

1. Set up SSH with Github
   - [Generate a new SSH key and add it to SSH agent](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
   - [Add SSH key to Github account](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
   - [Test SSH connection](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/testing-your-ssh-connection)
2. Run one of the following scripts:

   - Run `.macos` and install packages:

     ```bash
     curl -s https://raw.githubusercontent.comwesselvanree/dotfiles/HEAD/.macos | zsh && zsh~/dotfiles/.essentials && say done
     ```

   - Run `.macos`:

     ```bash
     curl -s https://raw.githubusercontent.com/wesselvanree/dotfiles/HEAD/.macos | zsh && say done
     ```

## Final Steps

### Set up GPG with Github

1. [Install GPG Suite](https://gpgtools.org)
2. [Setup GPG with Github](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification)

   - Create new key in GPG Suite
   - Get the key ID from the key you want to use from this command:

     ```
     gpg --list-secret-keys --keyid-format=long
     ```

   - Copy the key using the ID from the previous command:

     ```
     gpg --armor --export <ID> | pbcopy
     ```

   - Paste the key in Github GPG settings.
   - Configure Git:

     ```
     git config --global user.signingkey <ID>
     ```

     ```
     git config --global commit.gpgsign true
     ```
