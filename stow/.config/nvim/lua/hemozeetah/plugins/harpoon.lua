local harpoon = require("harpoon")

local default_select = require("harpoon.config").get_default_config().default.select

-- directories open in telescope, then oil, then netrw
local function select_dir(dir)
  local ok, builtin = pcall(require, "telescope.builtin")
  if ok then
    return builtin.find_files({ cwd = dir })
  end
  local has_oil, oil = pcall(require, "oil")
  if has_oil then
    return oil.open(dir)
  end
  vim.cmd.edit(dir)
end

harpoon:setup({
  default = {
    select = function(item, list, options)
      if item and vim.fn.isdirectory(item.value) == 1 then
        return select_dir(item.value)
      end
      default_select(item, list, options)
    end,
  },
})

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

for i = 1, 4 do
  vim.keymap.set("n", "<leader>" .. i, function() harpoon:list():select(i) end)
end
