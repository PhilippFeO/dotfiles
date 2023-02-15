This projects covers my `nvim` configuration.

I am using two `init` files, since [`treesitter`](https://github.com/tree-sitter/tree-sitter) breaks [`vimtex`](https://github.com/lervag/vimtex)'s conceal mechanics. I also discovered that `tex` syntax highlighting is more elaborate without `treesitter`.
To utilize [`init-latex.lua`](./init-latex.lua) easily, I set the following `alias`: `nviml='nvim -u ~/.config/nvim/init-latex.lua'`.
