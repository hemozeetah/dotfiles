-- options
vim.opt.guicursor = "i:hor20-Cursor"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- packages
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

