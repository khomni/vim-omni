" Options specific for non-GUI vim
color farout

" quickly set the colors that govern the statusbar
function! ResetStatusColors(light, med, dark)
	" Default — 
	execute  'hi  User1  guifg='  .  a:light   'guibg='  .  a:dark
	execute  'hi  User2  guifg='  .  a:med     'guibg='  .  a:dark
	execute  'hi  User3  guifg='  .  'black'   'guibg='  .  a:light
endfunction

" Custom Hex values
let statusLight = "#E0CCAE"
let statusMed = "#111111"
let statusDark = "#291916"

call ResetStatusColors(statusLight, statusMed, statusDark)

function! LineColumn() abort
	return filereadable(expand('%')) ? ':' . line('.') . ':' . col('.') : ''
endfunction

function! FileTail() abort
	return filereadable(expand('%'))?expand('%:t'):''
endfunction

" Statusline
set laststatus=2
set statusline=%*
set statusline+=%{winnr('$')>1?'['.win_getid().']':''}
set statusline+=%.20{expand('%:h')}
set statusline+=%*
set statusline+=%1*
set statusline+=%{filereadable(expand('%'))?'/'.expand('%:t'):''}
set statusline+=%*
set statusline+=%{filereadable(expand('%'))?':'.line('.').':'.col('.'):''}
set statusline+=\ «%P»
" set statusline+=%{LineColumn()}
" right align
set statusline+=%=
set statusline+=%r
set statusline+=%{&readonly?'[R]':''}
set statusline+=%3*
set statusline+=%{&mod?'[+]':''}
