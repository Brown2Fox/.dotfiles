local k = vim.keycode

vim.g.mapleader = k("<F15>")
vim.g.maplocalleader = k("<F15>")

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.o.guifont = "Lilex Nerd Font:h14"

vim.o.clipboard = "unnamed,unnamedplus"

if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.g.neovide_opacity = 0.9
	vim.g.neovide_normal_opacity = 0.8
end
-- 	name = "Clipboard",
-- 	copy = {
-- 		["+"] = "clip.exe",
-- 		["*"] = "clip.exe",
-- 	},
-- 	paste = {
-- 		["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
-- 		["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
-- 	},
-- 	cache_enabled = 0,
-- }
-- end
-- [[ Setting options ]]
-- require 'options'

-- [[ Basic Keymaps ]]
-- require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
-- require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
-- require 'lazy-plugins'

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
