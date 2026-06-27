local servers = require("configs.servers.servers")

return {
  {
    "neovim/nvim-lspconfig",
    event = "FileType",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = function()
          return {
            PATH = "skip",
            ui = {
              border = "single",
              icons = {
                package_pending = " ",
                package_installed = " ",
                package_uninstalled = " ",
              },
            },
            max_concurrent_installers = 10,
          }
        end,
      },
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = servers.lsp_list,
          automatic_enable = false,
        },
      },
    },

    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem = {
        documentationFormat = {
          "markdown",
          "plaintext",
        },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
      }

      -- Set the default initial state
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 2,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
      })

      -- Use colorify intsread
      vim.lsp.document_color.enable(false, nil, { style = "virtual" })

      -- Default configurations for all servers
      vim.lsp.config("*", {
        capabilities = capabilities,
        root_markers = { ".git" },
      })

      -- Server-specific configurations
      servers.setup(capabilities)

      -- Enable all listed servers
      for _, s in ipairs(servers.lsp_list) do
        vim.lsp.enable(s)
      end

      for _, s in ipairs(servers.non_mason_lsp_list or {}) do
        vim.lsp.enable(s)
      end
    end,
  },

  {
    "folke/trouble.nvim",
    event = "LspAttach",
    opts = {
      auto_close = true,
      focus = true,
      warn_no_results = false,
      restore = false,  -- Don't restore cursor position (prevents out of range errors)
      auto_jump = false, -- Don't auto jump to items
    },
  },

  -- Development
  {
    "r4ppz/lspeek.nvim",
    event = "LspAttach",
    -- dev = true,
    opts = {
      window = {
        width = 70,
        height = 15,
        border = "single",
      },

      stack_limit = 10,
      select_first = false,

      keymaps = {
        close = "q",
        split = "s",
        vsplit = "v",
        enter = "<CR>",
      },
    },
  },
}
