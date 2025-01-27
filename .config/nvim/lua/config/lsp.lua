local M = {}

if vim.g.vscode then return M end

M.on_attach = function (client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<leader>rm', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({async=true}) end, opts)
end

return M
