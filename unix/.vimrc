" Assume editorconfig-vim, fzf, fzf.vim plugins
set guioptions-=m
set guioptions-=T

filetype plugin indent on
syntax on
set bg=dark
" show partial cmd
set showcmd
" Keep 4 lines off the edges of the screen when scrolling
set scrolloff=4                 
" Search as you type
set incsearch
set expandtab ts=2 sw=2 ai
set ignorecase
set smartcase
set autowriteall
set autoread
" Eliminate delays on ESC
set timeoutlen=1000 ttimeoutlen=0
" Copy the structure of the existing lines indent when autoindenting a new line
set copyindent
" Copy to both internal and external (system) clipboard
set clipboard=unnamedplus,unnamed
" Highlight search results
set hlsearch
" Helps to avoid all the hit-enter prompts caused by file
set shortmess=at
set encoding=UTF-8
set wildmenu
set wildmode=list:full:lastused
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk,*/dist/*,*/cache/*,*.png,*.jpg,*.gif,*.webp,*/dist/*,*.svg,*.png,package-lock.json
" Experimental
" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
" Enable relative line numbers
set number
set relativenumber

let g:fzf_layout = { 'window': { 'height': 1, 'width': 1 }}

" Always show status line
set laststatus=2
set statusline=
set statusline+=\%f " Filename
set statusline+=\ %#CursorColumn# " Cursor
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " File encoding
set statusline+=\[%{&fileformat}\] " File format
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=%=
set statusline+=\%{getcwd()}\  " CWD

" Experimental
" Clear highlights by pressing Escape
map <esc> :noh <CR>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <BS> <nop>
map <Del> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <Del> <nop>
imap <BS> <nop>
" reselect pasted text
nnoremap gp `[v`]
" Auto save on FocusLost (only works for certain terminals see :help FocusLost)
autocmd BufLeave,FocusLost * nested silent! wall

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Experimental
" Alt+<key> producing an accent thus rendering most alt keybindings useless: https://github.com/vim/vim/issues/5200#issuecomment-552112818
let &t_TI = ""
let &t_TE = ""

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" disable less compatibility mode for vimpager (You can still enable less mode
" with this setting by pressing ",v")
if !exists('g:less')
  let g:less     = {}
endif
let g:less.enabled = 0
