" Set `makeprg` command values for both pdflatex and latexmk
let s:pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode ' .
      \ '-halt-on-error -synctex=1 -output-directory=%:h %'
" (Using '\' just continues a Vimscript expression on a new line for better readability)
let s:latexmk = 'latexmk -pdf -output-directory=%:h %'

" Create a variable to store pdflatex/latexmk state
" Possible values: 1 for latexmk and 0 for pdflatex
let b:tex_use_latexmk = 0

" Toggles between latexmk and pdflatex
function! s:TexToggleLatexmk() abort
  if b:tex_use_latexmk  " if latexmk is on, turn it off
    let b:tex_use_latexmk = 0
  else  " if latexmk is off, turn it on
    let b:tex_use_latexmk = 1
  endif
  call s:TexSetMakePrg()  " update Vim's `makeprg` option
endfunction

" Sets the value of `makeprg` based on current value of `b:tex_use_latexmk`
function! s:TexSetMakePrg() abort
  if b:tex_use_latexmk
    let &l:makeprg = expand(s:latexmk)
  else
    let &l:makeprg = expand(s:pdflatex)
  endif
endfunction


" Use <leader>tl to switch between pdflatex and latexmk compilation
nmap <F5> <Plug>TexToggleLatexmk
nnoremap <script> <Plug>TexToggleLatexmk <SID>TexToggleLatexmk
nnoremap <SID>TexToggleLatexmk :call <SID>TexToggleLatexmk()<CR>


call s:TexSetMakePrg()  " set value of Vim's `makeprg` option
