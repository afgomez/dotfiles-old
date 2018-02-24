if has("gui_macvim")
  let macvim_hig_shift_movement = 1

  " Remove toolbar
  set guioptions-=T

  " Remove scrollbars
  set guioptions+=rRlL
  set guioptions-=rRlL

  " Use console dialogs
  set guioptions+=c

  " Use a pretty font
  set guifont=PragmataPro:h14

  " Don't close the window with <D-w>
  macmenu &File.Close key=<nop>

  " Don't search with <D-f>
  macmenu &Edit.Find.Find\.\.\. key=<nop>

  " Move to previous/next tab as other apps (Firefox, Chrome...)
  macmenu Window.Select\ Previous\ Tab key=<D-M-Left>
  macmenu Window.Select\ Next\ Tab key=<D-M-Right>
endif
