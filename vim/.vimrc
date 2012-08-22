" functions
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
set hlsearch
set incsearch
set fileencodings=utf-8,gbk

" key mappings
map ,a <C-W><C-W>
map ,f :NERDTree<CR>
map ,v :vs<CR><C-W><C-W>
map tt :tabnew<CR>
map tn :tabnext<CR>
map tp :tabprevious<CR>
map tc :tabclose<CR>
imap {<CR> {<CR>}<Esc>O
"map ,v :vs<CR><C-W><C-W>:call SourcePair()<CR>

" auto command
augroup MyIMAPs
    au!
"    au VimEnter * call IMAP('()', '(<++>)<++>', '')
"    au VimEnter * call IMAP('{}', '{<++>}<++>', '')
"    au VimEnter * call IMAP('[]', '[<++>]<++>', '')
"    au VimEnter * call IMAP('<>', '<<++>><++>', '')
augroup END

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
