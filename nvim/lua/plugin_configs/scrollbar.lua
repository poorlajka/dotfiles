
local mocha = require('catppuccin.palettes').get_palette("mocha")
local frappe = require('catppuccin.palettes').get_palette("frappe")
require("scrollbar").setup({
    show_in_active_only = true,
	handle = {
		color = frappe.text,
		text = " ",
		blend = 60,
	},
	marks = {
		Search = { color = mocha.orange },
		Error = { color = mocha.error },
		Warn = { color = mocha.warning },
		Info = { color = mocha.info },
		Hint = { color = mocha.hint },
		Misc = { color = mocha.purple },
	},
	
	handlers = {
		cursor = false,
		diagnostic = true,
		gitsigns = false, -- Requires gitsigns
		handle = true,
		search = false, -- Requires hlslens
		ale = false, -- Requires ALE
	},
})
