
System
======

### Hosts

My shared `hosts` file across systems. Creating a hard link seems appropriate.

```bash
# Backup the original
sudo mv /etc/hosts /etc/hosts.orig

# Create a hard link to hosts in .dotfiles in it's place
sudo ln -i ~/.dotfiles/System/hosts /etc/hosts
```


