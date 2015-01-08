#!/bin/bash

# OSX Custom Services & Shortcuts
# ===============================

# More of my shit
# @ for Command, $ for Shift, ~ for Alt and ^ for Ctrl


# Terminal at Folder option in Context Menu 
defaults write pbs NSServicesStatus \
	-dict-add "com.apple.Terminal - New Terminal at Folder - newTerminalAtFolder" \
	'{ "enabled_context_menu" = 1; "enabled_services_menu" = 1; "key_equivalent" = "^t";}'

# GPG Tools Shortcuts
# defaults write pbs NSServicesStatus \
# 	-dict-add "org.gpgtools.gpgservices - OpenPGP: Decrypt - decrypt" \
# 	'{ "enabled_context_menu" = 1; "enabled_services_menu" = 1; "key_equivalent" = "@~^-"; }'
# defaults write pbs NSServicesStatus \
# 	-dict-add "org.gpgtools.gpgservices - OpenPGP: Encrypt - encrypt" \
# 	'{ "enabled_context_menu" = 1; "enabled_services_menu" = 1; "key_equivalent" = "@~^="; }'
# defaults write pbs NSServicesStatus \
# 	-dict-add "org.gpgtools.gpgservices - OpenPGP: Sign - sign" \
# 	'{ "enabled_context_menu" = 1; "enabled_services_menu" = 1; "key_equivalent" = "@~^]"; }'
# defaults write pbs NSServicesStatus \
# 	-dict-add "org.gpgtools.gpgservices - OpenPGP: Verify - verify" \
# 	'{ "enabled_context_menu" = 1; "enabled_services_menu" = 1; "key_equivalent" = "@~^["; }'