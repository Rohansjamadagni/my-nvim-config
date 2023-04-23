local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

-- -- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]
--
-- -- Use a protected call so we don't error out on first use
-- local status_ok, packer = pcall(require, "packer")
-- if not status_ok then
--   return
-- end
--
-- -- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
--   git = {
--     clone_timeout = 300, -- Timeout, in seconds, for git clones
--   },
-- }

-- Install your plugins here
require('lazy').setup({
  { "nvim-lua/plenary.nvim",  }, -- Useful lua functions used by lots of plugins
  { "windwp/nvim-autopairs",  }, -- Autopairs, integrates with both cmp and treesitter
  { "numToStr/Comment.nvim",  },
  { "JoosepAlviste/nvim-ts-context-commentstring",  },
  { "kyazdani42/nvim-web-devicons",  },
  { "kyazdani42/nvim-tree.lua",  },
  { "akinsho/bufferline.nvim",  },
  { "moll/vim-bbye",  },
  { "nvim-lualine/lualine.nvim",  },
  { "ahmedkhalf/project.nvim",  },
  { "lewis6991/impatient.nvim",  },
  { "lukas-reineke/indent-blankline.nvim",  },
  { "goolord/alpha-nvim",  },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "dstein64/vim-startuptime" },
  { "ThePrimeagen/harpoon" },
  { "ThePrimeagen/vim-be-good" },
  { "mbbill/undotree" },
  { "rebelot/kanagawa.nvim" },
  { "mg979/vim-visual-multi" },
  { "unblevable/quick-scope" },
  { "folke/which-key.nvim" },
  { "folke/noice.nvim", dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to the notification view.
    --   If not available, we `mini` as the fallback
    "rcarriga/nvim-notify",
    } },

  -- Colorschemes
  { "lunarvim/darkplus.nvim",  },
  { "LunarVim/onedarker.nvim" },
  { "folke/tokyonight.nvim",  },
  { "ellisonleao/gruvbox.nvim" },
  { 'shaunsingh/solarized.nvim'},

  -- cmp plugins
  { "hrsh7th/nvim-cmp",  }, -- The completion plugin
  { "hrsh7th/cmp-buffer",  }, -- buffer completions
  { "hrsh7th/cmp-path",  }, -- path completions
  { "saadparwaiz1/cmp_luasnip",  }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp",  },
  { "hrsh7th/cmp-nvim-lua",  },

  -- snippets
  { "L3MON4D3/LuaSnip",  }, --snippet engine
  { "rafamadriz/friendly-snippets",  }, -- a bunch of snippets to use

  -- LSP
  { "neovim/nvim-lspconfig",  }, -- enable LSP
  { "williamboman/mason.nvim", },
  { "williamboman/mason-lspconfig.nvim",  },
  { "jose-elias-alvarez/null-ls.nvim",  }, -- for formatters and linters
  { "RRethy/vim-illuminate",  },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter"
  },

  -- Git
  { "lewis6991/gitsigns.nvim",  },

  -- DAP
  { "mfussenegger/nvim-dap",  },
  { "rcarriga/nvim-dap-ui",  },
  { "ravenxrz/DAPInstall.nvim",  },

  -- golang
  { "ray-x/go.nvim" },
  { "ray-x/guihua.lua" },

  -- navbuddy
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim",        -- Optional
      "nvim-telescope/telescope.nvim" -- Optional
    }
  },
})
