
----------------------
-- Psy's Vim Config --
----------------------


-- Define important variables
HOME    = vim.fn.expand('~/')
VIM_DIR = vim.fn.expand('~/.dotfiles/Vim')


-- Load custom utils for lua-vim interop
require('utils')

-- Load core vim configs
source('/core.vim')

-- Load custom commands
source('/commands.vim')

-- Set up Plugins
require('plugins')

-- Configure custom themes/colors
require('themes')


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
  "",
}

-- Set up Werewolf
require('werewolf').setup({
  system_theme = {
    on_change = function(theme)
      if theme == 'Dark' then
        PsyThemes.dark()
        --PsyThemes.light()
      else
        PsyThemes.light()
      end
    end,

    period = 200,
  },
})


--- Example for werewolf docs
-- on_change = function(theme)
--   if theme == 'Dark' then
--     vim.o.background = 'dark'
--     vim.g.material_style = 'deep ocean'
--     vim.cmd('colorscheme material')
--     print('Dark theme set!')
--   else
--     vim.o.background = 'light'
--     vim.g.material_style = 'lighter'
--     vim.cmd('colorscheme material')
--     print('Light theme set!')
--   end
-- end,



-- TODO: Use this for other plugins as well (e.g. indent-blankline)
EXCLUDED_FILETYPES = {
  'help',
  'terminal',
  'packer',
  'alpha',
  'dashboard',
  'NvimTree',
  'TelescopePrompt'
  --'markdown',
}


require('bufferline').setup({
  options = {
    -- Use as a tabline instead of with buffers
    mode = 'tabs',
    -- Offset bufferline when NvimTree is open
    offsets = {
      {
        filetype = 'NvimTree',
        separator = false,
        text = nil,
        highlight = nil,
        padding = 1,
      }
    },
    -- Don't show excluded buffer names in tabline
    custom_filter = function(buf_number, buf_numbers)
      local type = vim.bo[buf_number].filetype
      return not table_contains(EXCLUDED_FILETYPES, type)
    end,
  },
})
-- Don't show tabline on start
vim.o.showtabline = 1



-- Custom formatter
nmap('<Leader>f', ':lua Psy.format()<CR>')

Psy = Psy or {}
Psy.format = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))

  if vim.bo.filetype == 'elixir' then
    -- TODO: Check error code and print stderr instead of replacing completely
    -- TODO: Replace this with:
    -- https://stackoverflow.com/questions/1242572/how-do-you-construct-a-read-write-pipe-with-lua
    vim.cmd('%!mix format -')
  end

  local total_lines = vim.api.nvim_buf_line_count(0)
  line = math.max(1, math.min(line, total_lines))

  vim.api.nvim_win_set_cursor(0, {line, col})
end


-- LSP init
vim.o.completeopt = 'menu,menuone,noselect'
require('lsp_signature').setup({})

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show symbol + text in annotations
      menu = {
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        luasnip = '[LuaSnip]',
        nvim_lua = '[Lua]',
      },
    }),
  },
  mapping = {
    --['<Tab>']   = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    --['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    --["<C-b>"] = cmp.mapping.scroll_docs(-4),
    --["<C-f>"] = cmp.mapping.scroll_docs(4),
    --["<C-Space>"] = cmp.mapping.complete(),
    --["<C-e>"] = cmp.mapping.close(),

    -- Expand snippet on enter
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }, {
    -- Show path sources when results from previous group are not available
    { name = 'path' },
  })
})

-- Enable autocompletion for vim commands
cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})

-- Autocompletion for existing text in buffer
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

local path_to_elixirls = vim.fn.expand('~/.tools/elixir-ls/release/language_server.sh')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' },
}

local on_attach = function()
  --vim.cmd [[inoremap <silent><expr> <C-Space> compe#complete()]]
  --vim.cmd [[inoremap <silent><expr> <CR> compe#confirm('<CR>')]]
  --vim.cmd [[inoremap <silent><expr> <C-e> compe#close('<C-e>')]]
  --vim.cmd [[inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })]]
  --vim.cmd [[inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })]]
end

require('lspconfig').elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = false,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  },
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
})



local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = intro_header

dashboard.section.buttons.val = {
  dashboard.button('i',  '   New file' , ':ene <BAR> startinsert <CR>'),
  dashboard.button('ff', '󰍉   Find file', ':Telescope find_files<CR>'),
  dashboard.button('fg', '󰦀   Find text', ':Telescope live_grep<CR>'),
  dashboard.button('fr', '   Recent'   , ':Telescope oldfiles<CR>'),
  dashboard.button('s',  '   Settings' , ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'),
  dashboard.button('q',  '   Quit'     , ':qa<CR>'),
}

alpha.setup(dashboard.config)
