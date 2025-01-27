if vim.g.vscode then
  local vscode = require('vscode')
  vim.keymap.set('n', '<leader>fs', function() vscode.action("workbench.action.terminal.searchWorkspace") end)
  vim.keymap.set('n', '<leader>gf', function() vscode.action("workbench.action.quickOpen") end)
else
  local builtin = require("telescope.builtin")
  vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
  vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({search= vim.fn.input("Grep > ")})
  end)

  require("telescope").setup {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      }
    }
  }
  require("telescope").load_extension("ui-select")
end
