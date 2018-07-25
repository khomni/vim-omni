set gfn=Courier\ 11
color farout


" quickly set the colors that govern the statusbar
function! ResetStatusColors(light, med, dark)
	" Default — 
	execute  'hi  User1  guifg='  .  a:light   'guibg='  .  a:dark 'gui=bold'
	execute  'hi  User2  guifg='  .  a:med     'guibg='  .  a:dark
	execute  'hi  User3  guifg='  .  'black'   'guibg='  .  a:light
	execute  'hi  User4  guifg='  .  'orange'   'guibg='  .  a:dark 'gui=bold'
	execute  'hi  Cursor  guibg='  .  a:light
endfunction

" Custom Hex values
let statusLight = "#E0CCAE"
let statusMed = "#111111"
let statusDark = "#291916"

call ResetStatusColors(statusLight, statusMed, statusDark)

hi SpellBad term=reverse cterm=undercurl gui=undercurl guisp=#CC484F ctermbg=NONE guibg=NONE

function! LineColumn() abort
	return filereadable(expand('%')) ? ':' . line('.') . ':' . col('.') : ''
endfunction

function! FileTail() abort
	return filereadable(expand('%'))?expand('%:t'):''
endfunction

" Statusline
set laststatus=2
set statusline=%*
set statusline+=%.20{expand('%:h')}
set statusline+=%*
set statusline+=%{filereadable(expand('%'))?'/':''}
set statusline+=%4*%{&mod&&filereadable(expand('%'))?expand('%:t'):''}
set statusline+=%1*%{!&mod&&filereadable(expand('%'))?expand('%:t'):''}
set statusline+=%*%{filereadable(expand('%'))?':':''}
set statusline+=%*
" set statusline+=%{filereadable(expand('%'))?':'.line('.').':'.col('.'):''}
set statusline+=%-8(%l:%c%)
set statusline+=\ %3p%%
" set statusline+=%{LineColumn()}
" right align
set statusline+=%=
set statusline+=%r
set statusline+=%{&readonly?'[R]':''}
set statusline+=%3*
" set statusline+=%{&mod?'[+]':''}
set statusline+=%*
set statusline+=%{winnr('$')>1?'«'.win_getid().'»':''}
