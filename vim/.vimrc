runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
set sts=2 ts=2 sw=2 et nu hlsearch
syntax on
filetype plugin indent on


highlight ExtraWhitespace ctermbg=red guibg=red
let eol = matchadd("ExtraWhitespace", '\s\+$')
set modeline

au BufNewFile,BufRead *.jsx set filetype=javascript
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.md set filetype=markdown

set formatoptions=crqnlj

set backupcopy=yes

" ignore search case except for when I put a cap in the string
set ignorecase
set smartcase

"autoformat paragraph
map <C-q> gwip


" disable all the stuff that gets in the way of copy+paste
let g:copymode=0
function SetCopyMode()
  if g:copymode == 0
    set nu!
    IndentLinesDisable
    GitGutterDisable
    let g:copymode=1
  else
    set nu
    IndentLinesEnable
    GitGutterEnable
    let g:copymode=0
  endif
endfunction

map <C-c> :call SetCopyMode()<cr>

" undo history between sessions
set undofile
set undodir=~/.vim/undodir

source ~/.vim/black.vim

autocmd FileType python map <F8> :Black<cr>
autocmd BufWritePre *.py silent! execute ':Black'

set textwidth=110
set colorcolumn=110

" prettier stuff
autocmd BufWritePre *js silent! execute ':Prettier'
autocmd BufWritePre *jsx silent! execute ':Prettier'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'false'

nnoremap <C-q> gwip
set bg=dark

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-j> :m '>.+1<CR>gv=gv
inoremap <A-k> :m '<.-2<CR>gv=gv

tnoremap <Esc> <C-\><C-n>
