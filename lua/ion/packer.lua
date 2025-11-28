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
       require("mason-lspconfig").setup({
         ensure_installed = { "arduino_language_server" },
         handlers = {
           ["arduino_language_server"] = function()
             local config_file = ".arduino_config.lua"
             local settings = { board = "esp32:esp32:esp32s3", port = "/dev/ttyACM0" }
             if vim.fn.filereadable(config_file) == 1 then
               local config = loadfile(config_file)
               if config then
                 local ok, loaded = pcall(config)
                 if ok and loaded then
                   settings = loaded
                 end
               end
             end
             require("lspconfig").arduino_language_server.setup({
               cmd = {
                 "arduino-language-server",
                 "-cli", "arduino-cli",
                 "-cli-config", vim.fn.expand("$HOME/.arduino15/arduino-cli.yaml"),
                 "-clangd", vim.fn.exepath("clangd") or "/usr/bin/clangd",
                 "-fqbn", "esp32:esp32:esp32s3",
               },
               filetypes = { "arduino", "cpp", "c" },
               root_dir = function()
                  local cwd = vim.fn.getcwd()
                  local arduino_files = vim.fn.glob(cwd .. "/*.ino", 0, 1)
                  if #arduino_files > 0 then
                    return cwd
                  end
                  -- Check parent directories
                  local parent = cwd
                  while parent ~= "/" do
                    parent = vim.fn.fnamemodify(parent, ":h")
                    arduino_files = vim.fn.glob(parent .. "/*.ino", 0, 1)
                    if #arduino_files > 0 then
                      return parent
                    end
                  end
                  return nil
                end,
             })
           end,
         },
       })
     end,
   }
   use "neovim/nvim-lspconfig"

   use 'hrsh7th/nvim-cmp'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'

    use 'mrcjkb/rustaceanvim'

     use 'felpafel/inlay-hint.nvim'

     use {
       'yuukiflow/Arduino-Nvim',
       requires = { {'nvim-telescope/telescope.nvim'}, {'neovim/nvim-lspconfig'} },
       config = function()
         require("Arduino-Nvim")
         vim.cmd([[autocmd BufRead,BufNewFile *.ino,*.c set filetype=arduino]])
       end,
      }

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

 end)
