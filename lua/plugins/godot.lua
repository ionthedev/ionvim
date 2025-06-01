-- lua/plugins/godot.lua

return {
  -- GDScript LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {
          -- You can specify any custom settings here if needed
          -- Example: settings = {}
          cmd = { "nc", "127.0.0.1", "6005" },
        },
        -- For C# (OmniSharp)
        omnisharp = {
          cmd = {
            "/Users/ion/bin/omnisharp-roslyn/OmniSharp",
            "--languageserver",
            "--hostPID",
            tostring(vim.fn.getpid()),
          },
          -- Adjust this path as needed!
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
    },
  },

  -- DAP for C# (if you want debugging in Godot C#)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require "dap"
      -- Example: Setup for netcoredbg (C# debugging)
      dap.adapters.coreclr = {
        type = "executable",
        command = "/usr/local/bin/netcoredbg", -- Update this path
        args = { "--interpreter=vscode" },
      }
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function() return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file") end,
        },
      }
      -- DAP-UI setup (optional but recommended)
      require("dapui").setup()
    end,
  },
}
