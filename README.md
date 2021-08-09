# dotfiles

Set up development environment on a new mac to start coding.

## Setting up a new mac

1. Set up SSH with Github
    - [Generate a new SSH key and add it to SSH agent](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    - [Add SSH key to Github account](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
    - [Test SSH connection](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/testing-your-ssh-connection)
3. Run the `.macos` script:

    ```bash
    curl -s https://raw.githubusercontent.com/wesselvanree/dotfiles/HEAD/.macos | zsh && zsh ~/dotfiles/.essentials && say done
    ```

## Final Steps

- [Download GPG Suite](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification)
- [Setup GPG with Github](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification)
