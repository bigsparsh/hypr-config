-- local colors = {
-- 	blue = "#80a0ff",
-- 	cyan = "#79dac8",
-- 	black = "#080808",
-- 	white = "#c6c6c6",
-- 	red = "#ff5189",
-- 	violet = "#d183e8",
-- 	grey = "#303030",
-- }
return {
	{
		"xiyaowong/transparent.nvim",
		opts = {
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"BufferLine",
				"Bufferline",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			extra_groups = {},
			exclude_groups = {},
			on_clear = function() end,
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "pywal",
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { "filename", "branch" },
				lualine_c = {
					"%=", --[[ add your center components here in place of this comment ]]
				},
				lualine_x = {},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			-- extensions = { "noice" },
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		lazy = false,
		---@module "neo-tree"
		---@type neotree.Config?
		opts = {
			view = {
				width = 30,
				preserve_window_proportions = true,
			},
			window = {
				position = "right",
				width = 30, -- or whatever width you prefer
				preserve_window_proportions = true,
				mappings = {
					["<space>"] = "none", -- prevent space from toggling
				},
			},
			buffers = {
				follow_current_file = true,
			},
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			transparent_mode = true,
		},
	},
	{
		"sainnhe/everforest",
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		opts = {
			transparent = true,
		},
	},
	-- { "nvim-mini/mini.tabline", version = "*", opts = {} },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
	},
}
