
Git - [sheharyar's dotfiles](https://github.com/sheharyarn/dotfiles)
====================================================================

### Aliases

I haven't made any major customizations except for my easy-to-use [git aliases](https://github.com/sheharyarn/dotfiles/blob/master/Git/aliases.sh). Since most dotfiles start with Git, this is a good place to start. Go through the aliases, and keep/modify those you find useful.

__Aliases Installation Script:__

These are simple bash commands I use to set up my aliases on any system I'm working on temporarily.

```bash
curl https://raw.githubusercontent.com/sheharyarn/dotfiles/master/Git/aliases.sh > ~/.git.aliases.sh
echo "source ~/.git.aliases.sh" >> ~/.bash_profile
source ~/.bash_profile
```

### Configuration

Set up your creds:

```bash
git config --global user.name  "Sheharyar Naseer"
git config --global user.email "hello@sheharyar.me"
```

I also use the awesome command-line utility [`joe`](https://github.com/karan/joe) to generate `.gitignore` files for me. But for OSX and Sublime temp files that I've to add to my `.gitignore` everytime, a better option is to use a Global Gitignore:

```bash
git config --global core.excludesfile ~/.dotfiles/Git/.gitignore.global
```


