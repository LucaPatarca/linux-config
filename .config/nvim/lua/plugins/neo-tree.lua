return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-tree/nvim-web-devicons" },
            { "MunifTanjim/nui.nvim" },
        },
        cond = not vim.g.vscode,
        config = function()
            vim.keymap.set('n', '\\', "<Cmd>Neotree toggle position=left<CR>")
            local icons = require("utils").icons
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            vim.fn.sign_define("DiagnosticSignError",
                { text = icons.ui.lsp_error, texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn",
                { text = icons.ui.lsp_warn, texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo",
                { text = icons.ui.lsp_info, texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint",
                { text = icons.ui.lsp_hint, texthl = "DiagnosticSignHint" })

            require("neo-tree").setup({
                log_level = "error",
                close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
                enable_git_status = true,
                enable_diagnostics = true,
                sort_case_insensitive = true, -- used when sorting files and directories in the tree
                default_component_configs = {
                    name = {
                        trailing_slash = true,
                        use_git_status_colors = true,
                        highlight = "NeoTreeFileName",
                    },
                    git_status = {
                        symbols = {
                            -- Change type
                            added     = "",    -- or "✚", but this is redundant info if you use git_status_colors on the name
                            modified  = "",    -- or "", but this is redundant info if you use git_status_colors on the name
                            deleted   = icons.git.delete, -- this can only be used in the git_status source
                            renamed   = icons.git.renamed, -- this can only be used in the git_status source
                            -- Status type
                            untracked = icons.git.untracked,
                            ignored   = icons.git.ignored,
                            unstaged  = icons.git.unstaged,
                            staged    = icons.git.staged,
                            conflict  = icons.git.conflict,
                        }
                    },
                },
                window = {
                    position = "left",
                    width = 40,
                    mappings = {
                        ["<space>"] = {
                            "toggle_node",
                            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
                        },
                        ["<2-LeftMouse>"] = "open",
                        ["<cr>"] = "open",
                        ["<esc>"] = "revert_preview",
                        ["P"] = { "toggle_preview", config = { use_float = true } },
                        ["S"] = "open_split",
                        ["s"] = "open_vsplit",
                        ["t"] = "open_tabnew",
                        ["w"] = "open_with_window_picker",
                        ["C"] = "close_node",
                        ["z"] = "close_all_nodes",
                        ["a"] = {
                            "add",
                            config = {
                                show_path = "none" -- "none", "relative", "absolute"
                            }
                        },
                        ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                        ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                        ["<"] = "prev_source",
                        [">"] = "next_source",
                        ["e"] = "move_cursor_up",
                    }
                },
                filesystem = {
                    filtered_items = {
                        visible = false, -- when true, they will just be displayed differently than normal items
                        hide_dotfiles = true,
                        hide_gitignored = true,
                        hide_hidden = true, -- only works on Windows for hidden files/directories
                    },
                    group_empty_dirs = false, -- when true, empty folders will be grouped together
                    use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
                    window = {
                        mappings = {
                            ["<bs>"] = "navigate_up",
                            ["."] = "set_root",
                            ["H"] = "toggle_hidden",
                            ["/"] = "fuzzy_finder",
                            ["D"] = "fuzzy_finder_directory",
                            ["f"] = "filter_on_submit",
                            ["<c-x>"] = "clear_filter",
                            ["[g"] = "prev_git_modified",
                            ["]g"] = "next_git_modified",
                        }
                    }
                },
                buffers = {
                    follow_current_file = true, -- This will find and focus the file in the active buffer every
                    -- time the current file is changed while the tree is open.
                    group_empty_dirs = true, -- when true, empty folders will be grouped together
                    window = {
                        mappings = {
                            ["bd"] = "buffer_delete",
                            ["<bs>"] = "navigate_up",
                            ["."] = "set_root",
                        }
                    },
                },
                git_status = {
                    window = {
                        position = "float",
                        mappings = {
                            ["A"]  = "git_add_all",
                            ["gu"] = "git_unstage_file",
                            ["ga"] = "git_add_file",
                            ["gr"] = "git_revert_file",
                            ["gc"] = "git_commit",
                            ["gp"] = "git_push",
                            ["gg"] = "git_commit_and_push",
                        }
                    }
                }
            })
        end
    },
}
