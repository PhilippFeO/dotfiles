--[[
  Adapted configuration of https://github.com/nvim-lua/kickstart.nvim

  I moved some contents into
    ./after/plugin/*.lua
    ./lua/*.lua
]]

--  Must happen before plugins are required (otherwise wrong leader will be used)
--  Setting <Leader> (not necessarily <LocalLeader>) before plugins are required by lazy.nvim.
--  Otherwise wrong <Leader> is used.
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

--  You can configure plugins using the `config` key.
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({

  -- TODO: install nvim-autopairs <12-03-2023>
  -- https://github.com/windwp/nvim-autopairs
  -- remove keymap for parentheses and quotation marks

  -- TODO: vim-rainbow for colored ([{ <13-03-2023>
  -- TODO: see. below for settings <13-03-2023>

  -- TODO: lervag/vimtex <12-03-2023> --
  --    ./init-latex.lua umbauen
  -- TODO: frazrepo/vim-rainbow <12-03-2023> --
  --    weiter unten steht der Befehl zum Aktivieren

  -- TODO: onsails/lspkind.nvim  <13-03-2023> --
  { 'nvim-tree/nvim-web-devicons' },

  -- Snippets
  'SirVer/ultisnips',
  'honza/vim-snippets',
  { 'quangnguyen30192/cmp-nvim-ultisnips',
    init = function() require("cmp_nvim_ultisnips").setup({}) end,
  },

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Useful plugin to show you pending keybinds.
  -- Becomes active after `:h timeoutlen`
  { 'folke/which-key.nvim', opts = {} },

  -- [[ LSP related plugins ]]
  --  The configuration is done in after/plugin/lsp.lua
  {
    'neovim/nvim-lspconfig', -- LSP Configuration
    dependencies = { -- LSP Plugins
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

--      { -- Useful status updates for LSP
--        'j-hui/fidget.nvim',
--          opts = {
--            text = {
--              spinner = "moon"
--            }
--          }
--      },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim', -- GitHub: Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    },
  },

  { -- [[ AUTOCOMPLETION ]]
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- !!! Don't forget to add the according sources in ./after/plugin/nvim-cmp.lua !!!
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path', -- Filename/Path completion
      'hrsh7th/cmp-buffer', -- Completes words from current buffer
      'hrsh7th/cmp-nvim-lua', --             Neovim's Lua API completion
      -- 'hrsh7th/cmp-cmdline',
      --'L3MON4D3/LuaSnip',
      --'saadparwaiz1/cmp_luasnip', -- Completes LuaSnips
    },
  },

  { -- [[ GIT RELATED PLUGINS ]]
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb', -- GitHub-Dateien im Browser öffnen
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '*' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '*' },
      },
    },
  },

  { -- [[ COLORSCHMEME ]]
    -- Setting colorscheme like this is recommended by the lazy.nvim author
    'rebelot/kanagawa.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme 'kanagawa'
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    end,
  },

  { -- [[ LUALINE ]]
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'auto', -- Loads theme for my colorscheme or trys to generate one based on it. There are predefined themes but non for "kanagawa".
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- [[ TELESCOPE ]]
  -- fuzzy finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim',
      version = '*',
      dependencies = {
        'nvim-lua/plenary.nvim'
      }
  },

  -- fuzzy finder algorithm which requires local dependencies to be built.
  -- only load if `make` is available. make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- note: if you are having trouble with this installation,
    --       refer to the readme for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { -- [[ TREESITTER ]]
    -- highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  --  { -- Add indentation guides even on blank lines
  --    'lukas-reineke/indent-blankline.nvim',
  --    -- Enable `lukas-reineke/indent-blankline.nvim`
  --    -- See `:help indent_blankline.txt`
  --    opts = {
    --      char = '┊',
    --      show_trailing_blankline_indent = false,
    --    },
    --  },

  -- note: next step on your neovim journey: add/configure additional "plugins" for kickstart
  --       these are some example plugins that i've included in the kickstart repository.
  --       uncomment any of the lines below to enable them.
  -- require 'plugins.autoformat',
  -- require 'plugins.debug', -- Already configured for python but better check it again

  -- note: the import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    you can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    for additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    an additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  -- { import = 'custom.plugins' },
}, {})

require("options")
require("keymaps")
require("autocommands")

-- setup neovim lua configuration
require('neodev').setup()

-- some plugins need python and a python interpreter with the
-- "pynvim" module (installation: python3 -m pip install --user --upgrade pynvim)
-- should now work with virtual envs flawlessly
-- (s. :help provider-python & further information in my personal wiki, because i havn't understood)
-- the mechanic completely
vim.g.python3_host_prog = '/usr/bin/python3'

--vim.cmd("let g:rainbow_active = 1")
--vim.g.rainbow_active = 1

-- [[ highlight on yank ]]
-- see `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('yankhighlight', { clear = true })
vim.api.nvim_create_autocmd('textyankpost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "open diagnostics list" })


-- the line beneath this is called `modeline`. see `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
