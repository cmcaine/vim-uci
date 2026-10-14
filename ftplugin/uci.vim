if exists("b:did_ftplugin")      
  finish
endif
let b:did_ftplugin = 1

" UCI files are indented with tabs.
setl noexpandtab
setl shiftwidth=0
setl softtabstop=0

setl commentstring=#\ %s

" UCI identifiers (e.g. option names) may contain dashes. Telling vim this
" lets 'w', '*', '<C-]>', etc. work better. (Issue #5)
setl iskeyword+=-

let b:undo_ftplugin = "setlocal et< cms< sts< sw< iskeyword<"
