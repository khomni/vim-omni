syntax on
set number
set gfn=Courier\ 14
set hlsearch
set encoding=utf-8
set autoindent
set smartindent
set ignorecase
set nowrap
set equalalways
let g:session_autoload='no'

set foldenable
set foldmethod=syntax
set foldclose=all
set foldopen=all
set foldcolumn=2
set foldlevel=999

set wildmenu
set wildmode=full
set wildcharm=<C-Z>
set wildignore+=**/node_modules

" Auto read file on change
set autoread
au CursorHold * checktime

" Allows backspacing over everything
set backspace=2


source $VIMRUNTIME/menu.vim
source ~/.vim/omni/plugins.vim
source ~/.vim/omni/mappings.vim
source ~/.vim/omni/plugins.vim
source ~/.vim/omni/aesthetics.vim

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'file': '\.exe$\|\.so$\|\.dat$',
  \ 'dir': 'node_modules\|git\|DS_Store' 
  \ }

let g:prosession_dir = '~/vimfiles/sessions/'
let g:vim_markdown_folding_disabled=1

" let g:indent_guides_autocmds_enabled = 1
let g:indent_guides_start_level=1
let g:indent_guies_guide_size=1
let g:indent_guides_color_change_percent=4
let g:indent_guides_enable_on_vim_startup=1


" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_debug = 1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
" let g:syntastic_cpp_checkers=['gpp', 'clang_tidy']
" let g:syntastic_cpp_compiler_options="-std=c++11 -stdlib=libc++"

set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backups
