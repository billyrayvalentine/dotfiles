" execute pathogen#infect()

" Syntax highlighting on
syntax on

" 4 spaces for a tab
set ts=4

" Follow indentation from line above
set autoindent

" Use spaces when using tab key
set expandtab

" Always show the ruler
set ruler

" Always show the bar when there are tabs
set showtabline=2

" Make searches case sensitive
set ignorecase

" Make vnew open on the right
set splitright

" Alias Wq to wq
com Wq wq

" Set comments to lightblue
hi Comment ctermfg=lightblue

" Colour test with 
" :e $VIMRUNTIME/syntax/colortest.vim 
" :so %

" Smart auto indents for python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setlocal shiftwidth=4 softtabstop=4

" Wrap Markdown 
autocmd BufRead,BufNewFile *.md set filetype=Markdown
au Filetype Markdown setlocal wrap textwidth=80

" Don't expand tab for Makefiles
autocmd FileType make setlocal noexpandtab

" assembler
au BufRead,BufNewFile *.asm set filetype=asm68k
autocmd FileType asm68k setlocal shiftwidth=2 softtabstop=4 tabstop=4

" Other indents
autocmd BufRead *.c set cindent
autocmd FileType c setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType asm68k setlocal shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType rust setlocal shiftwidth=2 softtabstop=4 tabstop=4

" Delete trailing line endings 
" autocmd BufWritePre *.{groovy,json,py,c,asm} %s/\s\+$//e
autocmd FileType c,cpp,java,php,python,Markdown,asm68k,rust autocmd BufWritePre <buffer> %s/\s\+$//e

" Show a purple marker if we get to 80 chars (keep inside of this)
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%80v', 100)

nnoremap <F2> :!make <CR>

" https://www.youtube.com/watch?v=XA2WjJbmmoM
set path+=**
set wildmenu
