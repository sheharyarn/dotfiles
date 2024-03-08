
----------------------------
-- Custom Styles & Themes --
----------------------------


-- Set the Namespace
Psy = Psy or {}


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
--    highlight('LineNr', { fg = 'red' bg = 'black' })
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



-- Define Custom Themes
-- --------------------
--
-- This sets a Global 'Psy.Themes' object in NeoVim
-- which defines one function each for a custom theme
-- implementation.
--
Psy.Themes = {

  -- Default Dark/Light themes
  -- -------------------------
  dark  = function() Psy.Themes.material_dark()   end,
  light = function() Psy.Themes.solarized_light() end,


  -- Material Dark Theme
  -- -------------------
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


  -- Solarized Light Theme
  -- ---------------------
  solarized_light = function()
    vim.o.background = 'light'

    local config = require('solarized.config').load()
    local colors = require('solarized.palette').get_colors()
    require('solarized').setup(config)

    -- Use 'Light' Solarized Theme
    vim.cmd('colorscheme solarized')

    -- Use a matching Lualine theme
    require('lualine').setup { options = { theme = require('lualine.themes.solarized') } }

    -- Custom Overrides
    run_async(function()
      -- Remove background from GitSigns
      highlight('GitSignsAdd', { fg = colors.add })
      highlight('GitSignsChange', { fg = colors.change })
      highlight('GitSignsDelete', { fg = colors.delete })

      -- Make indent lines lighter
      highlight('IblScope', { fg = colors.base01 })
      highlight('IblIndent', { fg = colors.base02 })

      -- Telescope prompt
      highlight('TelescopeNormal', { bg = colors.base03 })

      highlight('WinSeparator', { fg = colors.base02, bg = colors.base03 })
      highlight('SignColumn', { fg = colors.base0 })
      highlight('LineNr', { fg = colors.base01 })
      highlight('Search', { bg = MColors.darkyellow, fg = Colors.black })
      highlightWhitespace()

      -- Reload indent-blankline with updated highlights
      require('ibl').update({})
    end)
  end,
}
