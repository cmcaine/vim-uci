" UCI files are normally in /etc/config.
autocmd BufNewFile,BufReadPost *etc/config/*
      \ if getline(1) =~# '^\s*\(\(c\|config\)\|\(p\|package\)\)\s\+\S' || |
      \    getline(2) =~# '^\s*\(\(c\|config\)\|\(p\|package\)\)\s\+\S' || |
      \    getline(3) =~# '^\s*\(\(c\|config\)\|\(p\|package\)\)\s\+\S' |
      \   setfiletype uci |
      \ endif
