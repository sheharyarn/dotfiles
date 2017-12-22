
Zsh
===

> Why haven't you installed it already!?


### Installation

```bash
# Set up `zsh` (http://www.zsh.org/)
brew install zsh

# Install `oh-my-zsh` (http://ohmyz.sh/)
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Symlink `.zshrc`
ln -s ~/.dotfiles/Zsh/zshrc.symlink ~/.zshrc

# Symlink external Plugins
ln -s ~/.dotfiles/Zsh/Plugins ~/.oh-my-zsh/custom/plugins
```

Use Aliases/Functions in other apps like Vim:

```bash
ln -s ~/.dotfiles/Zsh/simple-load.sh ~/.zshenv
```

