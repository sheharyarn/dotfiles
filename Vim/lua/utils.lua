
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


function sleep(seconds)
  local ntime = os.time() + seconds
  repeat until os.time() > ntime
end


-- Check if module exists
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

-- Split string into an array
split_string = function(source, delimiters)
  local elements = {}
  local pattern = '([^'..delimiters..']+)'
  string.gsub(source, pattern, function(value)
    elements[#elements + 1] = value
  end)
  return elements
end
