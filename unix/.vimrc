filetype plugin indent on
syntax on
set autoread
" Eliminate delays on ESC in vim and zsh
set timeoutlen=1000 ttimeoutlen=0
set clipboard=unnamedplus
set hlsearch
set autochdir
set guifont=Hack\ Nerd\ Font:h18
set shortmess=at
set encoding=UTF-8
set expandtab ts=2 sw=2 ai
set wildmenu
set wildmode=list:full:lastused
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk,*/dist/*,*/cache/*,*.png,*.jpg,*.gif,*.webp,*/dist/*,*.svg,*.png
set number
set ignorecase		" Do case insensitive matching
let g:fzf_layout = { 'window': { 'height': 0.9, 'width': 0.9 } }

" Mapping
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-h> :History<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>
"nnoremap <C-p> :execute 'Rg' ProjectRootGuess()<CR>
nnoremap <silent> <C-p> :Commands<CR>
nnoremap <silent> <C-o> :Marks<CR>
nnoremap <silent> <C-d> :set mark<CR>
nnoremap <C-PageUp> :bp<CR>
nnoremap <C-PageDown> :bn<CR>
nnoremap <C-tab> :bn<CR>
nnoremap <C-s> :w<CR>
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


