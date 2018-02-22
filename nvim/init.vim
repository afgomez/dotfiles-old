if !has('nvim')
  set nocompatible
endif

"
" Setup plugins
" -------------

call plug#begin('~/.local/share/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'

" UI
Plug 'afgomez/better-cobalt.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if !has('gui')
  Plug 'sjl/vitality.vim'
endif

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" Load Matchit. Not really a plugin...
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

"
" Indent settings
" ---------------

set tabstop=2
set shiftwidth=2 softtabstop=2 expandtab

set autoindent
set smartindent


"
" Setup UI
" --------

if has('nvim')
  set termguicolors
endif

colorscheme better-cobalt
let g:airline_theme = "powerlineish"

" Status line setup
set cmdheight=2   " I like high command status
set laststatus=2  " Always show status line (for vim-airline)
set noshowmode    " We have it in vim-airline already
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = ['indent', 'long', 'mixed-indent-file']
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'VL',
    \ '' : 'VB',
    \ 's'  : 'S',
    \ 'S'  : 'SL',
    \ '' : 'SB',
    \ }

" Remove delay in vim-airline when leaving insert mode
set ttimeoutlen=50

"
" Undo
" ----

set undofile                         " Save undo's after file closes
set undodir=$HOME/.cache/nvim/undo// " where to save undo histories
set undolevels=1000                  " How many undos
set undoreload=10000                 " number of lines to save for undo

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

"
" Autosave
" --------

set autowrite
augroup focus_lost
  autocmd!
  autocmd BufLeave,FocusLost * silent! wall
augroup END

if (!has('gui'))
  let g:vitality_always_assume_iterm=1
endif

"
" Keymaps
" -------

let mapleader=","

" Easier window movements
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" FZF
map <Leader>gf :Files<CR>
map <Leader>gb :Buffers<CR>

" Mundo
nmap <leader>u :MundoToggle<CR>

