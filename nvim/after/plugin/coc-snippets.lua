-- <CR> confirms completion (default: <C-y>)
vim.api.nvim_set_keymap("i", "<CR>", [[pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"]], { silent = true, expr = true })
    -- coc#_select_confirm() helps select first completion item when necessary and send <C-y> to vim to confirm completion.
    -- \<C-g>u used for break undo chain at current position.
    -- coc#on_enter() notify coc.nvim that you have pressed <enter>, so it can format your code on <enter>.

-- Use <C-l> for trigger snippet expand.
-- The completion window is either limited onto snippets
-- or a snippet matching the trigger exactly is expanded,
-- i.e. <def> expands although there are <deff>, <defc>, …
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>(coc-snippets-expand)", {})

-- Use <C-j> for select text for visual placeholder of snippet.
vim.api.nvim_set_keymap("v", "<C-k>", "<Plug>(coc-snippets-select)", {})

-- Use <C-j> for jump to next placeholder, it"s default of coc.nvim
vim.g.coc_snippet_next = "<c-k>"

-- Use <C-k> for jump to previous placeholder, it"s default of coc.nvim
vim.g.coc_snippet_prev = "<c-j>"

-- Use <C-j> for both expand and jump (make expand higher priority.)
vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>(coc-snippets-expand-jump)", {})

-- Use <leader>x for convert visual selected code to snippet
vim.api.nvim_set_keymap("x", "<leader>x", " <Plug>(coc-convert-snippet)", {})
