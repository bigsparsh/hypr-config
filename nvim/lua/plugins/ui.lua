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
				component_separators = "",
				section_separators = "",
			},
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
}
