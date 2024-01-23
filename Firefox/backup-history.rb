#!/usr/bin/ruby

# Backup Firefox History
# =======================
#
# To run once a month, add this to `crontab -e`:
#
#   0 0 1 * * /usr/bin/ruby /Users/Psy/.dotfiles/Firefox/backup-history.rb >> /tmp/ff-backup.log 2>&1
#
#
# View logs by:
#
#   tail -f /tmp/ff-backup.log
#

require 'time'
require 'zlib'
require 'tempfile'
require 'fileutils'

HISTORY_FILE = 'places.sqlite'
HOME_DIR     = '/Users/Psy'
PROFILES_DIR = HOME_DIR + '/Library/Application Support/Firefox/Profiles'
BACKUP_DIR   = HOME_DIR + '/Dropbox/Secure/App Backups/Firefox/History'


puts("-----------------------------------------")
puts("Creating Backup on #{Time.now()}")

history_file = Dir.glob(PROFILES_DIR + '/**/' + HISTORY_FILE).first
profile_name = File.basename(File.dirname(history_file))

puts("Found profile: #{profile_name}")

temp = Tempfile.new('ff-backup')

Zlib::GzipWriter.open(temp.path) do |gz|
  File.open(history_file) do |fp|
    while chunk = fp.read(16 * 1024) do
      gz.write(chunk)
    end
  end
  gz.close
end

puts("Compressed history file")

backup_name = Date.today.strftime('%Y-%m-%d-') + HISTORY_FILE + '.gz'
backup_path = BACKUP_DIR + '/' + backup_name
FileUtils.cp(temp.path, backup_path)

puts("Backed up to: #{BACKUP_DIR}")
puts("Cleaning up...")

temp.close
temp.unlink

puts("Done!")
puts("-----------------------------------------")
