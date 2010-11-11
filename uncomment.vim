"Vim global plugin for commenting and uncommenting
"perl style blocks
"Maintainer : Mikhail : deansta@gmail.com
"License 	: None as of now
"

if exists("loaded_uncomment")
	finish
endif
let loaded_uncomment = 1

if !hasmapto('<Plug>Pcomment')
	map <silent><unique> <Leader>/ <Plug>Pcomment
endif
noremap <unique> <script> <Plug>Pcomment <SID>Pcomment
noremap <SID>Pcomment :call <SID>Pcomment()<CR>


if !hasmapto('<Plug>Puncomment')
	map <silent><unique> <Leader>? <Plug>Puncomment
endif
noremap <unique> <script> <Plug>Puncomment <SID>Puncomment
noremap <SID>Puncomment :call <SID>Puncomment()<CR>


if !hasmapto('<Plug>Pbuncomment')
	map <silent><unique> <Leader>{ <Plug>Pbuncomment
endif
noremap <unique> <script> <Plug>Pbuncomment <SID>Pbuncomment
noremap <SID>Pbuncomment :call <SID>Pbuncomment()<CR>


function s:Pcomment() range
	exe a:firstline . "," a:lastline . 's/^/#/'
endfunction
	
function s:Puncomment() range
	exe a:firstline . "," a:lastline . 's/^\(\s*\)#/\1/'
endfunction
	
function s:Pbuncomment()
	let save_cursor = getpos(".")
	exe '?^#\@!?+1'
	let beg=line(".")
	exe '/^#\@!/-1'
	let end=line(".")
	exe beg."," end . 'call <SID>Puncomment()'
	call setpos('.', save_cursor)
endfunction
