-- File Navigation and Search
return {
  -- Snacks.nvim picker
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        enabled = true,
        win = {
          input = {
            keys = {
              ["<C-n>"] = { "list_down", mode = { "i", "n" } },
              ["<C-p>"] = { "list_up", mode = { "i", "n" } },
              ["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
              ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
              ["<Up>"] = { "history_back", mode = { "i", "n" } },
              ["<Down>"] = { "history_forward", mode = { "i", "n" } },
            },
          },
        },
      },
    },
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  -- Oil.nvim file explorer
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
      },
      float = {
        padding = 2,
        max_width = 90,
        max_height = 30,
      },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-s>"] = "actions.select_split",
        ["<C-v>"] = "actions.select_vsplit",
      },
    },
    dependencies = { "echasnovski/mini.icons" },
  },

  -- Mini icons for oil and other plugins
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {},
  },

  -- Harpoon for quick file navigation
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>pa", desc = "Harpoon: Add file" },
      { "<leader>pl", desc = "Harpoon: Toggle menu" },
      { "<C-1>",      desc = "Harpoon: File 1" },
      { "<C-2>",      desc = "Harpoon: File 2" },
      { "<C-3>",      desc = "Harpoon: File 3" },
      { "<C-4>",      desc = "Harpoon: File 4" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
      })
    end,
  },
}
