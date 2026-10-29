local gitsigns = require("gitsigns")

gitsigns.setup({
  on_attach = function(buf)
    local opts = { buffer = buf }
    vim.keymap.set("n", "]h", function() gitsigns.nav_hunk("next") end, opts)
    vim.keymap.set("n", "[h", function() gitsigns.nav_hunk("prev") end, opts)
    vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, opts)
    vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, opts)
  end,
})
