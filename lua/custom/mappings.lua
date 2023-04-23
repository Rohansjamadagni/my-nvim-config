---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>u"] = { "<cmd>UndotreeToggle<CR>",  opts = { nowait = true } },
    ["<leader>ln"] = { "<cmd>Navbuddy<CR>",  opts = { nowait = true } },
  },
}

-- more keybinds!
-- Neovide
local keymap = vim.keymap.set

if vim.g.neovide == true then
	keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
	keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
	keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

return M
