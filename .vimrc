syntax on
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

set nocompatible
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
		" */* : repos on github (git://github.com/*/*.git)
		NeoBundle 'scrooloose/syntastic'
	call neobundle#end()
endif
filetype plugin indent on
"filetype indent on
syntax on


"NeoSnippet
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

call neobundle#end()

filetype plugin indent on


if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
	  \ 'depends' : 'Shougo/vimproc',
	  \ 'autoload' : { 'insert' : 1,}
	  \ }
endif

let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
