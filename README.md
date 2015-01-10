sheharyarn's dotfiles
=====================

### a.k.a The Ultimate Guide to get started with your own Dotfiles


`<rant>` I'm all about sharing, but you seriously need to stop using the dotfile configs of others blindly. You don't even know what's happening in most of their files, yet you simply copy them and hope they'd work perfectly for you. You need to understand what's in each file and copy it only if you need it, so that when you plan to add your settings, configs, aliases and other shit, you can easily do so without a giant mess of files.`</rant>`



## Getting Started

There isn't going to be a script/installer that sets up everything for you. Instead you should clone my dotfiles and go through each section and file and keep only those you find important or useful.

```bash
git clone https://github.com/sheharyarn/dotfiles ~/.dotfiles
```

I seriously recommend that you install `Zsh` and [`Oh My Zsh`](http://ohmyz.sh) if you haven't already made the switch. To get started, read the [Zsh Section](https://github.com/sheharyarn/dotfiles/tree/master/ZSH).



## Sections

```bash
# TODO: Write instructions for each Section
```

- **[Zsh](https://github.com/sheharyarn/dotfiles/tree/master/ZSH)**
- **[Git](https://github.com/sheharyarn/dotfiles/tree/master/Git)**
- **[OSX](https://github.com/sheharyarn/dotfiles/tree/master/OSX)**
- **[Vim](https://github.com/sheharyarn/dotfiles/tree/master/Vim)**
- **[Ruby](https://github.com/sheharyarn/dotfiles/tree/master/Ruby)**
- **[Nano](https://github.com/sheharyarn/dotfiles/tree/master/Nano)**
- **[Sublime](https://github.com/sheharyarn/dotfiles/tree/master/Sublime)**



## History

I discovered the concept of dotfiles when I came across this post: [Dotfiles are meant to be Forked](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/). A bit of googling lead me to [Github Does Dotfiles](http://dotfiles.github.io/) where I discovered some awesome sets of dotfiles. Being a new Rubyist at the time, I started by copying most of [Ryan Bates'](https://github.com/ryanb/dotfiles) but they were too much and I had to go through each file and keep only what I found useful. 

Initially I worked with only a few `Bash` aliases and `.irbrc` customizations, but since I jumped ship to [Oh My Zsh!](http://ohmyz.sh/), I've heavily modifed a lot of stuff and tried to keep everything symlinked to my Dotfiles. My old Bash configurations are in [this branch](https://github.com/sheharyarn/dotfiles/tree/bash).

Over time, I've copied and used dotfiles of:

- [Zach Holfman](https://github.com/holman/dotfiles)
- [Ryan Bates](https://github.com/ryanb/dotfiles) 
- [Ryan Tomayko](https://github.com/rtomayko/dotfiles)
- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)


