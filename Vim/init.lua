
----------------------
-- Psy's Vim Config --
----------------------


-- Define important variables
HOME    = vim.call('expand', '~/')
VIM_DIR = vim.call('expand', '~/.dotfiles/Vim')


-- Load core vim configs
vim.cmd('source ' .. VIM_DIR .. '/core.vim')
