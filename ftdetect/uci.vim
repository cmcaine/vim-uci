" UCI files are normally in /etc/config.
autocmd BufNewFile,BufReadPost *etc/config/*
      \ if getline(1) . getline(2) . getline(3) =~# 'config' |
      \   setfiletype uci |
      \ endif
