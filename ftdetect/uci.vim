function s:detect_uci_statements()
      " Match a config or package statement at the start of the line.
      const config_or_package_statement = '^\s*\(\(c\|config\)\|\(p\|package\)\)\s\+\S'
      " Match a line that is either all blank or blank followed by a comment
      const comment_or_blank = '^\s*\(#.*\)\?$'

      " Return true iff the file has a config or package statement near the
      " top of the file and all preceding lines were comments or blank.
      return getline(1) =~# config_or_package_statement
      \   || getline(1) =~# comment_or_blank
      \      && (   getline(2) =~# config_or_package_statement
      \          || getline(2) =~# comment_or_blank
      \             && getline(3) =~# config_or_package_statement
      \         )
endfunction

" UCI files are normally in /etc/config, but that might be mounted over sshfs or similar, so we match more loosely.
" There was some concern[1] that this pattern would match too much, so now we check the file content as well.
" [1]: https://github.com/vim/vim/pull/14385#discussion_r1558878741
autocmd BufNewFile,BufReadPost */etc/config/* if s:detect_uci_statements() | setfiletype uci | endif
