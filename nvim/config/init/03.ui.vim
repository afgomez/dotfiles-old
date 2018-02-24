"
" Setup UI
" --------

if has('nvim')
  set termguicolors
endif

colorscheme better-cobalt
let g:airline_theme = "powerlineish"
set list

" Use pretty symbols for hidden characters
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

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

" Don't jump arround when showing linting errors
set signcolumn=yes

" Show a guide for max-length
" If `textwidth` is set use that. Otherwise set up to 79 chars
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

" Open vertical splits in the right
set splitright

" Horizontal splits below
" set splitbelow

" Don't complain when switching unsaved buffers
set hidden

" When switching buffers go to an existing window if visible
set switchbuf=useopen

" Enable mouse in the terminal
set mouse=a

" Don't include the character under the cursor in selection
set selection=exclusive

" Square up visual selections
set virtualedit=block

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Don't wrap lines
set nowrap

" ...but if you have to, be gentle
set linebreak
set showbreak=↪


" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="
