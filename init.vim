source $HOME/.config/nvim/modules/plugins.vim
source $HOME/.config/nvim/settings/sets.vim
source $HOME/.config/nvim/themes/themes.vim
source $HOME/.config/nvim/modules/basic-remaps.vim







""" STYLES





""" CONFIG
" telescope
lua require('custom')



" LSP's
lua << EOF
require('lspconfig').tsserver.setup{}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

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



















""" Matching Parentheses
let g:rainbow_active = 0
" toggle with :RainbowToggle







 




""""" REMAPS

nnoremap <leader>m :MaximizerToggle!<CR>

" Telescope

" open and grep
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>

" CoC remaps

" edit snippets
"nmap <leader>sn :CocCommand snippets.editSnippets<CR>
" go to definition
"nmap <silent> <leader>gd <Plug>(coc-definition)
" go to type definition
"nmap <silent> <leader>gt <Plug>(coc-type-definition)
" go to implementation
"nmap <silent> <leader>gi <Plug>(coc-implementation)
" go to references
"nmap <silent> <leader>gr <Plug>(coc-references)

" LSP remaps
nmap <silent> <leader>gd :lua vim.lsp.buf.definition()<CR>
nmap <silent> <leader>gD :lua vim.lsp.buf.declaration()<CR>
nmap <silent> <leader>gr :lua vim.lsp.buf.references()<CR>
nmap <silent> <leader>gt :lua vim.lsp.buf.type_definition()<CR>
nmap <silent> <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>


" NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeFocus<CR>




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



" Prettier
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.vue lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)








  
