return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Use a local variable for shorter mapping calls
        local keymap = vim.keymap.set

        -- 1. Debugger Control (F-Keys are standard for debuggers)
        keymap('n', '<F5>', function() dap.continue() end, { desc = "Debug: Start/Continue" })
        keymap('n', '<F10>', function() dap.step_over() end, { desc = "Debug: Step Over" })
        keymap('n', '<F11>', function() dap.step_into() end, { desc = "Debug: Step Into" })
        keymap('n', '<F12>', function() dap.step_out() end, { desc = "Debug: Step Out" })

        -- 2. Breakpoints and UI
        keymap('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
        keymap('n', '<leader>dB', function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end, { desc = "Debug: Set Conditional Breakpoint" })

        keymap('n', '<leader>du', function() dapui.toggle() end, { desc = "Debug: Toggle UI" })

        -- 3. Visual Element Inspection
        -- Hover to see value of variable under cursor
        keymap('n', '<leader>dh', function() require('dap.ui.widgets').hover() end, { desc = "Debug: Hover Variable" })

        dapui.setup()

        -- Automatically open/close UI
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- config GDB
        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" }
        }

        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
        }

        -- Reuse for C and Rust
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
    end
}
