" =================================================
" File: autocommands.vim
" Description: Kyle's boutique custom vim remaps
" =================================================


" Autocommands (only initializes once)
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  syn match constCase /\<[A-Z_]\+\>\C/
  hi def link constCase Constant
  
  augroup vimrc
    let CursorColumnI = 0 "the cursor column position in INSERT
    " change the local directory to the current file
    " autocmd BufEnter * silent! lcd %:p:h
    autocmd BufLeave * lcl

    " Prevent the cursor from wandering left when switching between insert and normal
    autocmd InsertEnter * let CursorColumnI = col('.')
    autocmd CursorMovedI * let CursorColumnI = col('.')
    autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

  augroup END


  augroup markup

    function SetMarkdownOptions()
      nnoremap <buffer> <F2> "*yi[:vim /^#.*<C-R>*/ **/*<CR> 
      nnoremap <silent> <F5> :!start "%"<CR>
      setlocal linebreak
      setlocal wrap
      setlocal spell
    endfunction

    autocmd FileType markdown call SetMarkdownOptions()
  augroup END

  augroup cpp
    " C++ mappings
    let g:syntastic_cpp_compiler="g++"
    let g:syntastic_cpp_compiler_options="-std=c++0x"
    let $CXXFLAGS='-std=c++11'

    autocmd FileType cpp 
          \ map <buffer> <F9> :make %<<cr> | 
          \ map <buffer> <F10> <F9>:!%<<cr>

  augroup END

  augroup javascript
    let g:syntastic_javascript_checkers=['eslint']
    let g:indent_guides_guide_size=1
    " let g:syntastic_javascript_checkers=['jshint']

    autocmd FileType javascript 
          \ map <buffer> <F5> :!node %<cr>
          \ setlocal foldlevel=5
    " autocmd FileType javascript
  augroup END

  autocmd BufEnter .eslintrc set syntax=json


endif


