
System
======

### Hosts

My shared `hosts` file across systems. Creating a hard link seems appropriate.

```bash
# Delete the original
sudo rm /etc/hosts

# Create a hard link to hosts in .dotfiles in it's place
sudo ln -i ~/.dotfiles/System/hosts /etc/hosts
```


