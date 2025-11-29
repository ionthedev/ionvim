-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'vague-theme/vague.nvim',
	  as = 'vague',
	  config = function()
		  vim.cmd('colorscheme vague')
	  end
  }

  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use 'nvim-treesitter/playground'

  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }

  use "mbbill/undotree"

  use "tpope/vim-fugitive"

   use "mason-org/mason.nvim"
    use {
      "mason-org/mason-lspconfig.nvim",
      config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({})
      end,
    }
   use {

     "neovim/nvim-lspconfig",

      config = function()

        local esp32 = require("esp32")

        vim.lsp.enable('clangd')

        vim.lsp.config('clangd', esp32.lsp_config())

      end

   }

   use 'hrsh7th/nvim-cmp'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'

    use 'mrcjkb/rustaceanvim'

    use 'felpafel/inlay-hint.nvim'

    use {
       'Cassin01/wf.nvim',
       config = function()
         require("wf").setup()
       end
     }

    use {
        'mikavilpas/yazi.nvim',
        config = function()
          require('yazi').setup({
            open_for_directories = true,
          })
        end
      }
use {"akinsho/toggleterm.nvim", tag = '*', config = function()
       require("toggleterm").setup()
     end}

      use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        requires = {'nvim-tree/nvim-web-devicons'}
      }

      use 'folke/snacks.nvim'
       use {
         'Aietes/esp32.nvim',
         config = function()
           require('esp32').setup({ build_dir = 'build' })
         end
       }

  end)
