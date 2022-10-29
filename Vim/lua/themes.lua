
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

  --vim.cmd([[match ExtraWhitespace /\s\+$\| \+\ze\t/]])
  vim.cmd([[autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/]])
  highlight('ExtraWhitespace', opts)
end

-- Enable 24-bit RGB color if available
vim.o.termguicolors = true

local run_async = function(fun)
  local async
  async = vim.loop.new_async(vim.schedule_wrap(function ()
    fun()
    async:close()
  end))
  async:send()
end

PsyThemes = {
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
  end
}


-- Apply the new theme asynchronously as to not get overridden
-- by material.nvim configs
--

--
-- #df7d85

