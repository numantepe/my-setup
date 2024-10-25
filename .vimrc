imap jj <Esc>

set ttymouse=xterm2
set mouse+=a

autocmd BufEnter * if &buftype != 'terminal' | lcd %:p:h | endif 

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
set number relativenumber

set noundofile
set noswapfile
set nobackup

set hlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set expandtab

set tags=tags;~

nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz

nnoremap L :tabn<CR>
nnoremap H :tabp<CR>
nnoremap N :tab split<CR>

tnoremap <leader>n <C-\><C-N>
nnoremap <leader>t :tab terminal<CR>

nnoremap < ye:!grep "<C-R>" *\(\(=[^=]\)\\|{\)\(\(\)\)" -i -n .<CR>
nnoremap > ye:!grep "<C-R>" "" -i -n .<CR>
nnoremap <C-L> :!grep "<C-R>" "" -i -n .<CR>

function! Yank(text) abort
  let escape = system('yank', a:text)
  if v:shell_error
    echoerr escape
  else
    call writefile([escape], '/dev/tty', 'b')
  endif
endfunction
noremap <silent> <Leader>y y:<C-U>call Yank(@0)<CR>

function! CopyYank() abort
  call Yank(join(v:event.regcontents, "\n"))
endfunction
autocmd TextYankPost * call CopyYank()

call plug#begin()
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'keremc/asyncomplete-clang.vim'
call plug#end()

let g:lsp_diagnostics_enabled = 0 
let g:lsp_document_highlight_enabled = 0
set signcolumn=no

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
