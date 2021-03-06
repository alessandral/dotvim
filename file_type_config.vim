" *******************************
" * file type setup 		*
" *******************************
"
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby

" automatically trim whitespace for specific file types
autocmd FileType c,cpp,java,php,ruby,perl autocmd BufWritePre <buffer> :%s/\s\+$//e

" Treat JSON files like JavaScript
autocmd BufNewFile,BufRead *.json set filetype=javascript

" make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal! g`\"" | endif


" Enable omni completion.
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Leave the return key alone when in command line windows, since it's used
" to run commands there.
autocmd! CmdwinEnter * :unmap <cr>
autocmd! CmdwinLeave * :call MapCR()
