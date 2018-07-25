let s:colors=['srcery', 'deus', 'azuki']
let s:prefab_colors={
      \ }

" quickly set the colors that govern the statusbar
function! ResetStatusColors(light, med, dark)
	" Default — 
endfunction

" Custom Hex values
let s:statusLight = "#E0CCAE"
let s:statusMed = "#111111"
let s:statusDark = "#291916"

function! ColorBySession()
  if exists("g:session_directory")
    let l:this_session = fnamemodify(v:this_session,':t')
    if has_key(s:prefab_colors, l:this_session)
      let l:session_color=s:prefab_colors[l:this_session]
    else
      " METHOD 1: BY SESSION INDEX
      let l:all_sessions=systemlist('ls -rtU '.g:session_directory) " all session by the order in which they were created
      let l:session_index=index(l:all_sessions, fnamemodify(v:this_session,':t'))
      let l:session_mod=l:session_index % len(s:colors)
      let l:session_color=get(s:colors, l:session_index % len(s:colors))
    endif
  else
    execute 'colo' s:colors[0]
  endif

  if exists("l:session_color")
    execute 'colo' l:session_color
  endif
  call ApplyStyleOverrides(s:statusLight, s:statusMed, s:statusDark)
endfunction

function! ApplyStyleOverrides(light, med, dark)
  " Default — 
  execute  'hi  User1  guifg='  .  a:light   'guibg='  .  a:dark 'gui=bold'
  execute  'hi  User2  guifg='  .  a:med     'guibg='  .  a:dark
  execute  'hi  User3  guifg='  .  'black'   'guibg='  .  a:light
  execute  'hi  User4  guifg='  .  'orange'   'guibg='  .  a:dark 'gui=bold'
  execute  'hi  Cursor  guibg='  .  a:light

  hi SpellBad term=reverse cterm=undercurl gui=undercurl guisp=#CC484F ctermbg=NONE guibg=NONE
  hi Error term=reverse ctermfg=203 ctermbg=234 guifg=#ff0000 guibg=#211616 gui=undercurl
endfunction

call ColorBySession()

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
set statusline+=%-8(%l:%c%)
set statusline+=\ %3p%%
set statusline+=%=
set statusline+=%r
set statusline+=%{&readonly?'[R]':''}
set statusline+=%3*
set statusline+=%*
set statusline+=%{winnr('$')>1?'«'.win_getid().'»':''}
