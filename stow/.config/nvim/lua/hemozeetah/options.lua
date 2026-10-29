local opt = vim.opt

opt.guicursor = "i:hor20-Cursor"

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.wrap = false
opt.splitright = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.cursorline = true

opt.ignorecase = true
opt.smartcase = true

vim.cmd.packadd("nvim.undotree")

-- autocmds
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end,
})

local cursorLineGroup = vim.api.nvim_create_augroup("CursorLineOnlyInActiveWindow", { clear = true })
vim.api.nvim_create_autocmd({"WinEnter", "BufWinEnter", "InsertLeave"}, {
  group = cursorLineGroup,
    pattern = "*",
    callback = function()
      vim.opt.cursorline = true
    end,
})
vim.api.nvim_create_autocmd({"WinLeave", "InsertEnter"}, {
  group = cursorLineGroup,
  pattern = "*",
  callback = function()
    vim.opt.cursorline = false
  end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("RemoveTrailingWhitespaces", { clear = true }),
--   pattern = "*",
--   command = [[%s/\s\+$//e]],
-- })

