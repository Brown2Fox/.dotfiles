
vim.g.have_nerd_font = true
vim.o.guifont = "Lilex Nerd Font Mono Medium:h12" -- for neovide


if vim.g.neovide then
	vim.g.neovide_opacity = 0.90
	vim.g.neovide_normal_opacity = 0.90
end

vim.o.clipboard = "unnamed,unnamedplus"
--vim.keymap.set({ "n", "x" }, "y", '"+y')
--vim.keymap.set("n", "p", '""p')
vim.keymap.set({'n', 'v'}, 'd', '"_d')

require("config.lazy")

