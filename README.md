# vim-uci

Tiny, simple ftdetect, ftplugin and syntax scripts for OpenWRT's Unified
Configuration Interface files.

Don't have vim on your router? I don't either, but this works great with sshfs.

## Bonus features

`ftplugin/uci.vim` sets `commentstring` correctly, so tpope's
[vim-commentary](https://github.com/tpope/vim-commentary) works as intended!

## Installation

If you don't have a preferred installation method, I recommend installing
[pathogen.vim](https://github.com/tpope/vim-pathogen), and then simply copy and
paste:

    cd ~/.vim/bundle
    git clone git://github.com/cmcaine/vim-uci.git

Vundle, etc. will probably work fine too.

## License

Copyright Colin Caine. GPL v3.
