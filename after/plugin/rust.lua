vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
    test_executor = 'background',
  },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- Enable inlay hints
      vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
      -- Keymaps
      vim.keymap.set(
        "n",
        "<leader>a",
        function()
          vim.cmd.RustLsp('codeAction')
        end,
        { silent = true, buffer = bufnr }
      )
      vim.keymap.set(
        "n",
        "K",
        function()
          vim.cmd.RustLsp({'hover', 'actions'})
        end,
        { silent = true, buffer = bufnr }
      )
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        check = {
          command = "clippy",
          extraArgs = { "--no-deps" }
        },
        checkOnSave = true,
        inlayHints = {
          typeHints = { enable = true },
          parameterHints = { enable = true },
        },
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}