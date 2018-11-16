" vim configuration
set noswapfile
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/



" execute pathogen#infect()
syntax on
" colorscheme wal
set showcmd
filetype plugin indent off



" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'



set number 
set showcmd showbreak=-|-
set undofile 
set undodir=~/.vim/backup/undo/
set lazyredraw
set linebreak



set wrap
set tabstop=4 shiftwidth=4
set expandtab
set backspace=indent,eol,start
set mouse=r
" set clipboard=autoselect,unnamed,exclude:cons\|linux
" noremap <leader>y "+y
" nmap <leader>y "+y
" imap <leader>y "+y
" noremap <leader>p "+p
"nmap <leader>p "+p
" imap <leader>p "+p


set hlsearch
set incsearch
set ignorecase
set smartcase



nmap <F6> :tabprevious<CR>
map <F6> :tabprevious<CR>
imap <F6> <Esc>:tabprevious<CR>
nmap <F5> :tabnext<CR>
map <F5> :tabnext<CR>
imap <F5> <Esc>:tabnext<CR>
nmap <F8> :tabnew<CR>
map <F8> :tabnew<CR>
imap <F8> <Esc>:tabnew<CR>
nmap <F9> :tabclose<CR>
map <F9> :tabclose<CR>
imap <F9> <Esc>:tabclose<CR>
" nmap <C-n> :NERDTreeToggle<CR>
" map <C-n> :NERDTreeToggle<CR>
" imap <C-n> <Esc>:NERDTreeToggle<CR>
" noremap <leader>h <Esc>:call ToggleHardMode()<CR>
noremap <F12> :set invnumber<CR>



set laststatus=2

set statusline=
set statusline+=%1*\ [%n]
set statusline+=%3*\ [%<%1{getcwd()}]
set statusline+=%5*\ %<%{expand('%')}\ %=
set statusline+=%3*\ [LINE:\ %l/%L]
set statusline+=%1*\ [COL:\ %c]
