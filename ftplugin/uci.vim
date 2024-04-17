if exists("b:did_ftplugin")      
  finish
endif
let b:did_ftplugin = 1

" UCI files are indented with tabs.
setl noexpandtab
setl shiftwidth=0
setl softtabstop=0

setl commentstring=#\ %s

let b:undo_ftplugin = "setlocal et< cms<"
