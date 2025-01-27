return {
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
	},
  {
    "goolord/alpha-nvim",
    lazy = true,
    event = "VimEnter",
    cmd = "Alpha",
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
  },
  {
    "shaunsingh/nord.nvim",
    lazy = true,
  }
}
