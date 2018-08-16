" Ctrl + n to open nerd tree
map <C-n> :NERDTreeToggle<CR>

" Alt + motion to move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Ctrl-s to rewrite
nnoremap <C-s> :w<cr>
inoremap <C-s> <Esc>:w<cr>i

" Shift + Direction to switch tabs
nnoremap <S-l> gt
nnoremap <S-h> gT

nnoremap <F2> :Gstatus<cr>
nnoremap <F3> :Gcommit<cr>

" QUICKFIX NAVIGATION:
" navigate quickfix with Ctrl + (j / k)
" (requires ./functions.vim)
map <C-j> :QNL<cr>
map <C-k> :QPF<cr>

" LOCATION LIST NAVIGATION:
" navigate location list with Ctrl + (h / l)
nnoremap <C-l> :LNL<cr>
nnoremap <C-h> :LPF<cr>
