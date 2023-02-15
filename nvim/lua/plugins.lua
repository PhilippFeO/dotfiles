-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
    use 'lervag/vimtex'

    -- Colorschemes
    use( 'rose-pine/neovim', { as = 'rose-pine' })
    use 'rebelot/kanagawa.nvim'
    use 'mhartington/oceanic-next'

    use 'frazrepo/vim-rainbow'


    -- Conquer of Completion (LSP)
    use {'neoclide/coc.nvim', branch = 'release'}

    use 'honza/vim-snippets'

    -- Codeium-Plugin
    use 'Exafunction/codeium.vim'

end)
