Firefox
=======


### Link plugin backups/configs:

```sh
# Simple Tab Groups
ln -s "$HOME/Dropbox/Secure/App Backups/Firefox/Simple Tab Groups/" ~/Downloads/FF-Tab-Groups
```


### Firefox History Backups

To backup firefox history every 3 days, add this to `crontab -e`:

```
0 0 */3 * * /usr/bin/ruby /Users/Psy/.dotfiles/Firefox/backup-history.rb >> /tmp/ff-backup.log 2>&1
```
