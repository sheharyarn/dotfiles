Sheharyar's Dotfiles
====================

> Use this to create and structure your own dotfiles!

<br />




## Prologue

As Zach Holman once wrote:

> Dotfiles are meant to be shared

And I absolutely agree, but at the same time, I'm of the strong belief that one should not copy and use dotfiles of others blindly. Dotfiles are personal, very personal. They help you be more efficient, improve your workflows, and make your life easier. But everyone is unique, and so is everyone's working style. So it does not make any sense in reusing someone else's configs without first understanding what they do, and hoping that they'd work perfectly for you.

It is absolutely critical you understand what's in each file and copy it only if you need it, so that when you customize and extend them with your own settings, configs, aliases and other stuff in the future, you can easily do so without a giant mess of files.

<br />




## Getting Started

There is no script or installer that sets up everything for you. Instead you should fork/clone my dotfiles and go through each section and file and keep only those you find important or useful. However, these are the bare minimum, recommended steps you should follow:

#### 1. Install Xcode developer tools

```bash
xcode-select --install
```

#### 2. Clone Dotfiles

```bash
git clone https://github.com/sheharyarn/dotfiles ~/.dotfiles
```

#### 3. Set up Homebrew

1. Install Homebrew: https://brew.sh
2. Install important apps and fonts [Homebrew](https://github.com/sheharyarn/dotfiles/tree/master/Homebrew) section

#### 4. Set up [System Defaults](https://github.com/sheharyarn/dotfiles/tree/master/System)

#### 5. Set up [Zsh](https://github.com/sheharyarn/dotfiles/tree/master/Zsh)

#### 6. Set up [Git](https://github.com/sheharyarn/dotfiles/tree/master/Git)

#### 7. Set up [Vim](https://github.com/sheharyarn/dotfiles/tree/master/Vim)

#### 8. Other apps

Now go through other sections relevant to you, and set them up one by one.

<br />




## History

I discovered the concept of dotfiles when I came across this post: [Dotfiles are meant to be Forked](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/). A bit of googling lead me to [Github Does Dotfiles](http://dotfiles.github.io/) where I discovered some awesome collections. Being a new Rubyist at the time, I started by copying most of [Ryan Bates'](https://github.com/ryanb/dotfiles) but they were too much and I had to go through each file and keep only what I found useful. 

Initially I worked with only a few `Bash` aliases and `.irbrc` customizations, but since I jumped ship to [Oh My Zsh!](http://ohmyz.sh/), I've heavily modifed a lot of stuff and tried to keep everything symlinked to my Dotfiles. My old Bash configurations are in [this branch](https://github.com/sheharyarn/dotfiles/tree/bash).

Over time, I've copied and used dotfiles of:

- [Zach Holman](https://github.com/holman/dotfiles)
- [Ryan Bates](https://github.com/ryanb/dotfiles)
- [Ryan Tomayko](https://github.com/rtomayko/dotfiles)
- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)


