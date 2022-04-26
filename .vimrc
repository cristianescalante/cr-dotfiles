set nocompatible
set runtimepath+=~/.vim

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
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
map ,co O#<ESC>100A=<ESC>100\|D<CR>i#<CR><ESC>i##<ESC>100a=<ESC>100\|D<ESC>kA

" nnoremap <F2> :let @*=substitute(expand("%:p"), "/", "\\", "g")
nnoremap <F2> :let @*=expand("%:.")<CR>


set showmatch
set showmode
set ruler
set shiftwidth=4
set tabstop=4
set expandtab
set nocompatible
set autoindent
set guifont=Lucida_Console:h9:cANSI
set nowrap
set nobackup
set nowritebackup
set backupdir=~/vim/
set background=dark
colorscheme ron



:exec 'set viminfo=%,' . &viminfo

command! -nargs=1 -bang -complete=custom,<SID>PathComplete FindInPath
          \ :find<bang> <args>
    function! s:PathComplete(ArgLead, CmdLine, CursorPos)
      return UserFileComplete(a:ArgLead, a:CmdLine, a:CursorPos, 1, &path)
    endfunction


fu! VimSQL()
    nnoremap <C-K> :<C-U> exe "let linenum=".v:count<CR>:1,$-1d<CR><C-W>j:exe linenum."y"<CR><C-W>kP
    let linenum=line("$")
    1,$-1w! >> .sqlplus.history
    e .sqlplus.history
    execute ":$-".(linenum-1).",$m0"
    "%!uniq
    if line("$")>100
      101,$d
    endif
    b#
    set splitbelow
    sp .sqlplus.history
    au! BufEnter afiedt.buf
endf
"au BufEnter afiedt.buf call VimSQL()

" Salva e carrega folds
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

"
""
filetype on
filetype indent on
filetype plugin on
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [Ascii=\%03.3b]\ [Hex=\%02.2B]\ [%04l,%04v][%p%%]\ [%L\ linhas]

