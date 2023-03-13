-- [[ Basic Keymaps ]]

-- ┌───────────────────┐
-- │ <leader> Mappings │
-- └───────────────────┘
-- <Leader>, <LocalLeader> is set in init.lua, because lazy.nvim wiches so

-- Dieses Kopieren und Einfügen ohne dass das Markierte gespeichert wird und den alten Text überschreibt. Klappt irgendwie mit <leader> nicht.
-- Im Visual-Mode markiertes wird durch vorher Geyanktes ersetzt ohne dass markierter Teil "das neue zu ersetzende" ist
vim.api.nvim_set_keymap("x", "<leader>p", [["_dP]], { noremap = true, desc = "delete into \"_ and paste" })
--xnoremap ,p "_dP

-- Beim Betätigen von <<leader>s> wird automatisch ein Ersetzungsbefehl generiert, um das aktuelle Wort zu ersetzen. So muss man es nicht extr eintippen."
vim.api.nvim_set_keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true })

-- Terminal in neuem vertikalem Fenster starten
--vim.api.nvim_set_keymap("n", "<leader>t", ":vertical split | terminal <CR>", {})

-- In die System-Zwischenablage kopieren
vim.api.nvim_set_keymap("v", "<leader>y", [["+y]], { noremap = true, desc = "Copy into system clipboard" })
vim.api.nvim_set_keymap("n", "<leader>y", [["+y]], { noremap = true, desc = "Copy line into system clipboard" })
vim.api.nvim_set_keymap("n", "<leader>Y", [["+Y]], { noremap = true, desc = "Copy rest of line into system clipboard" })

-- Macht Skripte automatisch ausführbar
vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { noremap = true, desc = "Make script executable" })

-- save and source current file (following <localleader>ll for compiling LaTeX via vimtex)
vim.keymap.set("n", "<localleader>xx", ":w | source %<CR>", { noremap = true, desc = "Save and source current file" })


-- ┌────────────────┐
-- │ <C-?> Mappings │
-- └────────────────┘
-- Ab hier finden sich alle Mappings, die die STRG-Taste (<C-?>) bedienen

-- <C-d> = STRG + d bewegt halbe Seite NACH UNTEN und wird auf <C-d>zz
-- abgebildet
-- zz zentriert Cursor in der Mitte
--  ==> So muss man beim navigieren immer nur auf eine Stelle schauen und nicht
--  den Cursor suchen
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
-- wie oben nur halbe Seite NACH OBEN
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Adjust split size via <ALT-[hjkl]>
vim.api.nvim_set_keymap("n", "<A-h>", ":vertical resize -5<CR>", { noremap = true, desc = "Shrink vertical split" })
vim.api.nvim_set_keymap("n", "<A-l>", ":vertical resize +5<CR>", { noremap = true, desc = "Enlarge vertical split" })
vim.api.nvim_set_keymap("n", "<A-j>", ":resize -5<CR>", { noremap = true, desc = "Shrink horizontal split" })
vim.api.nvim_set_keymap("n", "<A-k>", ":resize +5<CR>", { noremap = true, desc = "Enlarge horizontal split" })


-- ┌───────────────────┐
-- │ "Letter" Mappings │
-- └───────────────────┘
-- Alle hier gelisteten Tastenkombinationen benutzen lediglich Buchstaben

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- In den Normalmodus gehen, wenn man im <insert mode> oder <visual mode> ist
-- Quelle: https://dev.to/benborla/vim-getting-rid-of-esc-key-to-switch-to-normal-mode-f3e
-- Press ij to return to normal mode when in insert mode
-- inoremap <ESC> <NOP> " Deaktiviert ESC-Taste
vim.api.nvim_set_keymap("i", "ij", "<ESC>", { noremap = true })
-- Press ij to return to normal mode when in visual mode
-- vnoremap <ESC> <NOP> " Deaktiviert ESC-Taste
vim.api.nvim_set_keymap("v", "ij", "<ESC>", { noremap = true })

-- move wrapped lines as they were normal
--  deactivated because key strokes like 15j, 6k dont longer work as expected.
--vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true})
--vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true})

-- Mit <J> kann man im Normal-Mode die untere Zeile an die aktuelle hängen,
-- allerdings wird dabei der Cursor an die Schnittstelle gesetzt. Das folgende
-- Mapping sorgt dafür, dass der Cursor an aktueller Stelle verbleibt
-- Quelle: https://www.youtube.com/watch?v=w7i4amO_zaE&t=1464s
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true })

-- Beim suchen kann man mit n (vorwärts) und N (rückwärts) zu den nächsten
-- Treffern navigieren und wird auf nzz abgebildet
-- zz zentriert Cursor/Treffer in der Mitte, man muss beim Navigieren nicht
-- suchen und kann immer auf eine Stelle schauen
-- zv klappt zusammengeklappte Blöcke aus (verwende ich noch nicht, 9.1.23, { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })

-- Im Visual-Mode markierte Zeilen können per <J> und <K> verschoben werden
-- Quelle: https://www.youtube.com/watch?v=w7i4amO_zaE&t=1464s
vim.api.nvim_set_keymap("v", "J", ":m'>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m'<-2<CR>gv=gv", { noremap = true })


-- "" completion
vim.api.nvim_set_keymap("i", "\"", "\"\"<left>", {noremap=true})

-- Überschreibt schließende Klammer/Anführungszeichen
-- Praktisch, va. wenn man in Python Funktionen definiert, da man sonst
-- umständlich per ESC A hinter die Klammer wechseln müsste, so tippt man sie
-- einfach schnell.
-- vim.api.nvim_set_keymap("i", "<expr> )", [[strpart(getline('.'), col('.')-1, 1) == ) ? <Right> : )]], { noremap = true })
-- vim.api.nvim_set_keymap("i", "<expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" :", ""}"", { noremap = true })
-- vim.api.nvim_set_keymap("i", "<expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" :", ""]"", { noremap = true })
--vim.api.nvim_set_keymap("i", "<expr> '", strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" :", ""''<left>"", { noremap = true })
vim.cmd([[ inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"<left>" ]])
