local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader>e", "<cmd>Explore<CR>")

-- split windows
map("n", "<leader>vs", vim.cmd.vsplit)
map("n", "<leader>hs", vim.cmd.split)

-- move selection
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- copy paste clipboard
map("v", "<leader>y", "\"+y")
map("n", "<leader>y", "\"+y")
map("n", "<leader>yy", "\"+yy")
map("n", "<leader>Y", "\"+yg_")
map("n", "<leader>p", "\"+p")
map("n", "<leader>P", "\"+P")
map("v", "<leader>p", "\"+p")
map("v", "<leader>P", "\"+P")
