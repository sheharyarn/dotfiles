
--------------------
-- Meta Vim Utils --
--------------------


-- Wrap the `source` vim command
function source(path)
  vim.cmd('source ' .. VIM_DIR .. path)
end

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end


-- Check if table contains a key
function table_contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end

  return false
end
