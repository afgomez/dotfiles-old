" Use vim-javascript and vim-jsx, since they work better than the existing
" typescript plugins
au BufNewFile,BufRead *.ts set filetype=javascript
au BufNewFile,BufRead *.tsx set filetype=javascript.jsx
