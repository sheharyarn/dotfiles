
-----------------------
-- Psy's Vim Plugins --
-----------------------


-- Bootstrap / Auto-install Packer if not installed
local PACKER_GIT_URL = 'https://github.com/wbthomason/packer.nvim'
local INSTALL_PATH = vim.fn.expand('~/.local/share/nvim/site/pack/packer/start/packer.nvim')

if vim.fn.empty(vim.fn.glob(INSTALL_PATH)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({'git', 'clone', '--depth', '1', PACKER_GIT_URL, INSTALL_PATH})
end

vim.g.dashboard_custom_header = {
   "",
   "",
   "",
   "",
   "",
   "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆",
   "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦",
   "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄",
   "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄",
   "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀",
   "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄",
   "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄",
   " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄",
   " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄",
   "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆",
   "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃",
   "",
   "",
   "",
}



-- Set up plugins through Packer
return require('packer').startup(function()
  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup({
        buftype_exclude = { 'terminal' },
        filetype_exclude = {
          'help',
          'terminal',
          'packer',
          'dashboard',
          'NvimTree',
          'markdown',
          'TelescopePrompt'
        },
      })
    end
  }

  use 'glepnir/dashboard-nvim'

  use 'wakatime/vim-wakatime'

  use 'marko-cerovac/material.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
      vim.o.signcolumn = 'yes'
    end
  }

  use {
    'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup() end
  }

  use {
    'feline-nvim/feline.nvim',
    config = function() require('feline').setup() end
  }
  
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  --use 'nvim-telescope/telescope-fzy-native.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require("telescope.actions")
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              -- Map <ESC> to quit in insert mode
              ["<esc>"] = actions.close,
            }
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--ignore-case",
            "--no-ignore-vcs",
            "--hidden",
            "--follow",
            --"--glob '!**/".. os.getenv("IGNORED_DIRS") .."/*'",
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          set_env = { ["COLORTERM"] = "truecolor" },
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
          },
          extensions = {
            fzy_native = {
              override_generic_sorter = false,
              override_file_sorter = true,
            }
          }
        },
      })

      require('telescope').load_extension('fzf')
      --require('telescope').load_extension('fzy_native')

      nmap('ff', ':Telescope find_files<CR>')
      nmap('fg', ':Telescope live_grep<CR>')
      nmap('fb', ':Telescope buffers<CR>')
      nmap('fh', ':Telescope help_tags<CR>')
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      vim.g.nvim_tree_disable_window_picker = 1
      vim.g.nvim_tree_indent_markers = 1

      vim.g.nvim_tree_show_icons = {
        folder_arrows = 0,
        folders = 1,
        files = 1,
        git = 1,
      }

      vim.g.nvim_tree_icons = {
        default = "",
        symlink = "",
        git = {
          deleted = "",
          ignored = "◌",
          renamed = "➜",
          staged = "✓",
          unmerged = "",
          unstaged = "✗",
          untracked = "★",
        },
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
        },
      }

      require('nvim-tree').setup()

      nmap('<Leader>|', ':NvimTreeToggle<CR>')
      nmap('<Leader>t', ':NvimTreeFindFile<CR>')
    end
  }

  -- Configure Packer to sync plugins if auto-installed
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

