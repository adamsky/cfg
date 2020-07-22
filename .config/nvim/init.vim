if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYNVIMRC
endif

let mapleader = "\<Space>"
set relativenumber
set number

call plug#begin()
"Plug 'chriskempson/base16-vim'
Plug 'Soares/base16.nvim'
" Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
"Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-rooter'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
Plug 'terryma/vim-smooth-scroll'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OmniSharp/omnisharp-vim'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
"Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug '~/.config/nvim/plugged/outcomescript.vim'

call plug#end()


" deal with colors
if !has('gui_running')
  set t_Co=256
endif
"if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  "" screen does not (yet) support truecolor
  "set termguicolors
"endif
set termguicolors
" Colors
set background=dark
"colorscheme base16-gruvbox-dark-hard
colorscheme atelier-plateau 
hi NormalFloat term=NONE guifg=#fffeeb ctermbg=235
" ctermfg=.s:fg_cterm guibg=.s:bgweaker_gui
"hi Normal ctermbg=NONE
"hi Pmenu guibg=red
"hi Pmenu ctermbg=darkgray
" Get syntax
syntax on

" set colorcolumn
set colorcolumn=100
hi ColorColumn ctermbg=7 guibg=#262626

" ==========[ PLUGIN SETTINGS ]============

" Lightline
"let g:lightline.enable = {
	"\ 'statusline': 1,
	"\ 'tabline': 1
	"\ }
let g:lightline = { 'colorscheme': 'simpleblack' }
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

"let g:lightline = { 'component_function': { 'filename': 'LightlineFilename' } }
let g:lightline.component_function = { 'filename': 'LightlineFilename' }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['not']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
" use lightline-buffer in lightline
"let g:lightline = {
    "\ 'tabline': {
    "\   'left': [ [ 'bufferinfo' ],
    "\             [ 'separator' ],
    "\             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    "\   'right': [ [ 'close' ], ],
    "\ },
    "\ 'component_expand': {
    "\   'buffercurrent': 'lightline#buffer#buffercurrent',
    "\   'bufferbefore': 'lightline#buffer#bufferbefore',
    "\   'bufferafter': 'lightline#buffer#bufferafter',
    "\ },
    "\ 'component_type': {
    "\   'buffercurrent': 'tabsel',
    "\   'bufferbefore': 'raw',
    "\   'bufferafter': 'raw',
    "\ },
    "\ 'component_function': {
    "\   'bufferinfo': 'lightline#buffer#bufferinfo',
    "\   'filename': 'LightlineFilename'
    "\ },
    "\ 'component': {
    "\   'separator': '',
    "\ },
"\ }
function! LightlineFilename()
  return expand('%')
endfunction
"let g:lightline = {
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      "\ }
      "\ }
set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" rooter
"let g:rooter_manual_only = 1

" Smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 7, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 7, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 8, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 8, 4)<CR>

" Apply RustFmt on write
let g:rustfmt_autosave = 1

"let g:ale_cs_mcsc_assemblies = [
    "\ '/home/admsky/apps/unity/2018.4.15f1/Managed/UnityEngine.dll',
    ""\ '/home/admsky/apps/unity/2018.4.15f1/Editor/Data/Managed/UnityEngine/UnityEngine.dll',
    "\ '/home/admsky/projects/anthropocene/obj/Debug/*',
    "\]

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim

" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes
hi SignColumn ctermfg=14 ctermbg=None

" Settings needed for .lvimrc
"set exrc
"set secure

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.config/nvim/did
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Use wide tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" markdown wrapping
autocmd Filetype markdown setlocal wrap
autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist
"autocmd Filetype markdown setlocal columns=80


" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/



" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Switch buffers quickly
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>


" Move by line
nnoremap j gj
nnoremap k gk

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

" Find in project
nmap <leader>f :Rg<CR>



" 'Smart' nevigation
nmap <silent> W <Plug>(coc-diagnostic-prev)
nmap <silent> E <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rr <Plug>(coc-rename)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" nmap <silent> F <Plug>(ale_lint)
" nmap <silent> <C-l> <Plug>(ale_detail)
" nmap <silent> <C-g> :close<cr>


