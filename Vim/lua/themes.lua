
-------------------------
-- Custom Color Scheme --
-------------------------

local Colors = {
  black = '#090b10',
  red = '#df7d85',
}

local MColors = require('material.colors')

--highlight = function(name, opts)
--  local args = 'highlight ' .. name
--
--  if opts.fg then args = args .. ' guifg=' .. opts.fg end
--  if opts.bg then args = args .. ' guibg=' .. opts.bg end
--
--  vim.cmd(args)
--end

highlight = function(group, opts)
  local style = opts.style and "gui=" .. opts.style or "gui=NONE"
  local fg = opts.fg and "guifg=" .. opts.fg or "guifg=NONE"
  local bg = opts.bg and "guibg=" .. opts.bg or "guibg=NONE"
  local sp = opts.sp and "guisp=" .. opts.sp or ""

  vim.cmd("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)

  if opts.link then
    vim.cmd("highlight! link " .. group .. " " .. opts.link)
  end
end

highlightWhitespace = function(enable)
  enable = enable or true
  opts = enable and { bg = MColors.darkred } or {}

  vim.cmd([[match ExtraWhitespace /\s\+$\| \+\ze\t/]])
  highlight('ExtraWhitespace', opts)
end

-- Enable 24-bit RGB color if available
vim.o.termguicolors = true

-- Use 'Deep Ocean' Material Theme
vim.g.material_style = 'deep ocean'
vim.cmd('colorscheme material')

PsyThemes = {
  material_dark = function()
    highlight('NvimTreeRootFolder', { fg = MColors.red })
    highlight('NvimTreeOpenedFolderName', { fg = MColors.blue })
    highlight('NvimTreeNormal', { bg = Colors.black })
    highlight('NvimTreeNormalNC', { bg = Colors.black })
    highlight('NvimTreeVertSplit', { bg = Colors.black, fg = Colors.black })
    highlight('NvimTreeStatuslineNc', { bg = Colors.black, fg = Colors.black })

    -- Custom Overrides
    highlight('Search', { bg = MColors.darkorange, fg = Colors.black })
    --highlightWhitespace()
  end
}


-- Apply the new theme asynchronously as to not get overridden
-- by material.nvim configs
local async
async = vim.loop.new_async(vim.schedule_wrap(function ()
  PsyThemes.material_dark()
  async:close()
end))
async:send()

--vim.api.nvim_command('PsyThemeMaterial', psy_theme, {})
--
-- #df7d85

