call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'


Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" syntax highlighting
Plug 'posva/vim-vue'
Plug 'kevinoid/vim-jsonc'
" Plug 'prettier/vim-prettier'


" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'haishanh/night-owl.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'

call plug#end()

" coc config
let g:coc_global_extensions = [
 \ 'coc-snippets',
 \ 'coc-pairs',
 \ 'coc-tsserver',
 \ 'coc-eslint',
 \ 'coc-prettier',
 \ 'coc-json',
 \ ]
" :CocCommand snippets.editSnippets

" prettier
" command! Prettier CocCommand prettier.formatFile 

set termguicolors
" let ayucolor="light"
" let ayucolor="mirage"
let ayucolor="dark"
colorscheme ayu


syntax on

" editor settings
set scrolloff=8
set smartcase
set nowrap
set number
set relativenumber
set colorcolumn=80

" cursor
set guicursor=n:block
set guicursor+=o-r:hor50
set guicursor+=v:hor10
set guicursor+=i:ver10
set guicursor+=a:blinkon50-blinkoff50

set ignorecase
set nohlsearch
set incsearch

set hidden
set noerrorbells

" text formatting
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set isfname+=@-@

set noswapfile
set nobackup

set cmdheight=3
set updatetime=50

set shortmess+=c

set undodir=~/.vim/undodir
set undofile
set signcolumn=yes

 
let $BASH_ENV = "~/.aliases"

"  let g:airline_theme='one'

""""" REMAPS
let mapleader = " "

" window management
nnoremap <leader>xv :Vex<CR>
nnoremap <leader>xs :Sex<CR>

" source vimrc
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>vrc :e $MYVIMRC<CR>
 
" Navigation
nnoremap <leader>mm :marks<CR>:q
 
" KILL THOSE ARROWS
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
 
" Quick fix list
nnoremap <leader>ql :copen<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" Telescope
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" Command Line
nnoremap <leader>. :!

" CoC Settings
" inoremap <silent><expr> <c-space> coc#refresh()
"
"
"
"
"
" lsp config
" local on_attach = require'completion'.on_attach
" lua require('lspconfig').tsserver.setup{}







