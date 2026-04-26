vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<S-l>", "<cmd>bnext<cr>")
map("n", "<S-h>", "<cmd>bprevious<cr>")
map("n", "<leader>x", "<cmd>bdelete<cr>")
map("n", "<Esc>", "<cmd>nohlsearch<cr>")
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
map("n", "<leader>gg", "<cmd>LazyGit<cr>")
