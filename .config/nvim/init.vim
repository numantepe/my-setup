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

"" New Stuff

" TODO(numan) : might need to add grep stuff?

" NOT USED YET "
"
" nnoremap < ye!grep "<C-R>" .*\\([=]\\)\\([\\(]\\) .*" -n .<CR>
" nnoremap > ye!|grep "<C-R>" ".*" -n .<CR>
" nnoremap <C-L> !grep "<C-R>" ".*" -n .<CR>

" nnoremap // /aaa<CR>
" nnoremap m 0//<Esc>
" nnoremap M 0d2l==

" nnoremap jf <C-W>N

" nnoremap gj wbI(<Esc>ea)<Esc>
" nnoremap gJ wbI(<Esc>ea)<Esc>

" set ttimeoutlen=100
" au FileType gitcommit set tw=72

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

" LSP
" https://github.com/prabirshrestha/vim-lsp
" https://github.com/mattn/vim-lsp-settings
" https://github.com/prabirshrestha/asynccomplete.vim
" https://github.com/keremc/asynccomplete-clang.vim
" https://github.com/prabirshrestha/async.vim

" zip and paste them to ~/.vim/pack/plugins/start

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp'],
        \ })
endif

let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
let g:lsp_document_highlight_enabled = 0
set signcolumn=no



