local opt = vim.opt
local g = vim.g
local apk = vim.api.nvim_set_keymap

opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.softtabstop = 2
opt.mouse = "a"
opt.cursorline = true

g.mapleader = " "

-- This is not the best place for this keymaps. in future there will be a special `mappings.lua`
apk("n", "<C-a>", "ggVG", { noremap = true, silent = true })
apk("v", "<C-c>", '"+y', { noremap = true, silent = true })
apk("v", "<C-v>", '"+p', { noremap = true, silent = true })
