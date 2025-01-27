return {
	{
		"nvim-telescope/telescope.nvim", 
    version = "0.1.4",
		dependencies = { {'nvim-lua/plenary.nvim'} },
    cond = not vim.g.vscode
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	{ "tpope/vim-fugitive" },
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
    cond = not vim.g.vscode,
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	},
  { "lervag/vimtex" },
  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      dependencies = {
          {"nvim-lua/plenary.nvim"},
          {"nvim-tree/nvim-web-devicons"},
          {"MunifTanjim/nui.nvim"},
      },
      cond = not vim.g.vscode
  },
  { "lewis6991/gitsigns.nvim" },
  { 
    "nvim-telescope/telescope-ui-select.nvim",
    cond = not vim.g.vscode
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
