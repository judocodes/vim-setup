" editor settings
set scrolloff=8
set wrap
set number
set relativenumber
set colorcolumn=80
set signcolumn=yes
set cmdheight=3
set guifont=Operator_Mono:h14
set formatoptions-=ro

" cursor
set guicursor=n:block
set guicursor+=o-r:hor50
set guicursor+=v:hor10
set guicursor+=i:ver10
set guicursor+=a:blinkon50-blinkoff50

set nohlsearch
set incsearch
" set smartcase
set ignorecase

set hidden
set noerrorbells

" text formatting
set tabstop=2 softtabstop=2
set smarttab
set shiftwidth=2
set expandtab
set cindent

" adds these characters to 'filename searches'
set isfname+=@-@

" buffer management
set noswapfile
set nobackup
set updatetime=50
set undodir=~/.vim/undodir
set undofile

" don't give |ins-completion-menu| messages.
set shortmess+=c


