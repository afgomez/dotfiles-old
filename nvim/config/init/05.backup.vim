" Don't use swap files
set noswapfile

" Have backups. Not everything is under version control, and somethigs I run
" the eventual 'git checkout'
set backup
set backupdir=$HOME/.cache/nvim/backup//

if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
