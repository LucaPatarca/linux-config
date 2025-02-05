vim.g.mapleader = " "

if vim.g.vscode then
  local vscode = require('vscode')
  vim.keymap.set("n", "<leader>t", function() vscode.action("workbench.action.terminal.toggleTerminal") end)
  vim.keymap.set("n", "<leader>m", function() vscode.action("workbench.action.navigateLeft") end)
  vim.keymap.set("n", "<leader>n", function() vscode.action("workbench.action.navigateDown") end)
  vim.keymap.set("n", "<leader>e", function() vscode.action("workbench.action.navigateUp") end)
  vim.keymap.set("n", "<leader>i", function() vscode.action("workbench.action.navigateRight") end)
  vim.keymap.set("n", "<leader>q", function() vscode.action("workbench.action.closeActiveEditor") end)
  vim.keymap.set("n", "<leader>s", function() vscode.action("workbench.action.splitEditorDown") end)
  vim.keymap.set("n", "<leader>v", function() vscode.action("workbench.action.splitEditorRight") end)
else
  vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)
  vim.keymap.set("n", "<leader>t", "<cmd>!alacritty --working-directory $(pwd)& <CR><CR>")
  vim.keymap.set("n", "<leader>m", ":wincmd h<CR>")
  vim.keymap.set("n", "<leader>n", ":wincmd j<CR>")
  vim.keymap.set("n", "<leader>e", ":wincmd k<CR>")
  vim.keymap.set("n", "<leader>i", ":wincmd l<CR>")
  vim.keymap.set("n", "<leader>q", ":wincmd q<CR>")
  vim.keymap.set("n", "<leader>s", "<C-w>s")
  vim.keymap.set("n", "<leader>v", "<C-w>v")
end

vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set("n", "m", "h")
vim.keymap.set("n", "n", "j")
vim.keymap.set("n", "e", "k")
vim.keymap.set("n", "i", "l")

vim.keymap.set("v", "m", "h")
vim.keymap.set("v", "n", "j")
vim.keymap.set("v", "e", "k")
vim.keymap.set("v", "i", "l")

vim.keymap.set("n", "j", "n")
vim.keymap.set("n", "k", "e")
vim.keymap.set("n", "l", "i")
vim.keymap.set("n", "L", "I")

vim.keymap.set("n", "<leader>w", ":w<CR>")

