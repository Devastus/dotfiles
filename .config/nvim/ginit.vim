set mouse=a

if exists(':GuiFont')
    GuiFont! NotoSansMono NF:h10
endif

if exists(':GuiTabline')
    GuiTabline 0
endif

if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
