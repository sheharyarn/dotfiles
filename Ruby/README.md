Ruby
====

## Initial Set-up

```bash
ln -s ~/.dotfiles/Ruby/irbrc.symlink ~/.irbrc
ln -s ~/.dotfiles/Ruby/gemrc.symlink ~/.gemrc
```

## Set up RVM

#### Install RVM and Ruby

```bash
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

rvm requirements
rvm install 2.2.0
rvm use 2.2.0 --default
```

#### Install Rails and Bundler

```bash
gem install rails
gem install bundler
```

