require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { "arduino_language_server", "lemminx", "lua_ls", "clangd", "jedi_language_server", "ts_ls", "tinymist" }

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
end

for _, server in ipairs(servers) do
    vim.lsp.config(server, {
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

mason_lspconfig.setup({
    ensure_installed = servers,
    handlers = {
        rust_analyzer = function() end,  -- disable mason's rust_analyzer since rustaceanvim handles it
    },
})

local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }),
})
