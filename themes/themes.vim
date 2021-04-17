set termguicolors

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

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
  let g:ayucolor="light"
  colorscheme ayu

  let g:airline_theme='onehalflight'
  highlight Normal guibg=#ffffff ctermbg=white ctermfg=white
  highlight ColorColumn ctermbg=0 guibg=#f3f3f3
  highlight LineNr guifg=#d5d5d5

  call CustomizeTheme('light')
endfun


call DarkScheme()

