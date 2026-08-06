return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    },
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load()
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")
      
      -- configure autopairs (from main branch)
      autopairs.setup({
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { "string" }, -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" },
          java = false,
        },
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
      })

      -- Markdown checkbox spacing: [ -> [ ] (commented out - user doesn't like it)
      -- local Rule = require("nvim-autopairs.rule")
      -- autopairs.add_rules({
      --   Rule("[", " ]", "markdown")
      --     :with_pair(function(opts)
      --       -- Only in markdown files at start of line or after whitespace
      --       local line = opts.line
      --       local col = opts.col
      --       if col == 1 then return true end
      --       local char_before = line:sub(col - 1, col - 1)
      --       return char_before:match("%s")
      --     end),
      -- })
    end,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "CmdLineEnter", "InsertEnter" },

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    opts = function()
      -- NvChad blink config (commented out)
      -- local nv_blink = require("nvchad.blink.config")
      -- return vim.tbl_deep_extend("force", nv_blink, {

      return {
        completion = {
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
            window = {
              border = "single",
              max_height = 15,
              max_width = 70,
            },
          },

          ghost_text = { enabled = false },

          list = {
            selection = {
              auto_insert = false,
              preselect = true,
            },
          },

          menu = {
            draw = {
              components = {
                label = {
                  width = { max = 30 },
                },
              },
            },
            max_height = 15,
            scrollbar = false,
          },
        },

        enabled = function()
          local ft = vim.bo.filetype
          local bt = vim.bo.buftype

          if bt == "prompt" then
            return false
          end

          local disabled = {
            ["copilot-chat"] = true,
            markdown = true,
            snacks_picker_input = true,
            TelescopePrompt = true,
          }

          return not disabled[ft]
        end,

        fuzzy = {
          implementation = "prefer_rust",
          sorts = { "exact", "score", "sort_text", "kind" },
        },

        keymap = {
          preset = "none",
          ["<Up>"] = { "select_prev", "fallback" },
          ["<Down>"] = { "select_next", "fallback" },
          ["<C-Up>"] = { "select_prev", "fallback" },
          ["<C-Down>"] = { "select_next", "fallback" },

          ["<S-Tab>"] = { "insert_prev", "snippet_forward", "fallback" },
          ["<Tab>"] = {
            function(cmp)
              if cmp.is_visible() then
                return cmp.insert_next()
              end
            end,
            "fallback",
          },

          ["<S-Down>"] = { "scroll_documentation_down", "fallback" },
          ["<S-Up>"] = { "scroll_documentation_up", "fallback" },

          ["<C-S-Down>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
          ["<C-Space>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
          ["<C-c>"] = { "hide", "fallback" },

          ["<CR>"] = { "accept", "fallback" },
        },

        signature = {
          enabled = false,
          window = {
            border = "single",
            max_height = 8,
            max_width = 80,
          },
        },

        sources = {
          default = { "lsp", "snippets", "buffer", "path" },
          providers = {
            lsp = { score_offset = 3 },
            snippets = { score_offset = 0 },
            buffer = { score_offset = -1, max_items = 20, min_keyword_length = 2 },
            path = { score_offset = -2, min_keyword_length = 2 },
          },
        },
        
        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = 'mono'
        },
      }
      -- }) -- End of NvChad config
    end,
  },
}
