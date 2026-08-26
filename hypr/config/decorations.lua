-- Look and feel configuration

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 8,
		border_size = 2,
		extend_border_grab_area = 10,
		resize_on_border = true,
		col = {
			active_border = {
				colors = { COLOR0, COLOR5 },
				angle = 45,
			},
			inactive_border = COLOR0,
		},
	},
	group = {
		col = {
			border_active = COLOR2,
			border_inactive = COLOR0,
			border_locked_active = COLOR6,
			border_locked_inactive = COLOR7,
		},
		groupbar = {
			col = {
				active = COLOR2,
				inactive = COLOR0,
				locked_active = COLOR6,
				locked_inactive = COLOR7,
			},
		},
	},
	decoration = {
		dim_special = 0.3,
		rounding = 30,
		rounding_power = 1,
		active_opacity = 1,
		inactive_opacity = 0.95,
		fullscreen_opacity = 1,
		blur = {
			size = 0,
			noise = 0,
			passes = 0,
			special = true,
		},
	},
})
