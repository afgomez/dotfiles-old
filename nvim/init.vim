if !has('nvim')
  set nocompatible
endif

"
" Setup plugins
" -------------

call plug#begin('~/.local/share/nvim/plugged')

Plug 'afgomez/vim-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" UI
Plug 'afgomez/better-cobalt.vim'
Plug 'cohama/lexima.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if !has('gui')
  Plug 'sjl/vitality.vim'
endif

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Helps debugging colorschemes
Plug 'gerw/vim-HiLinkTrace'

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

" Tell me where I am
set number
set cursorline

" Don't jump arround when showint linting errors
set signcolumn="yes"

" If the filetype of the file has some textwidth setting set the color column
" to that value. If not, set it to a reasonable default
function! EnsureColorColumn()
  if &tw == 0
    setlocal colorcolumn=79
  else
    setlocal colorcolumn=+0
  endif
endfunction
augroup color_column
  au!
  au Filetype * call EnsureColorColumn()
augroup END

" STFU Vim!
set visualbell

" Use system clipboard
set clipboard=unnamed

" Enable mouse in the terminal
set mouse=a

" Don't complain when switching unsaved buffers
set hidden

" re-read a file if it has a different timestamp
set autoread

" Don't include the character under the cursor in selection
set selection=exclusive

" When switching buffers go to an existing window if visible
set switchbuf=useopen

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Vertical splits to the right
set splitright

" Don't wrap
set nowrap

"
" Search
" ------

set hlsearch      " Highlight search results"
set incsearch     " ...dynamically as they are typed.
set ignorecase    " Don't care about case
set smartcase     " Insensitive case unless there are some uppercase letters

let g:rg_highlight = 'true'

" Cleanup a bit the quickfix
augroup ft_quickfix
  au!
  au Filetype qf setlocal colorcolumn=0 nonumber nolist cursorline nowrap tw=0

  au Filetype qf nnoremap <buffer> <cr> :execute "normal! \<lt>cr>"<cr>
augroup END


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

" Switch to last buffer
nnoremap <leader><leader> <c-^>

" Edit a file in the same path of the current one
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

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

" Sane navigation with wrapped lines
nnoremap <Up> gk
nnoremap k gk
nnoremap gk k
nnoremap <Down> gj
nnoremap j gj
nnoremap gj j
