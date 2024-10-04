---@type MappingsTable
local M = {}

M.general = {
	n = {
		["<leader>u"] = { "<cmd>UndotreeToggle<CR>", opts = { nowait = true } },
		["<leader>ln"] = { "<cmd>Navbuddy<CR>", opts = { nowait = true } },
		["<leader>pa"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", opts = { nowait = true } },
		["<leader>pl"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts = { nowait = true } },
		["<leader>cd"] = { "<cmd>cd %:h<CR>", opts = { nowait = true } },
		["<leader>E"] = { "<cmd>Telescope file_browser<CR>", opts = { nowait = true } },
		["<C-1>"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts = { nowait = true } },
		["<C-2>"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts = { nowait = true } },
		["<C-3>"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts = { nowait = true } },
		["<C-4>"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts = { nowait = true } },
	},
}

-- more keybinds!
-- Neovide
local keymap = vim.keymap.set

keymap("n", "-", "<CMD>Oil --float<CR>", { desc = "Open Parent dif" })

if vim.g.neovide == true then
	keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
	keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
	keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

return M
