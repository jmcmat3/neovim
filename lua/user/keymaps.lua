local opts = { noremap = true, silent = true }

local term_opts = { silent = true } 

-- Shorten function name 
local keymap = vim.api.nvim_set_keymap

--Remap sapce as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer = flase }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)


