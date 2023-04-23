---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>u"] = { "<cmd>UndotreeToggle<CR>",  opts = { nowait = true } },
    ["<leader>ln"] = { "<cmd>Navbuddy<CR>",  opts = { nowait = true } },
  },
}

-- more keybinds!

return M
