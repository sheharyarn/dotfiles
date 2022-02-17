
-----------------------
-- Psy's Vim Plugins --
-----------------------

split_util = function(source, delimiters)
  local elements = {}
  local pattern = '([^'..delimiters..']+)'
  string.gsub(source, pattern, function(value)
    elements[#elements + 1] = value
  end)
  return elements
end


-- Bootstrap / Auto-install Packer if not installed
local PACKER_GIT_URL = 'https://github.com/wbthomason/packer.nvim'
local INSTALL_PATH = vim.fn.expand('~/.local/share/nvim/site/pack/packer/start/packer.nvim')

if vim.fn.empty(vim.fn.glob(INSTALL_PATH)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({'git', 'clone', '--depth', '1', PACKER_GIT_URL, INSTALL_PATH})
end

local intro_header = {
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
          'alpha',
          'dashboard',
          'NvimTree',
          'markdown',
          'TelescopePrompt'
        },
      })
    end
  }

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  use 'wakatime/vim-wakatime'

  use 'marko-cerovac/material.nvim'

  use 'sheharyarn/werewolf.nvim'
  -- use '~/code/lua/werewolf.nvim'

  use {
    'ruanyl/vim-gh-line',   -- Github blob/blame link shortcuts
    config = function()
      -- Copy the links instead of opening them
      vim.g.gh_open_command = 'fn() { echo "$@" | tr -d "\n" | pbcopy; }; fn '
    end,
  }

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
    config = function()
      require('feline').setup({
        disable = {
          filetypes = {
            'NvimTree',
          },
        },
      })
    end
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        -- Languages to support
        ensure_installed = {
          'elixir', 'eex', 'heex', 'erlang', 'gleam',
          'python', 'ruby', 'kotlin', 'java', 'rust', 'dart', 'zig',
          'javascript', 'typescript', 'jsdoc',
          'html', 'css', 'scss', 'vue', 'json', 'markdown',
          'bash', 'dockerfile', 'toml', 'yaml', 'graphql', 'vim',
        },

        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- List of parsers to ignore installing
        ignore_install = { },

        highlight = {
          enable = true,

          -- list of language that will be disabled
          disable = { },
        }
      })
    end,
  }
  
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      ignored_dirs_str = os.getenv('IGNORED_DIRS')
      ignored_dirs_lua = split_util(ignored_dirs_str, '{},')
      local actions = require("telescope.actions")
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              -- Map <ESC> to quit in insert mode
              ["<esc>"] = actions.close,
            }
          },
          --file_ignore_patterns = ignored_dirs_lua,
          --file_ignore_patterns = ignored_dirs_lua,
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
              '--glob',
              '!**/'..ignored_dirs_str..'/*',
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          set_env = { ["COLORTERM"] = "truecolor" },
        },
        pickers = {
          find_files = {
            find_command = {
              'rg', '--files', '--no-ignore-vcs', '--hidden', '--follow',
              '--glob',
              '!**/'..ignored_dirs_str..'/*',
            },
            debounce = 150,
          },
          live_grep = {
            debounce = 150,
          },
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

      require('nvim-tree').setup({
        git = {
          enable = true,
          ignore = false,
        },
        actions = {
          open_file = {
            window_picker = { enable = false }
          },
        },
        renderer = {
          indent_markers = { enable = true }
        },
      })

      nmap('<Leader>|', ':NvimTreeToggle<CR>')
      nmap('<Leader>t', ':NvimTreeFindFile<CR>')
    end
  }

  --- LSP Config

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'ray-x/lsp_signature.nvim' -- Show fun signatures as you type
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'onsails/lspkind-nvim' -- Show icons in cmp

  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin


  -- Configure Packer to sync plugins if auto-installed
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end

end)

