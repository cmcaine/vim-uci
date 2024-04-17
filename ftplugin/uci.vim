if exists("b:did_ftplugin")      
  finish
endif
let b:did_ftplugin = 1

" UCI files are indented with tabs.
setl noet
setl commentstring=#\ %s

let b:undo_ftplugin = "setlocal et< cms<"
