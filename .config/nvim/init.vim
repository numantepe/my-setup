imap jj <Esc>

set mouse=a

autocmd BufEnter * lcd %:p:h

let mapleader = ","

nnoremap <leader>n :e .<CR>
nnoremap <leader>m :b#<CR>
let g:netrw_banner=0

nnoremap <leader>. <C-w>w

imap "<tab> ""<Left>
imap '<tab> ''<Left>
imap (<tab> ()<Left>
imap [<tab> []<Left>
imap {<tab> {}<Left>
imap {<CR> {<CR>}<ESC>O
imap {;<CR> {<CR>};<ESC>O

autocmd CursorHoldI,CursorHold * silent! update

command! MakeTags !ctags -R .

syntax on
:set number

set clipboard+=unnamed

command! Yank call system('echo ' . shellescape(@z) . ' | ' . 'yank')
noremap <silent> <leader>y "zy:Yank<CR>
