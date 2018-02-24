"
" Autosave
" --------
set autowrite

augroup focus_lost
  autocmd!
  autocmd BufLeave,FocusLost * silent! wall
augroup END

" Autosave in iTerm
if (!has('gui'))
  let g:vitality_always_assume_iterm=1
endif
