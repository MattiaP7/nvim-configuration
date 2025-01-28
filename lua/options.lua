local opt = vim.opt
local g   = vim.g

vim.cmd [[colorscheme sorbet]]

opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.softtabstop = 2
opt.mouse = "a"
opt.cursorline = true
opt.clipboard = "unnamedplus"
g.mapleader = " "
