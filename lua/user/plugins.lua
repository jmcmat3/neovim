local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'folke/tokyonight.nvim'
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua fucntions used by lots of plugins
  use 'lunarvim/colorschemes' -- A collection of colorschemse

  -- cmp plugins
  use 'hrsh7th/nvim-cmp'    -- Completion plugin
  use 'hrsh7th/cmp-buffer'  -- Buffer Completion
  use 'hrsh7th/cmp-path'    -- Path Completion
  use 'hrsh7th/cmp-cmdline' -- Cmdline completion
  use 'saadparwaiz1/cmp_luasnip'  -- Snippet completion


   -- snippets
   use 'L3MON4D3/LuaSnip'               -- Snippet engine
   use 'rafamadriz/friendly-snippets'      -- A bunch of useful snippets


   -- LSP
   use 'neovim/nvim-lspconfig'
   use 'williamboman/nvim-lsp-installer'

   use 'wakatime/vim-wakatime'
   use {
     'nvim-telescope/telescope.nvim', tag = '0.1.1',
     requires = { { 'nvim-lua/plenary.nvim' }}
   }

   use 'lewis6991/gitsigns.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


