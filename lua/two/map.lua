vim.keymap.set("", " ", "<nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>")

vim.keymap.set("t", "<esc>", "<c-|><c-n>")
