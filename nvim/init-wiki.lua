-- init-file for wiki.vim issue

vim.g.wiki_root = '~/wiki.vim'
vim.g.wiki_filetypes = { 'md' }
vim.g.wiki_link_extension = '.md'

vim.g.wiki_link_target_type = 'md'

-- only <g.wiki_root> as wiki file
vim.g.wiki_global_load = 0

vim.g.mapleader = " "
