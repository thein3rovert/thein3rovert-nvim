-- Load all language configurations from the languages directory
local language_dir = vim.fn.stdpath("config") .. "/lua/thein3rovert/plugins/lsp/languages"
local language_files = vim.fn.globpath(language_dir, "*.lua", false, true)

local ensure_installed_lsp = {}
local ensure_installed_tools = {}

-- Load each language file and collect LSP servers and tools
for _, file in ipairs(language_files) do
  local lang_name = vim.fn.fnamemodify(file, ":t:r")
  local ok, lang_config = pcall(require, "thein3rovert.plugins.lsp.languages." .. lang_name)

  if ok and lang_config then
    -- Add LSP servers
    if lang_config.lsp then
      for _, server in ipairs(lang_config.lsp) do
        table.insert(ensure_installed_lsp, server)
      end
    end

    -- Add formatters and linters
    if lang_config.formatters then
      for _, tool in ipairs(lang_config.formatters) do
        if not vim.tbl_contains(ensure_installed_tools, tool) then
          table.insert(ensure_installed_tools, tool)
        end
      end
    end

    if lang_config.linters then
      for _, tool in ipairs(lang_config.linters) do
        if not vim.tbl_contains(ensure_installed_tools, tool) then
          table.insert(ensure_installed_tools, tool)
        end
      end
    end
  end
end

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install (loaded from language files)
      ensure_installed = ensure_installed_lsp,
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = ensure_installed_tools,
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
