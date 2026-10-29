vim.lsp.enable({ "pyright", "ruff", "rust_analyzer", "bashls", "lua_ls" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("hemozeetah.lsp", { clear = true }),
  callback = function(args)
    local opts = { buffer = args.buf }
    local ok, builtin = pcall(require, "telescope.builtin")
    if not ok then
      builtin = {
        lsp_definitions = vim.lsp.buf.definition,
        lsp_references = vim.lsp.buf.references,
        lsp_implementations = vim.lsp.buf.implementation,
        lsp_type_definitions = vim.lsp.buf.type_definition,
        lsp_document_symbols = vim.lsp.buf.document_symbol,
      }
    end
    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
    vim.keymap.set("n", "grr", builtin.lsp_references, opts)
    vim.keymap.set("n", "gri", builtin.lsp_implementations, opts)
    vim.keymap.set("n", "grt", builtin.lsp_type_definitions, opts)
    vim.keymap.set("n", "gO", builtin.lsp_document_symbols, opts)
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)
  end,
})
