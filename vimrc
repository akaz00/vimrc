call pathogen#runtime_append_all_bundles()
filetype plugin on

"ab _ab_hello 안녕
"ia _ia_time <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>

"Syntax highlighting.
syntax on

set ruler " Show row, col number
set hlsearch
set number
"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=4 shiftwidth=4 sts=4
set autoindent

"I dislike CRLF.
set fileformat=unix

set backspace=2

"Detect modeline hints.
set modeline

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"Use mouse.
set mouse=a

"no backup
set nobackup
set nowritebackup
set noswapfile

"Some additional syntax highlighters.
au! BufRead,BufNewFile *.wsgi setfiletype python
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.less setfiletype less

"These languages have their own tab/indent settings.
au FileType cpp    setl ts=2 sw=2 sts=2
au FileType ruby   setl ts=2 sw=2 sts=2
au FileType yaml   setl ts=2 sw=2 sts=2
au FileType html   setl ts=2 sw=2 sts=2
au FileType lua    setl ts=2 sw=2 sts=2
au FileType haml   setl ts=2 sw=2 sts=2
au FileType sass   setl ts=2 sw=2 sts=2
au FileType make   setl ts=4 sw=4 sts=4 noet

"Markdown-related configurations.
augroup mkd
  autocmd BufRead *.markdown set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkdn     set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkd      set formatoptions=tcroqn2 comments=n:> spell
augroup END

"English spelling checker.
setlocal spelllang=en_us

"gVim-specific configurations (including MacVim).
if has("gui")
  colorscheme Mustang
  set guioptions=egmrLt
endif

"MacVim-specific configurations.
if has("gui_macvim")
  set imd
  set transparency=10
  set guifont=Bitstream_Vera_Sans_Mono:h12.00
endif

"Gundo -- Undo tree visualization
let g:gundo_right = 1
function s:MinheeGundoToggle()
  let l:visible = bufwinnr(bufnr("__Gundo__")) != -1
  let l:visible = l:visible || bufwinnr(bufnr("__Gundo_Preview__")) != -1
  if l:visible
    let &columns -= g:gundo_width + 1
  else
    let &columns += g:gundo_width + 1
  endif
  GundoToggle
endfunction
command! -nargs=0 MinheeGundoToggle call s:MinheeGundoToggle()
nnoremap <F5> :MinheeGundoToggle<CR>

set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/
