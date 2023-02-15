-- ┌───────────────┐
-- │ KEY MAPPINGS  │
-- └───────────────┘
-- Die Tastenkombinationen sind nach innerhalb der Gruppen nach alphabetisch nach Modus sortiert.

-- Weitere Plugin-spezifische Tastenkombinationen
--  after/plugin/coc.lua
--  after/plugin/coc-snippets.lua

-- ┌───────────────────┐
-- │ <leader> Mappings │
-- └───────────────────┘
vim.g.mapleader = " "
-- Dieses Kopieren und Einfügen ohne dass das Markierte gespeichert wird und den alten Text überschreibt. Klappt irgendwie mit <leader> nicht.
-- Im Visual-Mode markiertes wird durch vorher Geyanktes ersetzt ohne dass markierter Teil "das neue zu ersetzende" ist
vim.api.nvim_set_keymap("x", "<leader>p", [["_dP]], { noremap = true })
--xnoremap ,p "_dP

-- Beim Betätigen von <<leader>s> wird automatisch ein Ersetzungsbefehl generiert, um das aktuelle Wort zu ersetzen. So muss man es nicht extr eintippen."
vim.api.nvim_set_keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true })

-- Terminal in neuem vertikalem Fenster starten
--vim.api.nvim_set_keymap("n", "<leader>t", ":vertical split | terminal <CR>", {})

-- In die System-Zwischenablage kopieren
vim.api.nvim_set_keymap("v", "<leader>y", [["+y]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>y", [["+y]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>Y", [["+Y]], { noremap = true })

-- Macht Skripte automatisch ausführbar
vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { noremap = true })


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

-- Tastenkürzel, um in der geteilten Ansicht leichter navigieren zu können, da <C-w>[hjkl] umständlich zu tippen ist
--vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
--vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
--vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
--vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })


-- ┌───────────────────┐
-- │ "Letter" Mappings │
-- └───────────────────┘
-- Alle hier gelisteten Tastenkombinationen benutzen lediglich Buchstaben

-- In den Normalmodus gehen, wenn man im <insert mode> oder <visual mode> ist
-- Quelle: https://dev.to/benborla/vim-getting-rid-of-esc-key-to-switch-to-normal-mode-f3e
-- Press ii to return to normal mode when in insert mode
-- inoremap <ESC> <NOP> " Deaktiviert ESC-Taste
vim.api.nvim_set_keymap("i", "ii", "<ESC>", { noremap = true })
-- Press ii to return to normal mode when in visual mode
-- vnoremap <ESC> <NOP> " Deaktiviert ESC-Taste
vim.api.nvim_set_keymap("v", "ii", "<ESC>", { noremap = true })

-- Beim suchen kann man mit n (vorwärts) und N (rückwärts) zu den nächsten
-- Treffern navigieren und wird auf nzz abgebildet
-- zz zentriert Cursor/Treffer in der Mitte, man muss beim Navigieren nicht
-- suchen und kann immer auf eine Stelle schauen
-- zv klappt zusammengeklappte Blöcke aus (verwende ich noch nicht, 9.1.23, { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })

-- Mit <J> kann man im Normal-Mode die untere Zeile an die aktuelle hängen,
-- allerdings wird dabei der Cursor an die Schnittstelle gesetzt. Das folgende
-- Mapping sorgt dafür, dass der Cursor an aktueller Stelle verbleibt
-- Quelle: https://www.youtube.com/watch?v=w7i4amO_zaE&t=1464s
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true })

-- Im Visual-Mode markierte Zeilen können per <J> und <K> verschoben werden
-- Quelle: https://www.youtube.com/watch?v=w7i4amO_zaE&t=1464s
vim.api.nvim_set_keymap("v", "J", ":m'>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m'<-2<CR>gv=gv", { noremap = true })


-- ┌──────────────────────────┐
-- │ (, [, {, ", ' completion │
-- └──────────────────────────┘
-- Klammern und Anführungszeichen automatisch schließen
-- <left> bedeutet, dass der Cursor um 1 nach links bewegt wird
--vim.api.nvim_set_keymap("i", [["]], [[""<left>]], { noremap = true })
--vim.api.nvim_set_keymap("i", "'", "''<left>", { noremap = true })
--vim.api.nvim_set_keymap("i", "(", "()<left>", { noremap = true })
--vim.api.nvim_set_keymap("i", "[", "[]<left>", { noremap = true })
--vim.api.nvim_set_keymap("i", "{", "{ noremap = true }<left>", {})
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

