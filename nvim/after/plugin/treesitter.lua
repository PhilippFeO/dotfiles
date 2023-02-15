-- TREESITTER



-- Habe ich so mehr oder weniger aus "https://www.youtube.com/watch?v=w7i4amO_zaE&t=548s" übernommen
-- Entspricht der Konfiguration auf der GitHub-Treesitter-Seite (s. MeinWiki), nur wurden mehrere Zeilen gelösct
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" 
  ensure_installed = { "python", "lua" },

  -- treesitter and vimtex concealing collide, so I disable syntax highlighting for LaTeX
  -- s. :h vimtex-faq-treesitter
  ignore_install = { "latex" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

