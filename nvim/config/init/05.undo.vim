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


" Trigger Mundo
nmap <leader>u :MundoToggle<CR>
