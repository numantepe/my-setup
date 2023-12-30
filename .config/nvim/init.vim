imap jj <Esc>

set mouse=a

autocmd BufEnter * lcd %:p:h

let mapleader = ","

nnoremap <leader>n :e .<CR>
nnoremap <leader>m :b#<CR>
let g:netrw_banner=0

nnoremap <leader>. <C-w>w
nnoremap <leader>w <C-w><Up>
nnoremap <leader>a <C-w><Left>
nnoremap <leader>s <C-w><Down>
nnoremap <leader>d <C-w><Right>

imap "<tab> ""<Left>
imap '<tab> ''<Left>
imap (<tab> ()<Left>
imap [<tab> []<Left>
imap {<tab> {}<Left>
imap {<CR> {<CR>}<ESC>O
imap {;<CR> {<CR>};<ESC>O

command! MakeTags !ctags -R .

syntax on
:set number
:colorscheme desert

set clipboard+=unnamed

command! Yank call system('echo ' . shellescape(@z) . ' | ' . 'yank')

if has('gui_running') || has('nvim') && exists('$DISPLAY')
  	noremap <Leader>y "+y
else
	noremap <silent> <leader>y "zy:Yank<CR>
endif

:colorscheme handmade-hero

