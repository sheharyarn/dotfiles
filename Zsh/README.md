
Zsh
===

> Why haven't you installed it already!?


## Installation

```bash
# Set up `zsh` (http://www.zsh.org/)
brew install zsh

# Install `oh-my-zsh` (http://ohmyz.sh/)
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Symlink `.zshrc`
ln -s ~/.dotfiles/Zsh/zshrc.symlink ~/.zshrc
```

Use Aliases/Functions in other apps like Vim:

```bash
ln -s ~/.dotfiles/Zsh/simple-load.sh ~/.zshenv
```


## Manage Plugin/Theme [Subtrees][subtrees]

Use custom function to manage scripts:

```bash
# add/update a plugin
zsh-custom add plugin <PLUGIN_GIT_URL>
zsh-custom update plugin <PLUGIN_GIT_URL>

# add/update a theme
zsh-custom add theme <THEME_GIT_URL>
zsh-custom update theme <THEME_GIT_URL>
```

For themes, also symlink their underlying `.zsh-theme` file to directory:

```bash
# example
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# then update the .zshrc file to set the theme name
```

[subtrees]: https://www.atlassian.com/blog/git/alternatives-to-git-submodule-git-subtree
