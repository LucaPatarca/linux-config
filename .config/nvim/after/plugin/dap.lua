if vim.g.vscode then return end

local dap = require("dap")

vim.keymap.set("n", "<leader>tb", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>r", dap.continue)
vim.keymap.set("n", "<leader>so", dap.step_over)
vim.keymap.set("n", "<leader>si", dap.step_into)

dap.adapters.dart = {
  type = 'executable',
  command = vim.fn.stdpath('data')..'/mason/bin/dart-debug-adapter',
  args = {'dart'}
}
dap.adapters.flutter = {
  type = 'executable',
  command = vim.fn.stdpath('data')..'/mason/bin/dart-debug-adapter',
  args = {'flutter'}
}
dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch dart",
    dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/", -- ensure this is correct
    flutterSdkPath = "/opt/flutter",                  -- ensure this is correct
    program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
    cwd = "${workspaceFolder}",
  },
  {
    type = "flutter",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/", -- ensure this is correct
    flutterSdkPath = "/opt/flutter",                  -- ensure this is correct
    program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
    cwd = "${workspaceFolder}",
  }
}
