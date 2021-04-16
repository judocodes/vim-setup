call plug#begin('~/.vim/plugged')

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Debugging
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'colepeters/spacemacs-theme.vim'

" Autocomplete
"Plug 'Valloric/YouCompleteMe'

" More stuff
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'

" Nerdtree
"Plug 'preservim/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'preservim/nerdcommenter'
"Plug 'PhilRunninger/nerdtree-buffer-ops'
"Plug 'ryanoasis/vim-devicons'

" CSS
Plug 'ap/vim-css-color'

" syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'posva/vim-vue'
Plug 'kevinoid/vim-jsonc'
" Plug 'yuezk/vim-js'

" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'haishanh/night-owl.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'sonph/onehalf', {'rtp': 'vim'}

" JSDOC
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx', 'typescript'] ,
  \ 'do': 'make install'
\}

call plug#end()










""" CONFIG
" telescope
lua require('custom')

" emmet
let g:user_emmet_install_global = 0
augroup emmet
  autocmd!
  autocmd Filetype html,css,vue EmmetInstall
augroup END
let g:user_emmet_leader_key='<tab>'

" Debug config
let g:vimspector_install_gadgets = ['vscode-node-debug2', 'debugpy', 'local-lua-debugger-vscode', 'debugger-for-chrome']
fun! GotoWindow(id)
  call win_gotoid(a:id)
endfun

" coc config
let g:coc_global_extensions = [
 \ 'coc-snippets',
 \ 'coc-pairs',
 \ 'coc-tsserver',
 \ 'coc-eslint',
 \ 'coc-prettier',
 \ 'coc-json',
 \ 'coc-yaml',
 \ 'coc-styled-components',
 \ 'coc-vetur',
 \ ]
" :CocCommand snippets.editSnippets

" prettier
" command! Prettier CocCommand prettier.formatFile 

" source bash config
let $BASH_ENV = "~/.aliases"

" NerdTreeIgnore
let g:NERDTreeIgnore = ['^node_modules$']

" NerdTree Commenter
let g:NERDCreateDefaultMappings = 1

" Vim Airline + Devicons
let g:airline_powerline_fonts = 1

" Vue highlighting
" let g:vue_pre_processors = ['pug', 'scss']


" FUNCTIONS

function! <SID>SynStack()
  if !exists("*synstack")
    echo 'No synstack'
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" show highlight group
nmap <leader>hlg :call <SID>SynStack()<CR>















""" STYLES



fun! CustomizeTheme(theme) abort
  highlight htmlArg gui=italic,bold cterm=italic,bold
  highlight Comment gui=italic cterm=italic

  if a:theme == 'dark'
    " hardcoded links to gruvbox theme
    highlight jsFunction gui=italic cterm=italic ctermfg=108 guifg=#8ec07c
    highlight Type cterm=italic,bold gui=italic,bold 
    highlight! link Type GruvboxYellow
    highlight! link jsObjectKey None
    highlight! link jsObjectShorthandProp GruvboxAqua

  elseif a:theme == 'light'
    highlight Type cterm=italic,bold gui=italic,bold 
    highlight jsFunction gui=italic cterm=italic 
    highlight! link jsFunction Number
    highlight! link jsFuncCall Special
    highlight! link jsonKeyword StorageClass
    highlight! link jsonString String 
    highlight! link jsObjectShorthandProp Special
    highlight! link jsObjectProp Exception
    highlight! link jsOperatorKeyword Exception
  endif
endfun

fun! DarkScheme()
  set background=dark
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_invert_selection='0'

  colorscheme gruvbox

  highlight ColorColumn ctermbg=0 guibg=#333333
  highlight LineNr guifg=#555555
  
  " italics
  let g:gruvbox_italic='1'
  call CustomizeTheme('dark')
endfun

fun! LightScheme() 
  set background=light
  colorscheme ayu

  let g:airline_theme='onehalflight'
  highlight Normal guibg=#ffffff ctermbg=white ctermfg=white
  highlight ColorColumn ctermbg=0 guibg=#f3f3f3
  highlight LineNr guifg=#d5d5d5

  call CustomizeTheme('light')
endfun

set termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let ayucolor="light"
call DarkScheme()





