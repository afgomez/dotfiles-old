" Search in file
map <D-f> /

" Search in project
map <D-S-f> :Rg<space>

" Toggle comments (uses vim-commentary)
nmap <D-/> gcc
vmap <D-/> gc
imap <D-/> <C-o>gcc

" Cmd-CR behaves like Textmate/Sublime
imap <D-CR> <C-o>o

" Switch to specific tab numbers with Command-number
noremap <D-1> :tabn 1<CR>
noremap <D-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>
noremap <D-7> :tabn 7<CR>
noremap <D-8> :tabn 8<CR>
noremap <D-9> :tabn 9<CR>
" Command-0 goes to the last tab
noremap <D-0> :tablast<CR>
