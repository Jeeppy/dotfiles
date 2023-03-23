return {

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },

  -- lspkind.nvim
  {
    "onsails/lspkind.nvim",
  },

  -- auto-completion
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "ray-x/cmp-treesitter",
      "lukas-reineke/cmp-rg",
      "quangnguyen30192/cmp-nvim-tags",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      local lspkind = require'lspkind'

      local function border(hl_name)
        return {
          { "┌", hl_name },
          { "─", hl_name },
          { "┐", hl_name },
          { "│", hl_name },
          { "┘", hl_name },
          { "─", hl_name },
          { "└", hl_name },
          { "│", hl_name },
        }
      end

      return {
        window = {
          completion = {
            border = border "CmpBorder",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
          },
          documentation = {
            border = border "CmpDocBorder"
          },
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        -- snippet = {
        --   expand = function(args)
        --     vim.fn["vsnip#anonymous"](args.body)
        --   end,
        -- },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,

            before = function (entry, vim_item)
              return vim_item
            end
          })
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = "vsnip" },
          { name = "path" },
          { name = "calc" },
          { name = "treesitter" },
          { name = "tags" },
          { name = "rg" },
        }, {
          { name = "buffer" },
        }),
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
    init = function ()
      local cmp = require'cmp'

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          })
      })
    end
  },

  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    init = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  -- whitespaces
  {
    "johnfrankmorgan/whitespace.nvim",
    init = function()
      require('whitespace-nvim').setup({
        highlight = 'DiffDelete',
        ignored_filetypes = {
          'TelescopePrompt',
          'Trouble',
          'help',
          'neotree',
          "lazy",
          "toggleterm"
        }
      })
    end
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    init = function()
      require('Comment').setup()
    end,
  },

  -- Todo Comments
  {
    "folke/todo-comments.nvim",
    init = function ()
      require('todo-comments').setup({
      })
    end
  },

  -- Color
  {
    'NvChad/nvim-colorizer.lua',
    init = function ()
      require('colorizer').setup({})
    end
  },

  -- illuminate
  {
    "RRethy/vim-illuminate",
  },

  -- renamer.nvim
  {
    "filipdutescu/renamer.nvim",
  },
}
