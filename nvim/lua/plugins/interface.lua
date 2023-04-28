return {
  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      top_down = false,
    },
  },

  -- dressing
  {
    "stevearc/dressing.nvim",
    lazy = true,
    opts = {
      enabled = true,
    },
  },

  -- noice
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
       diagnostics = "nvim_lsp",
       always_show_bufferline = true,
       offsets = {
         {
           filetype = "neo-tree",
           text = "Neo-tree",
           highlight = "Directory",
           text_align = "left",
          },
        },
      },
    },
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          "diagnostics",
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        },
        lualine_x = { "diff" },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
    }
  },

  -- indent
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },

  -- numb.nvim
  {
    "nacro90/numb.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('numb').setup{
        show_numbers = true,
        show_cursorline = true,
      }
    end,
  },

  -- file-line
  {
    "bogado/file-line",
  },

  -- which-key.nvim
  {
    "folke/which-key.nvim",
    config = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({

      })
      end,
  },
}
