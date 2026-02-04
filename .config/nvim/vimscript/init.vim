"     ____  ___  ____ _   __(_)___ ___
"   / __ \/ _ \/ __ \ | / / / __ `__ \
"  / / / /  __/ /_/ / |/ / / / / / / /
" /_/ /_/\___/\____/|___/_/_/ /_/ /_/

syntax enable
filetype plugin indent on
set nocompatible
set autoindent
set smartindent
set nomodeline " disable modeline vulnerability

set encoding=utf8

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set backspace=indent,eol,start
set hidden
set laststatus=2

" Set linenumbers
set number
" Set relativenumber
set wrap

set ruler

" Highlight searching
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase
set visualbell
set cursorline
" set cursorcolumn

set wildmenu
set wildmode=longest,list

if has("nvim")
    set inccommand="nosplit"
endif

set autoread
set mouse=a

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Tabs
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" File tree browser
nmap [           :NERDTreeToggle<CR>

set noshowmode

" Shell
set shell=/bin/zsh

syntax on
set background=dark

set termguicolors

setlocal foldmethod=indent
set nofoldenable
set foldlevel=99

"""""""""""""""""""""""""""""""""""""""""""""""""""" Plugins

call plug#begin('~/.config/nvim/plug.vim')

Plug 'junegunn/vim-plug'

Plug 'scrooloose/nerdtree', {'on' : 'NERDTreeToggle'}
    let g:NERDTreeWinSize=25

Plug 'preservim/nerdcommenter'
    let g:NERDSpaceDelims=1

Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
    " let g:multi_cursor_use_default_mapping=0

    " Default mapping
    " let g:multi_cursor_start_word_key      = '<C-n>'
    " let g:multi_cursor_select_all_word_key = '<A-n>'
    " let g:multi_cursor_start_key           = 'g<C-n>'
    " let g:multi_cursor_select_all_key      = 'g<A-n>'
    " let g:multi_cursor_next_key            = '<C-n>'
    " let g:multi_cursor_prev_key            = '<C-p>'
    " let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'dense-analysis/ale'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sheerun/vim-polyglot'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'qualia',
    \ 'mode_map': {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'T',
      \ },
    \ 'component': {
      \ 'lineinfo': '%3l:%-2v%<',
      \ },
    \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
      \         [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
    \ 'component_function': {
      \ 'cocstatus': 'coc#status',
      \ 'currentfunction': 'CocCurrentFunction'
      \ },
    \ }

Plug 'lifepillar/vim-colortemplate'
Plug 'rrethy/vim-hexokinase', {'do' : 'make hexokinase'}
    let g:Hexokinase_highlighters = ['foregroundfull']

" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'

Plug 'SirVer/ultisnips'
    let g:UltiSnipsNoPythonWarning = 1
    " g:UltiSnipsExpandTrigger = <nop>
    " g:UltiSnipsJumpForwardTrigger = <nop>
    " g:UltiSnipsJumpBackwardTrigger = <nop>
Plug 'honza/vim-snippets'

Plug 'lervag/vimtex'
    let g:vimtex_compiler_latexmk_engines = {
      \ '_'                : '-xelatex',
      \ 'pdflatex'         : '-pdf',
      \ 'dvipdfex'         : '-pdfdvi',
      \ 'lualatex'         : '-lualatex',
      \ 'luatex'           : '-luatex',
      \ 'xelatex'          : '-xelatex',
      \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
      \ 'context (luatex)' : '-pdf -pdflatex=context',
      \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
      \}

    let g:vimtex_compiler_latexrun_engines = {
      \ '_'                : 'pdflatex',
      \ 'pdflatex'         : 'pdflatex',
      \ 'lualatex'         : 'lualatex',
      \ 'luatex'           : '-luatex',
      \ 'xelatex'          : 'xelatex',
      \}

    " let g:vimtex_view_method ='zathura'
    let g:vimtex_view_method ='skim'
    let g:vimtex_view_skim_sync = 1
    let g:vimtex_view_skim_activate = 1

    let g:vimtex_quickfix_open_on_warning = 0
    let g:vimtex_quickfix_mode = 2

Plug 'matze/vim-tex-fold'
    let g:vimtex_fold_enable = 1

Plug 'KeitaNakamura/tex-conceal.vim', {'for' : 'tex'}
    let g:tex_conceal_frac=1
    let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
    let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
    set conceallevel=2
    let g:tex_conceal='abdmg'

" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
"
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme qualia
" vim.cmd.colorscheme "catppuccin"

" require("catppuccin").setup({
    " integrations = {
        " coc = true,
    " }
" })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Comment gui=italic cterm=italic
hi Function gui=italic cterm=italic
hi SpecialComment gui=italic cterm=italic

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.* silent! execute '0r $HOME/.config/nvim/templates/template.'.expand("<afile>:e")
    augroup END
    autocmd BufWritePre *.py :%s/\s\+$//e
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    let result = system(cmd)
    echo result . " words"
endfunction

command WC call WC()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
