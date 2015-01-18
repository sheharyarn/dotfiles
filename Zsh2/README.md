
Zsh
===

> Why haven't you installed it already!?


## Installation

1. Set up [`zsh`](http://www.zsh.org/)

    ```bash
    brew install zsh
    ```

2. Install [`oh-my-zsh`](http://ohmyz.sh/)

    ```bash
    curl -L http://install.ohmyz.sh | sh
    ```

3. Symlink `.zshrc`

    ```bash
    ln -s ~/.dotfiles/Zsh/zshrc.symlink ~/.zshrc
    ```

4. Symlink external Plugins

    ```bash
    ln -s ~/.dotfiles/Zsh/Plugins ~/.oh-my-zsh/custom/plugins
    ```



