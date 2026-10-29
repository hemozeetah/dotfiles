local languages = {
  "bash", "go", "javascript", "json", "lua", "markdown", "python",
  "query", "rust", "toml", "typescript", "vim", "vimdoc", "yaml",
}

require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("hemozeetah.treesitter", { clear = true }),
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
