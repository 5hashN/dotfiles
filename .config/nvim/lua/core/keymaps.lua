local map = vim.keymap.set
local unmap = vim.keymap.del

-- move to beginning/end of line
map("n", "B", "^")
map("n", "E", "$")

-- $/^ doesn't do anything
map("n", "^", "<nop>")
map("n", "$", "<nop>")

-- unmap('n', '<C-y>', '<nop>')  -- +y
-- unmap('v', '<C-y>', '<nop>')  -- +y
-- unmap('n', '<C-p>', '<nop>')  -- +gP
-- unmap('v', '<C-p>', '<nop>')  -- +gP

-- Tabs
map("n", "<C-S-tab>", "<cmd>tabprevious<CR>")
map("n", "<C-tab>", "<cmd>tabnext<CR>")
map("n", "<C-t>", "<cmd>tabnew<CR>")

map("i", "<C-S-tab>", "<Esc><cmd>tabprevious<CR>i")
map("i", "<C-tab>", "<Esc><cmd>tabnext<CR>i")
map("i", "<C-t>", "<Esc><cmd>tabnew<CR>")

map("v", "<C-c>", '"+y', { noremap = true, silent = true })
map("v", "<C-v>", '"+p', { noremap = true, silent = true })
