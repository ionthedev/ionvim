return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "cpp", "c", "python", "javascript", "typescript" },
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
