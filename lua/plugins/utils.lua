-- Utility plugins
return {
  -- Auto pairs
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },

  -- Surround text objects
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- Undotree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },

  -- Auto session management
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_restore_enabled = true,
      auto_save_enabled = true,
      post_restore_cmds = {
        function()
          -- Re-detect filetype on all restored buffers to trigger treesitter
          vim.schedule(function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "" then
                vim.api.nvim_buf_call(buf, function()
                  vim.cmd("filetype detect")
                end)
              end
            end
          end)
        end,
      },
    },
  },

  -- Tmux integration
  {
    "aserowy/tmux.nvim",
    event = "VeryLazy",
    config = function()
      require("tmux").setup({
        copy_sync = {
          enable = true,
        },
        navigation = {
          enable_default_keybindings = true,
        },
        resize = {
          enable_default_keybindings = true,
        },
      })
    end,
  },

  -- Nvim-unception (prevent nested nvim instances)
  {
    "samjwill/nvim-unception",
    event = "VeryLazy",
    init = function()
      vim.g.unception_open_buffer_in_new_tab = true
    end,
  },

  -- Which-key for keybinding hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        preset = "modern",
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
        },
        win = {
          border = "rounded",
          padding = { 1, 2 },
        },
      })
    end,
  },
}
