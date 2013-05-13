" https://github.com/tpope/vim-pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nu
set nolist

:syntax on
" :colorscheme ir_black
set vb
set nohlsearch
set binary noeol
set showmatch
set sw=2

" http://gilesbowkett.blogspot.com/2009/06/vim-os-x-clojure-syntax-highlighting.html
au BufRead,BufNewFile *.spec set filetype=ruby
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile Assetfile set filetype=ruby
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.feature set filetype=cucumber
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.fv set filetype=flexverb
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

set expandtab
set tabstop=2
" the next two lines produce behavior which is annoying as fuck by default,
" but very useful under certain circumstances, specifically:
" http://stackoverflow.com/questions/1194185/where-can-i-find-a-decent-ruby-source-beautifier
" set autoindent
" filetype plugin indent on

" http://nvie.com/posts/how-i-boosted-my-vim/
set nobackup
set noswapfile

set pastetoggle=<F2>

" vimcasts.org TextMate-esque text bubbling (episode 26)
" TODO: install Tim Pope's Unimpaired plugin instead
nmap Q ddkP
nmap A ddp
vmap W xkP`[V`]
vmap S xp`[V`]
" also, slight hack here: the vimcasts assumes MacVim and gives key binding specifics
" which fail in my command-line vim. so I just replaced some commands I don't ever use.

" http://twitter.com/#!/Nemo157/status/120975855391485953
" my version has the added benefit of quitting all splits
command -bang Q qall<bang>
command -bang W w<bang>

" http://bit.ly/w4wXlL
inoremap <C-X>c #<C-R>=system('colorpick')<CR>

" http://tech.groups.yahoo.com/group/vim/message/126454
" prevent vim from freaking out over git for no good reason
" actually I'm pretty sure this doesn't even solve the problem >.<
let v:fcs_choice = '' 

" autocmd FileChangedShell <buffer> call ProcessFileChangedShell() 

" Jump to last cursor position unless it's invalid or in an event handler
" from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
" this is awesome in general but sucks ass for git commits
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" also started on this from a DAS video, but documented here
" http://vim.runpaint.org/display/changing-status-line/
" and here
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2
set statusline=%t\ %y\ %L

" http://vimcasts.org/episodes/formatting-text-with-par/
set formatprg=par

" bernhardt's right, it's too much of a pain in the ass. deactivate
" syntax highlighting for markdown because it's usually wrong.
autocmd! FileType mkd setlocal syn=off

" todo: fix this shit, use leader keys instead of LNHK

" write file, then count words in current dir
" this is for writing books in Markdown
map K :w\|:! wc -w *.md<CR>

" write file & run specs
map L :w\|:! rspec<CR>
map N :w\|:! jasmine-node --noStack spec/<CR>

" write file & run *this* spec
" only works if you're in a spec
" inspired by bernhardt, todo: just use his script
map H :w\|:! rspec %<CR>

" avoid weird octal shit
set nrformats=

