syntax on
hi Visual term=NONE ctermbg=DarkGrey
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
set nu
hi LineNR term=bold cterm=NONE ctermfg=237 ctermbg=235
set nuw=6
set noshowmode
if !has('nvim')
        set ttymouse=xterm2
endif
if has('nvim')
        tnoremap <Esc> <C-\><C-n>
endif
if exists(':tnoremap')
        tnoremap <Esc> <C-\><C-n>
endif
" Ctrl+S Save Files
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
" let mapleader = ","
" Ctrl+Esc quit without saving
noremap <Esc>q :q!<CR>
" Shift+Esc save & quit
noremap <Esc>w :wq!<CR>

set encoding=utf-8
scriptencoding utf-8

if has("autocmd")
    autocmd BufRead *.sql set filetype=mysql      
endif

" BuffExplorer hotkeys
nmap <C-F5> <Esc>:BufExplorer<cr>
vmap <C-F5> <esc>:BufExplorer<cr>
imap <C-F5> <esc>:BufExplorer<cr>

" F6 - prev buff
nmap <C-F6> :bp<cr>
vmap <C-F6> <esc>:bp<cr>i
imap <C-F6> <esc>:bp<cr>i

" F7 - next buff
nmap <C-F7> :bn<cr>
vmap <C-F7> <esc>:bn<cr>i
imap <C-F7> <esc>:bn<cr>i

" NerdTree hotkeys
let g:NERDTreeWinPos = "right"
" NeoBundle

 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
 NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
 NeoBundle 'moll/vim-node'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'leafgarland/typescript-vim'
 NeoBundle 'Valloric/YouCompleteMe'
 NeoBundle 'SirVer/ultisnips'
 NeoBundle 'honza/vim-snippets'
 NeoBundle 'wavded/vim-stylus'
 NeoBundle 'digitaltoad/vim-jade'
 NeoBundle 'itchyny/lightline.vim'
 NeoBundle 'miyakogi/conoline.vim'
 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
 autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
 autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif


 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <F2> :NERDTreeToggle<CR>
" HI Line
 let g:conoline_auto_enable = 1
 let g:conoline_use_colorscheme_default_normal=0
 let g:conoline_use_colorscheme_default_insert=0
 set background=light
 let g:conoline_color_normal_light= 'ctermbg=236'
 let g:conoline_color_normal_nr_light = 'ctermbg=234 ctermfg=blue'
 let g:conoline_color_insert_light= 'ctermbg=234'
 let g:conoline_color_insert_nr_light = 'ctermbg=232 ctermfg=green'
" Snippets

 let g:UltiSnipsExpandTrigger="<c-e>"
 let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"
" PowerLine
 let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "|" }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "REON"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
