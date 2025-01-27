require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "typescript", "rust", "json", "dart", "cpp", "yaml", "dockerfile", "python", "bash", "c", "lua", "vim", "sql" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = {"latex"},
    additional_vim_regex_highlighting = false,
  },
}
