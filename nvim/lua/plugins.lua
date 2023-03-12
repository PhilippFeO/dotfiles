-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

    use 'lervag/vimtex'
    --use 'lervag/wiki.vim'
    use { 'lervag/wiki.vim', opt = false, event = 'VimEnter' }

    -- Colorschemes
    use( 'rose-pine/neovim', { as = 'rose-pine' })
    use 'rebelot/kanagawa.nvim'
    use 'mhartington/oceanic-next'
    use 'navarasu/onedark.nvim'

    use 'frazrepo/vim-rainbow'

    -- Conquer of Completion (LSP)
    use {'neoclide/coc.nvim', branch = 'release'}

    use 'honza/vim-snippets'

    -- Codeium-Plugin
    -- Evtl. muss ich mir auf der Seite einen neuen Authentifizierungstoken holen.
    -- https://github.com/Exafunction/codeium.vim
    --use {'Exafunction/codeium.vim', disable = true}
end)
