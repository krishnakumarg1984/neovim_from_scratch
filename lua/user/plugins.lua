-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Boilerplate for packer automation (((

-- Automatically install packer (((

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer: close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- )))

-- Autocommand that reloads neovim whenever you save the plugins.lua file (((

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

--)))

-- Use a protected call so we don't error out on first use (((

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- )))

-- Have packer use a popup window (((

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- )))

-- )))

-- 'packer.startup' lua function to load plugins
return packer.startup(function(use)
  -- My plugins here (((

  -- Barebones/package management and other infrastructure plugins (((

  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim

  -- )))

  -- Colorschemes (((

  use("rebelot/kanagawa.nvim")

  -- )))

  -- Autocompletion and snippets support (((

  -- cmp plugins (((

  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- )))

  -- snippets (((

  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- )))

  -- )))

  -- LSP (((

  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer

  -- )))

  -- )))

  -- Automatically set up your configuration after cloning packer.nvim (((
  -- Put this at the end after all plugins

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

  -- )))
end)
