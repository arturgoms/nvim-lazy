return {
	"terrortylor/nvim-comment",
	config = function()
		require('nvim_comment').setup()
		require("which-key").register({
			g = {
				name = "go",
				c = {
					name = "comment",
					c = "line",
				}
			}
		})
		local r = require("utils.remaps")
		r.noremap("n", "<leader>/", ":CommentToggle<cr>", "Comment Line")
	end,
}
