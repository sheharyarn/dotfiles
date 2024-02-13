
------------------
-- Custom Utils --
------------------



-- Load and run a .vim file
-- -----------------------------
-- This wraps the `source` vim command in lua, which
-- can load/run other vimscript files.
--
-- Example:
--   source('./core.vim')
--
-- @param path - Local path of file to load/source
function source(path)
  vim.cmd('source ' .. VIM_DIR .. path)
end



-- Create a Vim keymap
-- -------------------
-- Custom keymap helper with sane defaults. You
-- should probably use the `nmap` or `imap` helpers
-- below.
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end



-- Create a Vim keymap in NORMAL mode
-- ----------------------------------
--
-- Example:
--   nmap('ff', ':Telescope find_files<CR>')
--
-- @param shortcut - Keys to trigger command
-- @param command  - Command to run
function nmap(shortcut, command)
  map('n', shortcut, command)
end



-- Create a Vim keymap in INSERT mode
-- ----------------------------------
--
-- Example:
--   imap('<Leader>p', '<ESC>pa')
--
-- @param shortcut - Keys to trigger command
-- @param command  - Command to run
function imap(shortcut, command)
  map('i', shortcut, command)
end



-- Check if a table contains a value
-- ---------------------------------
-- @param table
-- @param element - Value to check
-- @return boolean
function table_contains_value(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end

  return false
end



-- Sleep for x seconds
-- -------------------
-- @param seconds
function sleep(seconds)
  local ntime = os.time() + seconds
  repeat until os.time() > ntime
end



-- Split a string into an array
-- ----------------------------
-- Takes an input string and a set of delimiters.
-- Splits that string returning an array/table.
--
-- Example:
--   split_string('abc,123|456,def|90', ',|')
--   => {'abc', '123', '456', 'def', '90'}
--
-- @param source - Input string
-- @param delimiters - A string containing all delimiters
-- @return table - Array of strings
split_string = function(source, delimiters)
  local elements = {}
  local pattern = '([^'..delimiters..']+)'

  string.gsub(source, pattern, function(value)
    elements[#elements + 1] = value
  end)

  return elements
end



-- Asynchronusly run Vim code
-- --------------------------
-- Start a new async vim loop to run various Vim/Neovim
-- specific commands, such as highlights.
--
-- Example:
--   run_async(function()
--     vim.cmd('set nowrap')
--     highlight('LineNr', { fg = 'red', bg = 'black' })
--   end)
--
-- @param fun - Function to run asynchronusly
run_async = function(fun)
  local async

  async = vim.loop.new_async(vim.schedule_wrap(function ()
    fun()
    async:close()
  end))

  async:send()
end



-- Check if a module exists
-- ------------------------
--
-- Example:
--   is_module_available('lualine')
--
-- @param name - Name of the module
function is_module_available(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end



-- Generate Plugin Snapshot
-- ------------------------
-- Creates a snapshot of all Packer plugins installed
-- and their version numbers, and saves them to a
-- default location at ~/.dotfiles/Vim/plugins.snapshot
create_snapshot = function()
  local SNAPSHOT_PATH = VIM_DIR .. '/plugins.snapshot';

  -- Ensure Packer is available
  if is_module_available('packer') then
    local packer = require('packer')
    local snapshot = require('packer.snapshot')
    local async = require('packer.async').sync
    local await = require('packer.async').wait
    local tempfile = vim.fn.tempname()
    local sorted =  VIM_DIR .. '/plugins.sorted'

    -- Delete Snapshot if an older one already exists
    if vim.fn.filereadable(SNAPSHOT_PATH) then
      vim.fn.delete(SNAPSHOT_PATH)
    end

    packer.snapshot(SNAPSHOT_PATH)

    --async(function()
    --  --packer.__manage_all()
    --  --local target_plugins = plugins
    --  --
    --  --await(snapshot.create(SNAPSHOT_PATH, {}))
    --  --

    --  --vim.fn.delete(tempfile)
    --  sleep(2)
    --  os.execute('jq --sort-keys . ' .. SNAPSHOT_PATH .. ' > ' .. sorted)
    --end)()
    --print(tempfile)
  else
    print('Packer Unavailable')
  end
end
