local oil = require("oil")

oil.setup({
  default_file_explorer = true,
  columns = {},
  view_options = { show_hidden = true },
})

vim.keymap.set("n", "-", oil.open)
vim.keymap.set("n", "<leader>e", function() oil.open(vim.fn.getcwd()) end)
