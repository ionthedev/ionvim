-- C# Language Support for Neovim
return {
    -- Omnisharp C# language server integration
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "Hoffs/omnisharp-extended-lsp.nvim", -- For better C# experience
        },
        config = function()
            -- Extend existing LSP config for C#
            local lspconfig = require("lspconfig")
            local util = require("lspconfig.util")
            local pid = vim.fn.getpid()
            
            -- Platform-specific settings
            local omnisharp_cmd
            local os_name = vim.loop.os_uname().sysname
            
            -- Default for Linux
            local omnisharp_bin = "omnisharp"
            
            -- Platform specific path adjustments
            if os_name == "Windows_NT" then
                omnisharp_bin = "omnisharp.cmd"
            elseif os_name == "Darwin" then
                -- macOS uses the same binary name, but path might be different
                omnisharp_bin = "omnisharp"
            end
            
            -- Setup omnisharp with cross-platform configuration
            lspconfig.omnisharp.setup({
                cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
                root_dir = util.root_pattern("*.csproj", "*.sln"),
                handlers = {
                    ["textDocument/definition"] = require("omnisharp_extended_lsp").handler,
                },
                -- Enable auto-using and organize imports
                enable_roslyn_analyzers = true,
                enable_import_completion = true,
                organize_imports_on_format = true,
                filetypes = { "cs", "csproj", "sln" },
                -- Enable code lens for references and tests
                enable_editorconfig_support = true,
                sdk_include_prereleases = true,
                
                -- Customize C# LSP capabilities
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })
            
            -- Add C# specific keymappings for testing and debugging
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "cs" },
                callback = function()
                    -- Run tests
                    vim.keymap.set("n", "<leader>ct", ":lua require('dap-cs').debug_test()<CR>", { buffer = true, desc = "Debug C# Test" })
                    -- Build project
                    vim.keymap.set("n", "<leader>cb", ":!dotnet build<CR>", { buffer = true, desc = "Build C# Project" })
                    -- Run project
                    vim.keymap.set("n", "<leader>cr", ":!dotnet run<CR>", { buffer = true, desc = "Run C# Project" })
                end,
            })
        end,
    },
    
    -- DAP (Debug Adapter Protocol) configuration for C#
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local dap = require("dap")
            
            -- Set up netcoredbg debug adapter
            dap.adapters.coreclr = {
                type = 'executable',
                command = vim.fn.exepath('netcoredbg'),
                args = {'--interpreter=vscode'}
            }
            
            -- If netcoredbg is not found, provide helpful message
            if vim.fn.exepath('netcoredbg') == "" then
                vim.notify([[
                Debug adapter 'netcoredbg' not found in path.
                Please install it for C# debugging:
                
                - Windows/macOS: https://github.com/Samsung/netcoredbg/releases
                - Linux: Use package manager or build from source
                
                After installing, make sure it's in your PATH.
                ]], vim.log.levels.WARN)
            end
            
            -- Configuration for C# debugging
            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "Launch .NET Core Launch (console)",
                    request = "launch",
                    program = function()
                        local root_dir = vim.fn.getcwd()
                        local dlls = vim.fn.glob(root_dir .. "/bin/Debug/**/*.dll", true, true)
                        
                        -- Filter out test DLLs and auxiliary assemblies
                        local main_dlls = vim.tbl_filter(function(path)
                            return not string.match(path, "%.Test") and
                                  not string.match(path, "%.Tests") and
                                  not string.match(path, "runtimeconfig") and
                                  not string.match(path, "%.deps%.json")
                        end, dlls)
                        
                        if #main_dlls == 0 then
                            return vim.fn.input('Path to DLL: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                        else
                            return vim.fn.input('Path to DLL: ', main_dlls[1], 'file')
                        end
                    end,
                },
                {
                    type = "coreclr",
                    name = "Attach to Process",
                    request = "attach",
                    processId = require('dap.utils').pick_process,
                },
            }
            
            -- Create helper module for C# debugging
            -- Create a module in _G and then move it to a lua module
            _G.CSharpDapHelpers = {}
            _G.CSharpDapHelpers.debug_test = function()
                local test_name = vim.fn.expand("<cword>")
                local test_class = vim.fn.expand("%:t:r")
                
                dap.run({
                    type = "coreclr",
                    name = "Debug Test",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to test DLL: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                    end,
                    args = {"--filter", "FullyQualifiedName=" .. test_class .. "." .. test_name},
                })
            end
            
            -- Simulate a module for our helpers
            package.loaded["dap-cs"] = _G.CSharpDapHelpers
        end,
    },
    
    -- C# syntax support with Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = function()
            -- Ensure C# parser is installed
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "c_sharp" },
                sync_install = true,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true
                },
            }
        end
    },
    
    -- Better snippets for C#
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    
    -- Custom C# code actions and formatting
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            
            null_ls.setup({
                sources = {
                    -- Add C# formatters and linters
                    null_ls.builtins.formatting.csharpier.with({
                        condition = function()
                            return vim.fn.executable("dotnet-csharpier") > 0
                        end,
                    }),
                },
            })
            
            -- Provide installation help if formatter is missing
            if vim.fn.executable("dotnet-csharpier") == 0 then
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = "cs",
                    callback = function()
                        vim.notify([[
                        C# formatter 'csharpier' not found.
                        Install with: dotnet tool install -g csharpier
                        ]], vim.log.levels.INFO)
                    end,
                    once = true,
                })
            end
        end,
    },
}
