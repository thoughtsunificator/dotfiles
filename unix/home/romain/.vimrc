set guifont=Hack\ Nerd\ Font\ Mono:h18
set shortmess=I
set encoding=UTF-8
set mouse=a
set expandtab ts=2 sw=2 ai
set bg=dark
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk,*/dist/*,*/cache/*,*.png,*.jpg,*.gif,*.webp,*/dist/*,*.svg,*.png
set number

let g:airline_powerline_fonts = 1
let g:jsdoc_allow_input_prompt = 1
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:plug_window = 'noautocmd vertical topleft new' 
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:nerdtree_tabs_open_on_console_startup=1

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']
let g:NERDTreeRespectWildIgnore = 1
let g:CommandTMaxFiles = 500000

let g:NERDTreeGitStatusIndicatorMapCustom = {
                  \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


let g:nerdtree_sync_cursorline = 1
let g:NERDTreeHighlightCursorline = 1

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <F6> :NERDTreeToggle<CR>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'patstockwell/vim-monokai-tasty'

Plug 'pangloss/vim-javascript'

Plug 'elzr/vim-json'

Plug 'tpope/vim-markdown'

Plug 'editorconfig/editorconfig-vim'

Plug 'sheerun/vim-polyglot'

Plug 'morhetz/gruvbox'

Plug 'preservim/nerdtree'

Plug 'othree/html5.vim'

Plug 'vim-test/vim-test'

Plug 'preservim/nerdcommenter'

Plug 'wincent/command-t'

Plug 'vim-airline/vim-airline'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'

Plug 'terryma/vim-multiple-cursors'

Plug 'eslint/eslint'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'

Plug 'unkiwii/vim-nerdtree-sync'

Plug 'dyng/ctrlsf.vim'

Plug 'majutsushi/tagbar'

Plug 'jistr/vim-nerdtree-tabs'

Plug 'heavenshell/vim-jsdoc', {
    \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
  \}
Plug 'majutsushi/tagbar'

Plug 'gisphm/vim-gitignore'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

colorscheme vim-monokai-tasty

nnoremap <S-A-Up> :m-2<CR>
nnoremap <S-A-Down> :m+<CR>
nnoremap ,html :-1read $HOMEPATH/.vim/skeleton/html<CR>3jwf>a
inoremap <S-A-Down> <Esc>:m+<CR>
inoremap <S-A-Up> <Esc>:m-2<CR>
inoremap <F3> <C-O>:w<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <CS-F> :Rg<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <silent> <C-s> :Buffers<CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap <silent> <C-p> :CommandT<CR>
nnoremap <silent> <C-S-f> :RG<CR> 
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
