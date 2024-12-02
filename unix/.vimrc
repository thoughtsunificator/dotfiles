filetype plugin indent on
syntax on
set autoread
" Eliminate delays on ESC in vim and zsh
set timeoutlen=1000 ttimeoutlen=0
set clipboard=unnamedplus,unnamed
set hlsearch
set guifont=Hack\ Nerd\ Font:h18
set shortmess=at
set encoding=UTF-8
set expandtab ts=2 sw=2 ai
set wildmenu
set wildmode=list:full:lastused
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk,*/dist/*,*/cache/*,*.png,*.jpg,*.gif,*.webp,*/dist/*,*.svg,*.png
let g:fzf_layout = { 'window': { 'height': 0.9, 'width': 0.9 } }

nnoremap <C-PageUp> :bp<CR>
nnoremap <C-PageDown> :bn<CR>

" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


