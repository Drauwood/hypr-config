require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
