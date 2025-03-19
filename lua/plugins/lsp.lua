return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "pyright", "rust_analyzer" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()

            local capablities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({capablities = capablities})
            lspconfig.clangd.setup({
                "c",
                "cpp",
                "objc",
                "objcpp",
                "cuda",
                "proto",
                "clangd",
                offsetEncoding = { "utf-8", "utf-16" },
                textDocument = {
                    completion = {
                        editsNearCursor = true,
                    },
                },
                capabilities = capablities
            })
            lspconfig.cmake.setup({ "cmake-language-server", "cmake", capabilities = capabilities })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
