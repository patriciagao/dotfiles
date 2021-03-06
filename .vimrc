" My custom vimrc file
" Inspired in:
"  * https://github.com/thoughtbot/dotfiles/blob/master/vimrc
"  * https://github.com/amix/vimrc
"  * https://github.com/lukaszkorecki/DotFiles/blob/master/vimrc
"  * https://github.com/chrishunt/dot-files/blob/master/.vimrc

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

" use spelling in git commit messages
autocmd FileType gitcommit set spell

"enable mouse scrolling
set mouse=a
set scrolloff=5

""""""""""""""""""""""""
"       Vundles        "
""""""""""""""""""""""""

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" Configure backspace so it acts as it should act
set whichwrap+=<,>,[,]

" backspace mode
set bs=2

" set line length for all files at 80
autocmd FileType text setlocal textwidth=80

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
" Colors
colorscheme railscasts

" Enable syntax highlighting
syntax on

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

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

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

" check syntax before saving
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

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
au BufNewFile,BufRead *.halmbars set ft=handlebars

" tmux
au BufNewFile,BufRead *tmux.conf set syntax=tmux

" SCSS
autocmd FileType scss setlocal iskeyword+=-,$,@

" coffeescript
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

""""""""""""""""""""""""""
"       Shortcuts        "
""""""""""""""""""""""""""
let mapleader = "\<Space>"

"Nerdtree
nmap <leader>ne :NERDTree<cr>

"Save file
nnoremap <Leader>w :w<CR>

"Visual mode
nmap <Leader><Leader> V

"Selection
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
