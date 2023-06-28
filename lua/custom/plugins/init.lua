-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },

  {
    'kylechui/nvim-surround',
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  -- Pretty icons, mainly for nvim-tree
  {
    'nvim-tree/nvim-web-devicons'
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup()

      vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeToggle)
      vim.keymap.set("n", "<leader>m", vim.cmd.NvimTreeFindFileToggle)
    end
  },

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    config = function()
      require('barbar').setup({
        auto_hide = true,
        sidebar_filetypes = {
          -- Use the default values: {event = 'BufWinLeave', text = nil}
          NvimTree = true,
          -- Or, specify the text used for the offset:
          undotree = {text = 'undotree'},
        },
        icons = {
          filetype = { enabled = true },
        }
      })

      vim.keymap.set('n', '<C-.>', '<Cmd>BufferNext<CR>')
      vim.keymap.set('n', '<C-,>', '<Cmd>BufferPrevious<CR>')
      vim.keymap.set('n', '<leader>,', '<Cmd>BufferPin<CR>')
      vim.keymap.set('n', '<leader>.', '<Cmd>BufferClose<CR>')
    end
  },

  -- !!! I'll use barbar for now, seems better
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = '*',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function()
  --     local bufferline = require('bufferline')
  --     bufferline.setup({
  --       options = {
  --         buffer_close_icon = '',
  --         modified_icon = '●',
  --         close_icon = '',
  --         left_trunc_marker = '',
  --         right_trunc_marker = '',
  --         separator_style = {'▎', '▎'},
  --         show_buffer_icons = false,
  --         offsets = {
  --           {
  --             filetype = "NvimTree",
  --             text = "",
  --             padding = 1,
  --           }
  --         },
  --         -- hover = {
  --         --   enabled = true,
  --         --   delay = 200,
  --         --   reveal = {'close'}
  --         -- }
  --       }
  --     })
  --   end
  -- }

  {
    'theprimeagen/harpoon',
    config = function()
      require('harpoon').setup({})
      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')

      vim.keymap.set('n', '<C-a>', mark.add_file)
      vim.keymap.set('n', '<C-h>', ui.toggle_quick_menu)

      vim.keymap.set('n', '<C-9>', function() ui.nav_file(1) end)
      vim.keymap.set('n', '<C-0>', function() ui.nav_file(2) end)
      vim.keymap.set('n', '<C-->', function() ui.nav_file(3) end)
      vim.keymap.set('n', '<C-=>', function() ui.nav_file(4) end)
    end
  }
}
