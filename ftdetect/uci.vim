function s:detect_uci_statements()
      " Match a config or package statement at the start of the line.
      let pattern = '^\s*\(\(c\|config\)\|\(p\|package\)\)\s\+\S'
      return getline(1) =~# pattern || getline(2) =~# pattern || getline(3) =~# pattern
endfunction

" UCI files are normally in /etc/config, but that might be mounted over sshfs or similar, so we match more loosely.
" There was some concern[1] that this pattern would match too much, so now we check the file content as well.
" [1]: https://github.com/vim/vim/pull/14385#discussion_r1558878741
autocmd BufNewFile,BufReadPost *etc/config/* if s:detect_uci_statements() | setfiletype uci | endif
