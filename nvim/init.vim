if !has('nvim')
  set nocompatible
endif

"
" Setup plugins
" -------------
call plug#begin('~/.local/share/nvim/plugged')

" UI
Plug 'afgomez/better-cobalt.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

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
