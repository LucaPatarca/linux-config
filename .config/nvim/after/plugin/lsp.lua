if vim.g.vscode then
  local vscode = require('vscode')
  -- vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end)
  vim.keymap.set('n', '<leader>rm', function() vscode.action('editor.action.rename') end)
  vim.keymap.set('n', '<leader>fm', function() vscode.action('editor.action.formatDocument') end)
  return
end

local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.ensure_installed({
    'gopls',
    'html',
    'jsonls',
    'pyright',
    'rust_analyzer',
    'tsserver',
    'clangd',
    'cmake',
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mappings = cmp_mappings,
})

lsp.on_attach(require("config.lsp").on_attach)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

