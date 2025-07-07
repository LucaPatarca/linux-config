return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        tag = "v0.10.0",
        build = ":TSUpdate",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "typescript",
                    "rust",
                    "json",
                    "dart",
                    "cpp",
                    "go",
                    "yaml",
                    "dockerfile",
                    "python",
                    "bash",
                    "c",
                    "lua",
                    "vim",
                    "sql"
                },
                auto_install = true,
                ignore_install = {},
                modules = {},
                sync_install = false,
            }
            vim.api.nvim_create_autocmd('FileType', {
                pattern = {
                    'ts',
                    'vue',
                    'tsx',
                    'rs',
                    'json',
                    'dart',
                    'cpp',
                    'go',
                    'yaml',
                    'yml',
                    'Dockerfile',
                    'py',
                    'sh',
                    'c',
                    'lua',
                    'vim',
                    'sql'
                },
                callback = function() vim.treesitter.start() end,
            })
        end
    },
}
