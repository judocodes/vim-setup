let mapleader = "\<Space>"

" window management
nnoremap <leader>xh :Vex<CR>
nnoremap <leader>xv :Sex<CR>
nnoremap <leader>xx :Ex<CR>

" Buffer Navigation
nnoremap <silent><expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent><expr> k (v:count == 0 ? 'gk' : 'k')

" Quick fix navigation
nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprev<CR>

" Show lists
" marks
nnoremap <leader>lm :marks<CR>:q
" quickfix
nnoremap <leader>lq :copen<CR>
" registers
nnoremap <leader>lr :reg<CR>:q
" buffers
 
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
" extend brackets on CR
inoremap <expr> <cr> GetCharacters() ? "<cr><esc>O" : "<cr>"

" searching
nnoremap <leader>hs :set hlsearch!<CR>




" BASIC OPERATIONS
" 

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

" indentation
nnoremap > >gv
nnoremap < <gv



" KILL THOSE ARROWS
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>


