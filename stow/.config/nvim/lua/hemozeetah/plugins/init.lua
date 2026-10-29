vim.pack.add({
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  "https://github.com/github/copilot.vim",
}, { confirm = false })

require("hemozeetah.plugins.colorscheme")
require("hemozeetah.plugins.telescope")
require("hemozeetah.plugins.gitsigns")
require("hemozeetah.plugins.harpoon")
require("hemozeetah.plugins.treesitter")
require("hemozeetah.plugins.treesitter-context")
require("hemozeetah.plugins.blink")
