return {
    {
        "akinsho/flutter-tools.nvim",
        name = "flutter",
        dependencies = { "nvim-lua/plenary.nvim" },
        cond = not vim.g.vscode,
        config = function()
            require("flutter-tools").setup {
                flutter_path = "/opt/flutter/bin/flutter",
                flutter_lookup_cmd = nil,
                debugger = {
                    enabled = true,
                    run_via_dap = true,
                    exception_breakpoints = {},
                },
                outline = { auto_open = false },
                decorations = {
                    statusline = { device = true, app_version = true },
                },
                lsp = {
                    color = {
                        enabled = true,
                        background = true,
                        virtual_text = false,
                    },
                    settings = {
                        showTodos = true,
                        renameFilesWithClasses = "prompt",
                    },
                },
            }

            vim.keymap.set('n', '<leader>fl', "<cmd>Telescope flutter commands<CR>")
        end
    },
}
