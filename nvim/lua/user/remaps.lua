local builtin = require('telescope.builtin')

-- Telescope baby
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})

-- Move things around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Make managing windows easier 
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>h", "<C-w>s")
vim.keymap.set("n", "<leader>v", "<C-w>v")

-- Do Tmux things!
vim.keymap.set("n", "<leader>hh", "<cmd>silent !tmux splitw<CR>")
vim.keymap.set("n", "<leader>vv", "<cmd>silent !tmux splitw -h<CR>")

-- Some nvim-tree goodness
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>f.", "<cmd>NvimTreeFindFile<CR>")

-- Until you find a solution to automatically set up ripgrep :(
-- vim.keymap.set("n", "<leader>ps", function()
--   builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
