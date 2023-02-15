-- Die Conceal-Mechanik vom vimtex funktioniert nicht mit treesitter. Des Weiteren benötige ich vimtex nur in ausgewählten Situationen.
-- Die treesitter-Syntax-Hervorhebung funktioniert dann natürlich auch nicht
--      Man kann treesitter auch behalten, möchte man aber das Concealing, so muss treesitter so konfiguriert werden, dass es tex-Dateien ignoriert, s. <:help vimtex-faq-treesitter>.


-- This file contains "general init.lua" settings, common for all "init*.lua" files
require("general-init-stump")

require("keymappings")
require("set-options")
require("autocommands")


-- Set general conceallevel to 2
-- necessary for vimtex concealment
vim.o.conceallevel = 2
--vim.cmd("let g:vimtex_syntax_conceal['sections'] = 0")
--vim.g.vimtex_syntax_conceal['sections'] = 0

-- Some plugin manager offer a lazy loading mechanic, ie. plugins are loaded when first used. This is not necessary for vimtex as it works so by default and when not turned off, the Inverse Search feature does not work.
vim.cmd("let g:packer_no_lazy = ['vimtex']")
--vim.g.packer_no_lazy = [ 'vimtex' ] -- this doesn't work. Since I am not familiar with Lua, I have no idea why.

-- Activate spellchecking
-- Correct misspelled words with the first proposed word.
--   There is a key binding on <C-l> for a fast correction.
vim.opt.spelllang = {"en_us", "de"}
-- Funktioniert irgendwie nur, wenn ich unter ~/.config/nvim arbeite. Als
-- ich den Vortrag für das Vorstellungsgespräch erarbeitete, ließ sich kein
-- Wort einer Datei hinzufügen. Es kam stets die Fehlermeldung „E484: Datei
-- konnte nicht gefunden werden“, sowohl mit relativen als auch absoluten
-- Pfaden.
vim.opt.spellfile = {"spell/en.utf-8.add", "spell/de.utf-8.add"}
vim.opt.spell = true
-- Correct misspelled words with the first proposed word.
vim.api.nvim_set_keymap("i", "<C-l>", "<C-g>u<ESC>[s1z=`]a<C-g>u", { noremap = true })
