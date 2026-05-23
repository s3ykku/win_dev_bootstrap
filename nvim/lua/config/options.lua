vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false

vim.opt.clipboard = "unnamedplus"

vim.g.clipboard = {
  name = "win32yank",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
  cache_enabled = 0,
}

vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.completeopt = { "menu", "menuone", "noinsert" }

vim.opt.list = true
vim.opt.listchars = {
  tab = "> ",
  trail = ".",
  nbsp = "+",
}

vim.o.exrc = true