""" Matching Parentheses
let g:rainbow_active = 0
" toggle with :RainbowToggle




""" SETS

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



 




""""" REMAPS

let mapleader = " "

" window management
nnoremap <leader>xh :Vex<CR>
nnoremap <leader>xv :Sex<CR>
nnoremap <leader>xx :Ex<CR>
nnoremap <leader>m :MaximizerToggle!<CR>


" Buffer Navigation
nnoremap <silent><expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent><expr> k (v:count == 0 ? 'gk' : 'k')




" Utils
" source vimrc
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
" open vimrc
nnoremap <leader>vrc :e $MYVIMRC<CR>
" Command Line
nnoremap <leader>. :!

" open brackets on enter 
fun! GetCharacters() abort
  let l:pairs = getline(".")[col(".")-2:col(".")-1] 
  if pairs == "{}"
    return 1
  elseif pairs == "[]" 
    return 1
  elseif pairs == "()"
    return 1
  elseif pairs == "><"
    return 1
  elseif pairs == "``"
    return 1
  else
    return 0
  endif
endfun
inoremap <expr> <cr> GetCharacters() ? "<cr><esc>O" : "<cr>"


" Lists
" marks
nnoremap <leader>lm :marks<CR>:q
" quickfix
nnoremap <leader>lq :copen<CR>
" registers
nnoremap <leader>lr :reg<CR>:q
" buffers
 

 
" Quick fix navigation
nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprev<CR>

" searching
nnoremap <leader>hs :set hlsearch!<CR>




" Telescope

" open and grep
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>

" CoC remaps

" edit snippets
nmap <leader>sn :CocCommand snippets.editSnippets<CR>
" go to definition
nmap <silent> <leader>gd <Plug>(coc-definition)
" go to type definition
nmap <silent> <leader>gt <Plug>(coc-type-definition)
" go to implementation
nmap <silent> <leader>gi <Plug>(coc-implementation)
" go to references
nmap <silent> <leader>gr <Plug>(coc-references)



" NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeFocus<CR>



" Yanking and Deleting remaps
"    "+ yanks into macOS copy register
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" yank the whole file into + register
nnoremap <leader>Y gg"+yG
" delete marked word without putting it to current register
vnoremap <leader>p "_dP
" paste from clipboard
nnoremap <leader>cp "+p
" delete a whole block
nnoremap <leader>db 0f{V%d
" highlight a whole block
nnoremap <leader>vb 0f{V%
" yank a whole block
nnoremap <leader>yb 0f{V%y



"colorschemes
nnoremap <leader>csd :call DarkScheme()<CR>
nnoremap <leader>csl :call LightScheme()<CR>



" Git
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gs :G<CR>5j
nnoremap <leader>ga :G add
nnoremap <leader>gc :G commit -m "
nnoremap <leader>gp :G push 
" note: dv on Git Status file to open merge resolver

" KILL THOSE ARROWS
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>






" Debugger
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>drs :call vimspector#Reset()<CR>
nnoremap <leader>dcl :call vimspector#ClearBreakpoints()<CR>

" Debugger Windows
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>

" Debugger Navigation
nmap <leader>dl :call vimspector#StepInto()<CR>
nmap <leader>dj :call vimspector#StepOver()<CR>
nmap <leader>dk :call vimspector#StepOut()<CR>
nmap <leader>d_ :call vimspector#Restart()<CR>
nmap <leader>dp :call vimspector#Pause()<CR>
nnoremap <leader>d<space> :call vimspector#Continue()<CR>
nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>
nmap <leader>drc <Plug>VimspectorRunToCursor

" Debugger Info
nmap <leader>di <Plug>VimspectorBallonEval
vmap <leader>di <Plug>VimspectorBallonEval

"more stuff
" winbar - there are mappings for :VimspectorShowOutput and :VimspectorReset
" prompt buffers - should work in nightly, otherwise :VimspectorEval &
" :VimspectorWatch

" Breakpoints
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint








" AU GROUPS

augroup highlight_yank 
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END


augroup disable_css_colors_vue
  autocmd!
  autocmd FileType vue silent! call css_color#disable()
augroup END













  
