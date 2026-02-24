return {
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("onedark").load()
	end,
}

-- Tokyonight theme (commented out - can switch back later)
-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     local transparent = false -- set to true if you would like to enable transparency
--
--     local bg = "#011628"
--     local bg_dark = "#011423"
--     local bg_highlight = "#143652"
--     local bg_search = "#0A64AC"
--     local bg_visual = "#275378"
--     local fg = "#CBE0F0"
--     local fg_dark = "#B4D0E9"
--     local fg_gutter = "#627E97"
--     local border = "#547998"
--
--     require("tokyonight").setup({
--       style = "night",
--       transparent = transparent,
--       styles = {
--         sidebars = transparent and "transparent" or "dark",
--         floats = transparent and "transparent" or "dark",
--       },
--       on_colors = function(colors)
--         colors.bg = bg
--         colors.bg_dark = transparent and colors.none or bg_dark
--         colors.bg_float = transparent and colors.none or bg_dark
--         colors.bg_highlight = bg_highlight
--         colors.bg_popup = bg_dark
--         colors.bg_search = bg_search
--         colors.bg_sidebar = transparent and colors.none or bg_dark
--         colors.bg_statusline = transparent and colors.none or bg_dark
--         colors.bg_visual = bg_visual
--         colors.border = border
--         colors.fg = fg
--         colors.fg_dark = fg_dark
--         colors.fg_float = fg
--         colors.fg_gutter = fg_gutter
--         colors.fg_sidebar = fg_dark
--       end,
--       on_highlights = function(hl, c)
--         -- Git signs - bright and visible colors
--         hl.GitSignsAdd = { fg = "#73daca" }      -- green
--         hl.GitSignsChange = { fg = "#7aa2f7" }   -- blue
--         hl.GitSignsDelete = { fg = "#f7768e" }   -- red
--
--         -- NvimTree git colors
--         hl.NvimTreeGitDirty = { fg = "#e0af68" }    -- yellow/orange
--         hl.NvimTreeGitStaged = { fg = "#73daca" }   -- green
--         hl.NvimTreeGitNew = { fg = "#73daca" }      -- green
--         hl.NvimTreeGitDeleted = { fg = "#f7768e" }  -- red
--         hl.NvimTreeGitRenamed = { fg = "#7aa2f7" }  -- blue
--         hl.NvimTreeGitIgnored = { fg = "#565f89" }  -- gray
--       end,
--     })
--
--     vim.cmd("colorscheme tokyonight")
--   end,
-- }
