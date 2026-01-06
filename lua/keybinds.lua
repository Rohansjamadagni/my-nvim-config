-- ============================================================================
-- KEYMAPS
-- ============================================================================

local map = vim.keymap.set

-- ============================================================================
-- Window Management
-- ============================================================================

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<C-w>c", "<C-w>q", { desc = "Close window" })
map("n", "<C-w><C-c>", "<C-w>q", { desc = "Close window" })

-- Terminal mode window navigation
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })

-- Resize windows
map("n", "<C-Up>", ":resize -2<CR>", { silent = true })
map("n", "<C-Down>", ":resize +2<CR>", { silent = true })
map("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- ============================================================================
-- Buffer Management
-- ============================================================================

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", { silent = true })
map("n", "<S-h>", ":bprevious<CR>", { silent = true })
map("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer" })

-- ============================================================================
-- Editing
-- ============================================================================

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better paste
map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Quick save
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- ============================================================================
-- Terminal
-- ============================================================================

map("n", "<leader>v", ":vsplit | terminal<CR>", { desc = "Open terminal in vsplit" })
map("n", "<leader>h", ":split | terminal<CR>", { desc = "Open terminal in hsplit" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ============================================================================
-- File Navigation
-- ============================================================================

-- Oil.nvim
map("n", "-", "<CMD>Oil --float .<CR>", { desc = "Open current directory" })

-- Harpoon
map("n", "<leader>pa", function() require("harpoon.mark").add_file() end, { desc = "Harpoon: Add file" })
map("n", "<leader>pl", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Harpoon: Toggle menu" })
map("n", "<C-1>", function() require("harpoon.ui").nav_file(1) end, { desc = "Harpoon: File 1" })
map("n", "<C-2>", function() require("harpoon.ui").nav_file(2) end, { desc = "Harpoon: File 2" })
map("n", "<C-3>", function() require("harpoon.ui").nav_file(3) end, { desc = "Harpoon: File 3" })
map("n", "<C-4>", function() require("harpoon.ui").nav_file(4) end, { desc = "Harpoon: File 4" })

-- Undotree
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle undotree" })

-- Snacks picker with previews
map("n", "<leader>f", function() Snacks.picker.files() end, { desc = "Find files" })
map("n", "<leader>q", function() Snacks.picker.grep() end, { desc = "Live grep" })
map("n", "<leader>b", function() Snacks.picker.buffers() end, { desc = "Show buffers" })

-- Change directory to current file
map("n", "<leader>cd", ":cd %:h<CR>", { desc = "CD to current file" })

-- ============================================================================
-- Git
-- ============================================================================

-- Git status
map("n", "<leader>gs", function()
  vim.cmd("vertical Git")
  local width = vim.o.columns
  vim.cmd("vertical resize " .. math.floor(width * 0.4))
end, { desc = "Git status (vsplit 60-40)" })

-- Git rebase interactive
map("n", "<leader>gri", function()
  vim.ui.input({ prompt = "Rebase last N commits: " }, function(input)
    if input and input ~= "" then
      vim.cmd("Git rebase -i --autosquash --autostash HEAD~" .. input)
    end
  end)
end, { desc = "Git rebase -i --autosquash --autostash HEAD~N" })

-- Git absorb
map("n", "<leader>ga", ":Git absorb --and-rebase<CR>", { desc = "Git absorb" })

-- Git commit fixup (with commit picker)
map("n", "<leader>gcf", function()
  Snacks.picker.git_log({
    limit = 100,
    actions = {
      confirm = function(picker, item)
        picker:close() -- Close the picker first
        if item and item.commit then
          vim.cmd("Git commit --fixup=" .. item.commit)
        end
      end,
    },
  })
end, { desc = "Git commit --fixup" })

-- Git log
map("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })

-- Git worktree helpers
map("n", "<leader>gwl", ":Git worktree list<CR>", { desc = "Git worktree list" })

map("n", "<leader>gwa", function()
  vim.ui.input({ prompt = "Worktree branch name: " }, function(branch)
    if branch and branch ~= "" then
      vim.ui.input({ prompt = "Worktree path: " }, function(path)
        if path and path ~= "" then
          vim.cmd("Git worktree add " .. path .. " " .. branch)
        end
      end)
    end
  end)
end, { desc = "Git worktree add" })

map("n", "<leader>gwc", function()
  -- Get list of worktrees
  local result = vim.fn.systemlist("git worktree list")
  if vim.v.shell_error ~= 0 then
    vim.notify("Not in a git repository or no worktrees found", vim.log.levels.ERROR)
    return
  end

  -- Parse worktree paths
  local worktrees = {}
  for _, line in ipairs(result) do
    -- Format: /path/to/worktree  commit-hash  [branch-name]
    local path = line:match("^([^%s]+)")
    if path then
      table.insert(worktrees, path)
    end
  end

  if #worktrees == 0 then
    vim.notify("No worktrees found", vim.log.levels.WARN)
    return
  end

  -- Let user select worktree
  vim.ui.select(worktrees, {
    prompt = "Select worktree to cd into:",
    format_item = function(item)
      return item
    end,
  }, function(choice)
    if choice then
      vim.cmd("cd " .. choice)
      vim.notify("Changed directory to: " .. choice)
    end
  end)
end, { desc = "Git worktree cd" })

-- ============================================================================
-- Neovide Specific
-- ============================================================================

if vim.g.neovide then
  map("n", "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
  map("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
  map("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end


--- Arista Specific stuff --- 
map("n", "<leader>a2", ":set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab")
map("n", "<leader>a3", ":set tabstop=6 softtabstop=0 expandtab shiftwidth=3 smarttab")
map("n", "<leader>a4", ":set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab")
