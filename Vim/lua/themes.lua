
----------------------------
-- Custom Styles & Themes --
----------------------------


-- Define or load Special Colors
local MColors = require('material.colors').main
local Colors = {
  black = '#090b10',
  red = '#df7d85',
}

-- Enable 24-bit RGB color if available
vim.o.termguicolors = true



-- Apply highlight colors in NeoVim
-- ---------------------------------
-- Takes group name and a table of options which can include any
-- of the following. Any options not set are defaulted to
-- blank/none/empty:
--  * fg
--  * bg
--  * sp
--  * link
--
--  Example:
--  highlight('LineNr', { fg='red' bg='black' })
--
-- @param group Highlight Group Name
-- @param opts Table of options/arguments
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



-- Highlight dangling whitespace after content
-- -------------------------------------------
-- Special highlight scheme that should be applied as part of
-- all custom themes. This highlights whitespace characters at
-- the end of lines with dark red color.
highlightWhitespace = function(enable)
  enable = enable or true
  opts = enable and { bg = MColors.darkred } or {}

  --vim.cmd([[match ExtraWhitespace /\s\+$\| \+\ze\t/]])
  vim.cmd([[autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/]])
  highlight('ExtraWhitespace', opts)
end

local run_async = function(fun)
  local async
  async = vim.loop.new_async(vim.schedule_wrap(function ()
    fun()
    async:close()
  end))
  async:send()
end



-- Define Custom Themes
-- --------------------
-- This sets a Global 'PsyThemes' object in NeoVim
PsyThemes = {
  -- Set default dark and light themes
  dark  = function() PsyThemes.material_dark()   end,

  material_dark = function()
    require('material').setup({
      plugins = {
        'indent-blankline',
        'telescope',
        'gitsigns',
        'nvim-tree',
        'nvim-cmp',
      },
    })

    -- Use 'Deep Ocean' Material Theme
    vim.o.background = 'dark'
    vim.g.material_style = 'deep ocean'
    vim.cmd('colorscheme material')

    -- Use a matching Lualine theme
    require('lualine').setup { options = { theme = 'nightfly' } }

    run_async(function()
      highlight('NvimTreeRootFolder', { fg = MColors.red })
      highlight('NvimTreeOpenedFolderName', { fg = MColors.blue })
      highlight('NvimTreeNormal', { bg = Colors.black })
      highlight('NvimTreeNormalNC', { bg = Colors.black })
      highlight('NvimTreeWinSeparator', { bg = Colors.black, fg = Colors.black })
      highlight('NvimTreeStatusline', { bg = Colors.black, fg = Colors.black })
      highlight('NvimTreeStatuslineNc', { bg = Colors.black, fg = Colors.black })

      -- input/cmd line at bottom
      --highlight('MsgArea', { bg = Colors.black, fg = Colors.white })

      -- Custom Overrides
      highlight('Search', { bg = MColors.darkyellow, fg = Colors.black })
      highlightWhitespace()
    end)
  end,
}


-- Apply the new theme asynchronously as to not get overridden
-- by material.nvim configs
--

--
-- #df7d85

