" functions
" open the corresponding .cpp file when viewing .h file
function SourcePair()
	let current_file = @%
	let dot_index = strridx(current_file, ".")
	let file_name = strpart(current_file, 0, dot_index)
	let source_name = file_name.".cpp"
	silent execute 'e '.source_name
	return source_name
endfunction

" edit options
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set ruler
set hlsearch
set incsearch
set fileencodings=utf-8,gbk
" keep the current line in the middle of window
set so=999 
" remove the delay after 'O', see help esckeys
set ttimeoutlen=100

" key mappings
" switch between split windows
map ,a <C-W><C-W>
" open NERDTree file browser
map ,f :NERDTree<CR>
" shortcut for vsplit
map ,v :vs<CR><C-W><C-W>
" tab operations
map tt :tabnew<CR>
map tn :tabnext<CR>
map tp :tabprevious<CR>
map tc :tabclose<CR>
imap {<CR> {<CR>}<Esc>O
"map ,v :vs<CR><C-W><C-W>:call SourcePair()<CR>
"imap <% <%%><Esc>hi

" auto command
" powerful IMAP from vim-latex
augroup MyIMAPs
    au!
    " for eruby template files
    au VimEnter * call IMAP('ERB', '<%<++>%><++>', 'eruby')
"    au VimEnter * call IMAP('()', '(<++>)<++>', '')
augroup END

" file type auto command
augroup MyFileTypes
    autocmd!
    autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

" for vim-latex
filetype plugin on
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

" for session.vim plugin
let g:session_autosave = 'no'
let g:session_autoload = 'no'
