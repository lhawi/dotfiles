return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    integrations = {
      nvim_tree = true,
      telescope = true,
      which_key = true,
      gitsigns = true,
    },
  },
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
