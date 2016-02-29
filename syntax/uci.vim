" Vim syntax file
" Language:	OpenWrt Unified Configuration Interface
" Maintainer:	Colin Caine <colin.caine@manchester.ac.uk>
" Last Change:	2016 Feb 29
"
" For more information on uci, see https://wiki.openwrt.org/doc/uci

if exists("b:current_syntax")
    finish
endif

" Fancy zero-width non-capturing look-behind to see what the last word was.
" Would be really nice if there was some less obscure or more efficient way to
" do this.
syntax match uciOptionName '\%(\%(option\|list\)\s*\)\@<=\S*'
syntax match uciConfigName '\%(config \s*\)\@<=\S*'
syntax keyword uciConfigDec config nextgroup=uciConfigName skipwhite
syntax keyword uciOptionType option list nextgroup=uciOptionName skipwhite

" Standard matches.
syntax match uciComment "#.*$"
syntax region uciString start=+"+ end=+"+ skip=+\\"+

highlight default link uciConfigName Identifier
highlight default link uciOptionName Constant
highlight default link uciConfigDec Statement
highlight default link uciOptionType Type
highlight default link uciComment Comment
highlight default link uciString Normal

let b:current_syntax = "uci"
