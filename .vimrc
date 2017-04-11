syntax on
" Width on display with tab
" set tabstop=2

" Enable to indent automatically
set autoindent
" Enable to indent when inputting one keyword
set smartindent cinwords={,if,else,elif,for,while,try,except,finally,def,class
" Extend tab to space
"set expandtab
" Width by auto indent
" set shiftwidth=2

set nocompatible

" Display tab or return
set list

"Validate clipboard
set clipboard+=unnamed
set clipboard+=autoselect

set number

" Close enclosure automatically
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

let g:godef_split = 0

filetype off
if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
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


    "NeoSnippet
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    call neobundle#begin(expand('~/.vim/bundle/'))

    NeoBundleFetch 'Shougo/neobundle.vim'

    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'

    NeoBundle 'vim-jp/vim-go-extra'

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

endif

"Validate delete button
set backspace=indent,eol,start

"For Sushi
"https://togetter.com/li/1053065
"NeoBundle 'pocke/sushibar.vim'

"set statusline=%!sushibar#sushibar()
"set laststatus=2
