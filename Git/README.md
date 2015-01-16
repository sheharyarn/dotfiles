
Git - [sheharyar's dotfiles](https://github.com/sheharyarn/dotfiles)
====================================================================

A wise man once said:

> Git is awesome, and if you don't use it you're a faggot.


### Aliases

I haven't made any major customizations except for my easy-to-use [git aliases](https://github.com/sheharyarn/dotfiles/blob/master/Git/aliases.sh). Since most dotfiles start with Git, this is a good place to start. Go through the aliases, and keep/modify those you find useful.

__Aliases Installation Script:__

These are simple bash commands I use to set up my aliases on any system I'm working on temporarily.

```bash
curl https://raw.githubusercontent.com/sheharyarn/dotfiles/master/Git/aliases.sh > ~/.git.aliases.sh
echo "source ~/.git.aliases.sh" >> ~/.bash_profile
source ~/.bash_profile
```

