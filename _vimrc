"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
set backspace=eol,start,indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nrformats=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set history=200
set sc
set clipboard=unnamed
set fdm=indent
cnoremap <expr> %% getcmdtype()==':'?expand('%:h').'/':'%%' 
set magic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Window setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme grb256
set guifont=Microsoft_YaHei_Mono:h14:cANSI
set gfw=Microsoft_YaHei_Mono:h13:cGB2312
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T
set gcr=a:blinkon0
set ruler
set number
set cursorline
set hlsearch
:hi Folded guibg=black guifg=grey40 ctermfg=grey ctermbg=darkgrey
:hi FoldColumn guibg=black guifg=grey20 ctermfg=4 ctermbg=7
set wildmenu
set noerrorbells
set novisualbell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keyboard Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
	let temp=@s
	norm! gv"sy
	let @/='\v' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags
set tags=tags;
set autochdir
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth=20
" NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" Taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:NERDTree_title='NERD Tree'  
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
function! NERDTree_IsValid()  
    return 1  
endfunction 
let g:winManagerWindowLayout='NERDTree|TagList'
nmap wm :WMToggle<cr>:q<cr>
" Header
let g:miniBufExplMapWindowNavVim = 1
" Jedi-vim
" let g:jedi#auto_initialization = 0
" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-n>'
let g:multi_cursor_quit_key='<C-l>'
" nerdcommenter
let g:NERDSpaceDelims = 0
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" Vundle
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
Bundle 'davidhalter/jedi-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'winmanager'
Plugin 'minibufexpl.vim'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()
