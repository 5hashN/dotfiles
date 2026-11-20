local g = vim.g
local opt = vim.opt

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.backspace = "indent,eol,start"
opt.startofline = true
opt.autoindent = true
opt.smartindent = true
opt.modeline = false

opt.showmatch = true

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true

opt.hidden = true
opt.laststatus = 2

opt.number = true
-- opt.relativenumber = true
opt.wrap = true

opt.ruler = true

-- highlight searching
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.visualbell = true
opt.cursorline = true

opt.wildmenu = true

opt.inccommand = "nosplit"

opt.autoread = true
-- opt.mouse = a

opt.showmode = false

-- shell
opt.shell = "/bin/zsh"
g.python3_host_prog = vim.fn.expand("~/miniconda3/envs/wenv/bin/python3")

opt.background = "dark"

opt.termguicolors = true

opt.foldmethod = "indent"
opt.foldenable = true
opt.foldlevel = 99

opt.conceallevel = 2

opt.exrc = true
