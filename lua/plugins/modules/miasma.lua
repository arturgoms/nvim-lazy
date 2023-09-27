return {
	"xero/miasma.nvim",
	-- dev = true,
	-- branch = "dev",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.background = "dark" -- set this to dark or light
		vim.cmd("colorscheme oxocarbon")
	end,
}
