return {
    {
        "mfussenegger/nvim-dap",
        cond = not vim.g.vscode,
        config = function()
            local dap = require("dap")

            vim.keymap.set("n", "<leader>tb", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>r", dap.continue)
            vim.keymap.set("n", "<leader>so", dap.step_over)
            vim.keymap.set("n", "<leader>si", dap.step_into)

            dap.adapters.dart = {
                type = 'executable',
                command = vim.fn.stdpath('data') .. '/mason/bin/dart-debug-adapter',
                args = { 'dart' }
            }
            dap.adapters.flutter = {
                type = 'executable',
                command = vim.fn.stdpath('data') .. '/mason/bin/dart-debug-adapter',
                args = { 'flutter' }
            }
            dap.configurations.dart = {
                {
                    type = "dart",
                    request = "launch",
                    name = "Launch dart",
                    dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/", -- ensure this is correct
                    flutterSdkPath = "/opt/flutter",  -- ensure this is correct
                    program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter",
                    dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/", -- ensure this is correct
                    flutterSdkPath = "/opt/flutter",  -- ensure this is correct
                    program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
                    cwd = "${workspaceFolder}",
                }
            }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        cond = not vim.g.vscode,
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            vim.keymap.set('n', '<leader>do', function() dapui.open() end)
            vim.keymap.set('n', '<leader>dq', function() dapui.close() end)
        end
    },
}
