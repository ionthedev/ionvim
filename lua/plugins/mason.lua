-- In nvim/lua/plugins/mason.lua
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "debugpy",
        "tree-sitter-cli",
        "jedi-language-server",
        "csharp-language-server",
        "gdtoolkit",
        "rust-analyzer",
      },
    },
  },
}
