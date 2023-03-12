-- Speichern und Lade von Code-Faltungen
--  *.* beschreibt Dateimuster: "jeder Name, jede Endung"
vim.api.nvim_create_autocmd('BufWinLeave', {
    pattern = '*.*',
    command = 'mkview',
    desc = 'Save folds.'
})

-- In Vimscript-Notation wesentlich kürzer
--vim.cmd([[au BufWinEnter *.* silent! loadview]])
vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    command = 'silent! loadview',
    desc = "Load saved folds."
})

-- Deaktiviere Codeium beim Start
--vim.api.nvim_create_autocmd('VimEnter', {
--    command = 'Codeium Disable',
--    desc = 'Disable Codeium on startup.'
--})
