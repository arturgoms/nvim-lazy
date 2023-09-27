return {
	{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		version = false,
		lazy = true,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'jvgrootveld/telescope-zoxide',
			"debugloop/telescope-undo.nvim",
			'nvim-tree/nvim-web-devicons',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			'nvim-telescope/telescope-ui-select.nvim',
			-- 'telescope-dap.nvim',
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			local telescope = require('telescope')
			local undo_actions = require("telescope-undo.actions")
			local lga_shortcuts = require("telescope-live-grep-args.shortcuts")
			local r = require("utils.remaps")
			telescope.setup {
				defaults = {
					previewer = false,
					-- hidden = true,
					prompt_prefix = "  ",
					file_ignore_patterns = { "node_modules", "package-lock.json" },
					initial_mode = "insert",
					select_strategy = "reset",
					sorting_strategy = "ascending",
					-- layout_strategy = "horizontal",
					-- layout_config = {
					--   width = 0.5,
					--   height = 0.4,
					--   prompt_position = "top",
					--   preview_cutoff = 120,
					-- },
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = false,
						layout_config = {
							--   width = 0.5,
							--   height = 0.4,
							prompt_position = "top",
							--   preview_cutoff = 120,
						},
					},
					git_files = {
						previewer = false,
						theme = "dropdown",
						layout_config = {
							--   width = 0.5,
							--   height = 0.4,
							prompt_position = "top",
							--   preview_cutoff = 120,
						},
					},
					buffers = {
						previewer = false,
						theme = "dropdown",
						layout_config = {
							width = 0.5,
							height = 0.4,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					live_grep = {
						only_sort_text = true,
						previewer = true,
						layout_config = {
							horizontal = {
								width = 0.9,
								height = 0.75,
								preview_width = 0.6,
							},
						},
					},
					grep_string = {
						only_sort_text = true,
						previewer = true,
						layout_config = {
							horizontal = {
								width = 0.9,
								height = 0.75,
								preview_width = 0.6,
							},
						},
					},
					lsp_references = {
						show_line = false,
						previewer = true,
						layout_config = {
							horizontal = {
								width = 0.9,
								height = 0.75,
								preview_width = 0.6,
							},
						},
					},
					treesitter = {
						show_line = false,
						previewer = true,
						layout_config = {
							horizontal = {
								width = 0.9,
								height = 0.75,
								preview_width = 0.6,
							},
						},
					},
				},
				extensions = {
					undo = {
						use_delta = true,
						side_by_side = true,
						entry_format = "󰣜 #$ID, $STAT, $TIME",
						layout_strategy = "flex",
						mappings = {
							i = {
								["<cr>"] = undo_actions.yank_additions,
								["<S-cr>"] = undo_actions.yank_deletions,
								["<C-\\>"] = undo_actions.restore,
							},
						},
					},
					fzf = {
						fuzzy = true,             -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							previewer        = false,
							initial_mode     = "normal",
							sorting_strategy = 'ascending',
							layout_strategy  = 'horizontal',
							layout_config    = {
								horizontal = {
									width = 0.5,
									height = 0.4,
									preview_width = 0.6,
								},
							},
						})
					},
				}
			}
			telescope.load_extension("undo")
			telescope.load_extension('fzf')
			telescope.load_extension('ui-select')
			telescope.load_extension('refactoring')
			-- telescope.load_extension('dap')
			telescope.load_extension("zoxide")
			r.noremap("n", "<leader>u", ":Telescope undo<cr>", "undo tree")
			r.noremap("n", "\\", function()
				telescope.extensions.live_grep_args.live_grep_args({
					prompt_title = 'grep',
					additional_args = '-i',
				})
			end, "live grep")
			r.noremap("n", "<leader>o", ":Telescope oldfiles<cr>", "old files")
			r.noremap("n", "<leader>gc", function()
				lga_shortcuts.grep_word_under_cursor()
			end, "grep under cursor")
		end
	},
}
