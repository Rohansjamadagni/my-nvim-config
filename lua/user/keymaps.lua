-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)


-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)
-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Save buffer
keymap("n", "<leader>w", "<cmd>w<CR>", opts)


-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope fd<CR>", opts)
keymap("n", "<leader>q", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>r", "<cmd>Telescope oldfiles<CR>", opts)
keymap("n", "<leader>j", "<cmd>Telescope jumplist<CR>", opts)
keymap("n", "<leader>p", "<cmd>Telescope projects<CR>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>s", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>tt", "<cmd>Telescope builtin<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Harpoon
keymap("n", "<leader>hh", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", opts)
keymap("n", "<leader>ha", "<cmd>lua require'harpoon.mark'.add_file()<cr>", opts)
keymap("n", "<leader>1", "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", opts)
keymap("n", "<leader>2", "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", opts)
keymap("n", "<leader>3", "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", opts)
keymap("n", "<leader>4", "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", opts)
keymap("n", "<leader>5", "<cmd>lua require'harpoon.ui'.nav_file(5)<cr>", opts)

-- fugitive
keymap("n", "<leader>gs", "<cmd>vert G<cr>", opts)
keymap("n", "<leader>gf", "<cmd>diffget //2<cr>", opts)
keymap("n", "<leader>gj", "<cmd>diffget //3<cr>", opts)
keymap("n", "<leader>gt", "<cmd>Git push<cr>", opts)
keymap("n", "<leader>gy", "<cmd>Git pull<cr>", opts)
keymap("n", "<leader>gl", "<cmd>Gclog<cr>", opts)

-- undo tree
keymap("n", "<leader>u", "<cmd>UndotreeToggle<cr>", opts)

-- Neovide
if vim.g.neovide == true then
  keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
  keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
  keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
