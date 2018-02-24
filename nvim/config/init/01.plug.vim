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

" Filetypes/language support
Plug 'tpope/vim-rails'

" Helps debugging colorschemes
Plug 'gerw/vim-HiLinkTrace'

call plug#end()

" Load Matchit, although it's not really a `Plug`...
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
