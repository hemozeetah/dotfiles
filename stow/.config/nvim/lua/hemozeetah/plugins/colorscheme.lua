require("rose-pine").setup({
  variant = "auto",
  dark_variant = "main",
  styles = { transparency = true },
  highlight_groups = {
    StatusLine = { fg = "base", bg = "pine", bold = true },
  },
})

vim.cmd.colorscheme("rose-pine")
