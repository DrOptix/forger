-- File manager list files as a tree (netrw)
vim.cmd("let g:netrw_liststyle = 3")

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Tabs & Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Line wrapping
vim.opt.wrap = false

-- Search settings
--     Searching using first lowercase letter assumes case insensitive search
--     Searching using first uppercsae letter assumes case sensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Cursor line
--     Highlights the current line
vim.opt.cursorline = true

-- Line width limit
vim.opt.colorcolumn = "80"

-- Appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- Backspace
vim.opt.backspace = "indent,eol,start"

-- Clipboard
--     Instructs NeoVim to use the system clipboard
--     Usefull when we want to yank something and use it outside of NeoVim.
vim.opt.clipboard:append("unnamedplus")

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Add "-" to the chars that can be used to define a key word
--     Example: ____aaaa-bbbb___
--                           ^
--                           +-- Cursor position
--
--     With this active, in "Normal" mode, do "Ctrl+W" and it will delete "aaaa-bbbb"
--     instead of just "bbb"
vim.opt.iskeyword:append("-")
