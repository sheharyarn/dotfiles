
----------------------
-- Psy's Vim Config --
----------------------


-- Define important variables
HOME    = vim.fn.expand('~/')
VIM_DIR = vim.fn.expand('~/.dotfiles/Vim')


-- Load custom utils for lua-vim interop
require('utils')

-- Load core vim configs
source('/core.vim')

-- Load custom commands
source('/commands.vim')

-- Set up Plugins
require('plugins')

-- Configure custom themes/colors
require('themes')
