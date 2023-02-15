-- Some Plugins need Python and a python interpreter with the
-- "pynvim" module (Installation: python3 -m pip install --user --upgrade pynvim)
-- Should now work with Virtual Envs flawlessly
-- (s. :help provider-python & further information in my personal wiki, because I havn't understood)
-- the mechanic completely
vim.g.python3_host_prog = '/usr/bin/python3'

-- automatic line breaking 3 characters before right margin
--vim.g.textwidth = 20
--vim.g.wrapmargin = 3
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.wrap = true

vim.cmd("let g:rainbow_active = 1")
