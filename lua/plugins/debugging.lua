return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            vim.keymap.set("n", "<Leader>dc", function()
                require("dap").continue()
            end)
            vim.keymap.set("n", "<Leader>do", function()
                require("dap").step_over()
            end)
            vim.keymap.set("n", "<Leader>di", function()
                require("dap").step_into()
            end)
            vim.keymap.set("n", "<Leader>dO", function()
                require("dap").step_out()
            end)
            vim.keymap.set("n", "<Leader>dt", function()
                require("dap").toggle_breakpoint()
            end)
            vim.keymap.set("n", "<Leader>dB", function()
                require("dap").set_breakpoint()
            end)
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
}
