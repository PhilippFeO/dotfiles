vim.g.wiki_root = '~/wiki.vim'
vim.g.wiki_filetypes = { 'md' }
vim.g.wiki_link_extension = '.md'

vim.g.wiki_link_target_type = 'md'

-- only <g.wiki_root> as wiki file
vim.g.wiki_global_load = 0

-- help-Einträge für Links:
--  - g:wiki_link_toggles

--vim.g.wiki_link_toggle_on_follow = 1
--vim.g.wiki_map_text_to_link = function(name)
    --return { "LINK-" .. name, name}
--end

-- Tastenkombinationen aus der Hilfe:
--  <Leader>ff  Seiten/Wiki durchsuchen (iwie mit Telescope verbinden)
--  <Leader>ow  Suche für nur für Wikiseiten

-- TODO: Gibt es auch mit „split“ & „tab“ <10-03-2023> --
--vim.api.nvim_set_keymap("n", "<leader>fl", "<Plug>WikiLinkFollow", { noremap = true })
