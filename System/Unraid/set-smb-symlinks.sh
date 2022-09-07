#!/bin/bash

# Enable SMB Symlinks
# -------------------


# Attribute key/value for SMB symlinks
ATTR_KEY="com.apple.FinderInfo"
ATTR_VAL="73 72 76 72 4D 41 43 53 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "


# Symlink Dir
FILES=(~/.dotfiles/System/Unraid/PsyNAS/*)


# Apply attributes to all
for f in "${FILES[@]}" ; do
  xattr -wx "$ATTR_KEY" "$ATTR_VAL" "$f"
done



# -- Helpers --
#
# Read attribute
# xattr -px attr file
#
# Delete attribute
# xattr -d attr file
#
# Set attribute (use -x for hexcode)
# xattr -w attr value file
