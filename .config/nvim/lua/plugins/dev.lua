return {
    {
      "akinsho/flutter-tools.nvim",
      name = "flutter",
      dependencies = { "nvim-lua/plenary.nvim" },
      cond = not vim.g.vscode
    },
    { "elkowar/yuck.vim" },
    { 
      "mfussenegger/nvim-dap",
      cond = not vim.g.vscode
    },
    { 
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
      cond = not vim.g.vscode
    },
    { 
      "leoluz/nvim-dap-go",
      cond = not vim.g.vscode
    },
    { "folke/neodev.nvim", 
      opts = {},
      cond = not vim.g.vscode
    },
    { 
      "shatur/neovim-session-manager",
      lazy=true,
      event="VimEnter",
      cond = not vim.g.vscode
    }
}
