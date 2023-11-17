local opts = { noremap = true, silent = true }

local map = vim.keymap.set

local keymap = vim.api.nvim_set_keymap
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)

-- map("n", "<C-Space>", ":WhichKey \\<space><cr>", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
-- map("n", "<leader><leader>", ":Telescope buffers<CR>", opts)

-- Fast saving
map("n", "<Leader>w", ":write!<CR>", opts)
map("n", "<Leader>q", ":q!<CR>", opts)

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- paste over currently selected text without yanking it
map("v", "P", '"_dp')
map("v", "p", '"_dP')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
map("n", "YY", "va{Vy", opts)

-- Exit on jj and jk
-- map("n", "j", "gj", opts)
-- map("n", "k", "gk", opts)

-- Exit on jj and jk
map("i", "jj", "<ESC>", opts)
map("i", "jk", "<ESC>", opts)

-- Fast saving
map("n", "<Leader>w", ":write!<CR>", opts)
map("n", "<Leader>q", ":q!<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Map enter to ciw in normal mode
map("n", "<CR>", "ciw", opts)

-- map ; to resume last search
map("n", ";", "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_dropdown({}))<cr>", opts)

-- Harpoon
keymap("n", ".", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap("n", ",", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)

map("n", "<S-m>1", "<cmd>require('harpoon.ui').nav_file(1)<CR>", opts)
map("n", "<S-m>2", "<cmd>require('harpoon.ui').nav_file(2)<CR>", opts)
map("n", "<S-m>3", "<cmd>require('harpoon.ui').nav_file(3)<CR>", opts)
map("n", "<S-m>4", "<cmd>require('harpoon.ui').nav_file(4)<CR>", opts)
map("n", "<S-m>5", "<cmd>require('harpoon.ui').nav_file(5)<CR>", opts)
map("n", "<S-m>6", "<cmd>require('harpoon.ui').nav_file(6)<CR>", opts)
map("n", "<S-m>7", "<cmd>require('harpoon.ui').nav_file(7)<CR>", opts)
map("n", "<S-m>8", "<cmd>require('harpoon.ui').nav_file(8)<CR>", opts)
map("n", "<S-m>9", "<cmd>require('harpoon.ui').nav_file(9)<CR>", opts)
map("n", "<S-m>0", "<cmd>require('harpoon.ui').nav_file(0)<CR>", opts)
