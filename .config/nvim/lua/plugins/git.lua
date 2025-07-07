return {
    {
        "tpope/vim-fugitive",
        cond = not vim.g.vscode,
        config = function()
            vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        cond = not vim.g.vscode,
        config = function()
            require("gitsigns").setup()
        end
    },
}
