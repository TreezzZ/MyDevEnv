-- UTF-8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- Retain 8 lines during moving cursor
vim.o.scrolloff = 8
vim.o.sidescrossoff = 8

-- Enable line no. and relative line no.
vim.wo.number = true
vim.wo.relativenumber = true

-- Highlight current line
vim.wo.cursorline = true

-- Show left icons indicator
vim.wo.signcolumn = "yes"

-- Show right column indicator (Indicate codes are too long, need a new line)
vim.wo.colorcolumn = "80"

-- Indent, tab and space
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4

-- The length of >> and <<
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- Replace tab from space
vim.o.expandtab = true
vim.bo.expandtab = true

-- Align new line with previous line
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- Ingore case during searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disable highlight search
vim.o.hlsearch = false

-- Enable incremental search
vim.o.incsearch = true

-- Set cmd line height to 2
vim.o.cmdheight = 2

-- Auto reload when file is modiried by others programs
vim.o.autoread = true
vim.bo.autoread = true

-- Disable wrap
vim.wo.wrap = false

-- When cursor locates in the begin and ending of a line, type left and right arrow can move to next line
vim.o.whichwrap = "<,>,[,]"

-- Enable hide buffer
vim.o.hidden = true

-- Enable mouse support
vim.o.mouse = "a"

-- Disable backup files creation
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Smaller update time
vim.o.updatetime = 300

-- Shortcut combo time
vim.o.timeoutlen = 500

-- Split window from bottom and right
vim.o.splitbelow = true
vim.o.splitright = true

-- Auto completion but not auto select the choice
vim.g.completeopt = "menu, menuone, noselect, noinsert"

-- GUI styles
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- Show invisible characters (Like vscode)
-- vim.o.list = true
-- vim.o.listchars = "space:·"

-- Enhance completion
vim.o.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Show at most 10 lines when completion
vim.o.pumheight = 10

-- Always show tabline
vim.o.showtabline = 2

-- When using status line enhancement plugin, we do not need mode prompting
vim.o.showmode = false
