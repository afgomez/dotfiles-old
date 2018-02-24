function SetTerminalSettings()
  setlocal nonumber
  setlocal signcolumn=no
  set winhl=Normal:TermNormal
  hi TermNormal guibg=#000000
endfunction

augroup terminal_config
  autocmd!
  autocmd TermOpen * call SetTerminalSettings()
augroup END
