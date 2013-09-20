" My custom vimrc file
" Inspired in:
"  * https://github.com/amix/vimrc
"  * https://github.com/lukaszkorecki/DotFiles/blob/master/vimrc

""""""""""""""""""""""""
"       General        "
""""""""""""""""""""""""
set nocompatible
set title

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on
filetype on

" use spelling in git commit messages
autocmd FileType gitcommit set spell


""""""""""""""""""""""""""
"       Interface        "
""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" highlight current line and add line numbers
set cursorline
set number

" Configure backspace so it acts as it should act
set whichwrap+=<,>,[,]

" backspace mode
set bs=2

" set line length for all files at 100
autocmd FileType text setlocal textwidth=79

" reopening a file with the cursor in the last edited position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


""""""""""""""""""""""""
"       Backups        "
""""""""""""""""""""""""
" No backups, Vim crashes so rarely I don't feel like I need these
set nobackup
set nowritebackup
set noswapfile


"""""""""""""""""""""""""""""""""
"       Fonts and colors        "
"""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Colors
let &t_Co=256
set background=dark

" nice colors for error messages
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


""""""""""""""""""""""""""""""""
"       Tabs and indent        "
""""""""""""""""""""""""""""""""
" indent: 1 tab == 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2

" Use spaces instead of tabs
set expandtab


""""""""""""""""""""""""""""
"       Status line        "
""""""""""""""""""""""""""""
set statusline=
" file name
set statusline+=%f\ %2*%m\ %1*%h
" generic warning message
set statusline+=%#warningmsg#
" span
set statusline+=%*

" [ encoding filetype]
set statusline+=%r%=[%{&encoding}\ %{strlen(&ft)?&ft:'none'}]

" current column line and total number of lines
set statusline+=\ %12.(%c:%l/%L%)

" always show status line
set laststatus=2


""""""""""""""""""""""""""""""""""""""
"       Programming languages        "
""""""""""""""""""""""""""""""""""""""
" Ruby
" non ruby files which are ruby
au BufNewFile,BufRead Capfile,Gemfile,Gemfile.lock,Guardfile,Rakefile,*.rake set filetype=ruby

" reject! and responds_to? are methods in ruby
autocmd FileType ruby setlocal iskeyword+=!,?,@

" make rspec stuff part of ruby syntax
autocmd BufNewFile,BufRead *_spec.rb syn keyword ruby describe
      \ context
      \ it
      \ specify
      \ it_should_behave_like
      \ before
      \ after
      \ setup
      \ subject
      \ its
      \ shared_examples_for
      \ shared_context
      \ let

" Javascript
" json & javascript
au BufNewFile,BufRead  *.json set ft=json
let g:syntastic_javascript_jshint_conf = expand("~/.jshint.json")

" use conceal to hide 'function' keywoard and use cchar=λ as a replacement
au BufNewFile,BufRead *.js syntax keyword javaScriptFunction function conceal cchar=λ
au BufNewFile,BufRead *.js syntax keyword Function function conceal cchar=λ
au BufNewFile,BufRead *.js hi! link javaScriptFunction Conceal
au BufNewFile,BufRead *.js hi! link Function Conceal
au BufNewFile,BufRead *.js setlocal conceallevel=2

" handlebars templates
au BufNewFile,BufRead *.hb set ft=handlebars

" tmux
au BufNewFile,BufRead *tmux.conf set syntax=tmux

" SCSS
autocmd FileType scss setlocal iskeyword+=-,$,@
