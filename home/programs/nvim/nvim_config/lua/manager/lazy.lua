-- Bootrstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy, unlike Packer, is unable to use plugins installed by nix.
local plugins = {
  --'Ivan-Asdf/onedark.nvim',
  'catppuccin/nvim',
  'lewis6991/gitsigns.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons' ,
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons' ,
        --tag = 'nightly' } -- optional, for file icons
    },
  },
  -- use 'Mofiqul/vscode.nvim'
  --use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
  --require("toggleterm").setup()
  --end}
  'nvim-treesitter/nvim-treesitter', -- run= ':TSUpdate'
  'windwp/nvim-ts-autotag',
  'neovim/nvim-lspconfig',    -- Configurations for Nvim LSP
  'hrsh7th/nvim-cmp',         -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip',         -- Snippets plugin

  'brenoprata10/nvim-highlight-colors',
}

require("lazy").setup(plugins)
