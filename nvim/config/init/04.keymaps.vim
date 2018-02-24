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

" Sane navigation with wrapped lines
nnoremap <Up> gk
nnoremap k gk
nnoremap gk k
nnoremap <Down> gj
nnoremap j gj
nnoremap gj j
