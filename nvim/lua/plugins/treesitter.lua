return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua", "python", "javascript",
      "html", "css", "json", "markdown",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
