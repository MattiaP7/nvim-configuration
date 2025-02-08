--[[ LEGGENDA
	"n" => "normal" mode
	"v" => "visual" mode
	"C-lettera" => "ctrl+lettera"
	"A-lettera" => "alt+lettera"
]]
local apk = vim.api.nvim_set_keymap
local map = vim.keymap.set

apk("n", "<C-a>", "ggVG", { noremap = true, silent = true })
apk("v", "<C-c>", '"+y', { noremap = true, silent = true })
apk("v", "<C-v>", '"+p', { noremap = true, silent = true })

-- Spostare la riga in su con Alt+Freccia su
apk("n", "<A-Up>", ":m-2<CR>==", { noremap = true, silent = true })
apk("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Spostare la riga in giù con Alt+Freccia giù
apk("n", "<A-Down>", ":m+1<CR>==", { noremap = true, silent = true })
apk("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

map("n", "<C-z>", "u", { noremap = true })
map("i", "<C-z>", "<Esc>u", { noremap = true })

--Keymap plugin

--Neotree
map("n", "<C-n>", ":Neotree filesystem show<CR>", {})
map("n", "<A-n>", ":Neotree filesystem close<CR>", {})

-- Toggleterm
map("n", "<C-t>", ":NeatermToggle <CR>", {})

-- Document generator
map("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })
