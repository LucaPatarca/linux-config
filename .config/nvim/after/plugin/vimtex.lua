vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = 'abdmg'

vim.keymap.set('n', '<leader>lc', vim.cmd.VimtexCompile)
