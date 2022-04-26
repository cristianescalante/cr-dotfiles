" 2020-04-05


" Configurações específicas por OS
let uname = substitute(system('uname'), '\n', '', '')
" Example values: Linux, Darwin, MINGW64_NT-10.0, MINGW32_NT-6.1

if uname == 'Linux' || uname == 'Darwin'
    set rtp+=~/.vim/bundle/Vundle.vim
    set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h11
    " set guifont=Roboto\ Mono\ Medium\ for\ Powerline:h12
    " set guifont=Inconsolata-dz\ for\ Powerline:h12
    set backupdir=~/.vimtmp
    set directory=.,~/.vimtmp
    set undofile
    set undodir=~/.vimtmp
    set paste
else " windows
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set rtp+=%HOME%/.vim/vimfiles/bundle/Vundle.vim/
    set guifont=Inconsolata\ for\ Powerline:h10
    "set guifont=Fira\ Mono\ for\ Powerline:h10
    set guioptions-=T
    set backupdir=%HOME%\vimtemp\
    set directory=%HOME%\vimtemp\
    set undodir=%HOME%\vimtemp

endif

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=60 columns=120
else
  " This is console Vim.
  if exists("+lines")
    set lines=25
  endif
  if exists("+columns")
    set columns=60
  endif
endif

" Copy current buffer path relative to root of VIM session to system clipboard
nnoremap <Leader>yp :let @*=expand("%")<cr>:echo "Copied file path to clipboard"<cr>

" Copy current filename to system clipboard
nnoremap <Leader>yf :let @*=expand("%:t")<cr>:echo "Copied file name to clipboard"<cr>

" Copy current buffer path without filename to system clipboard
nnoremap <Leader>yd :let @*=expand("%:h")<cr>:echo "Copied file directory to clipboard"<cr>

" Copy path to clipboard
nnoremap <F2> :let @*=substitute(expand("%:p"), "/", "\\", "g")


noremap <silent> [A <C-Y>
noremap <silent> [B <C-E>


set number
set showmatch
set showmode
set ruler
set nosmarttab
set shiftwidth=4
set tabstop=4
" set expandtab
set nocompatible
set autoindent
set nowrap
set smartcase " se quiser busca com upper, escreva em upper
" set nobackup
" set nowritebackup
set mouse=a
set clipboard=unnamed
set noshowmode
set hlsearch    " Destaca todos os matchs
"set encoding=utf-8
set relativenumber
" Desabilitar flash e bips
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set textwidth=80
set colorcolumn=+1
" Always use vertical diffs
set diffopt+=vertical
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" set shell=C:\bin\cmder\cmder.exe
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

filetype on
filetype indent on
filetype plugin on
set laststatus=2
let mapleader = ","


" Python
let python_highlight_all=1
syntax on

" Python - To add the proper PEP 6 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=2
    \ softtabstop=4
    \ shiftwidth=6
    \ textwidth=67
    \ expandtab
    \ autoindent
    \ fileformat=unix


"   Destaca os espaços em branco desnecessários 
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h syntax match BadWhitespace "/\s\+$/"

"" Python autocomplete - configurações adicionais
""    Ensures that the auto-complete window goes away when you’re done with it
" let g:ycm_autoclose_preview_window_after_completion=1
""   Defines a shortcut for goto definition
""   My leader key is mapped to space, so space-g will goto definition of whatever I’m currently on.
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>




:exec 'set viminfo=%,' . &viminfo

" command! -nargs=1 -bang -complete=custom,<SID>PathComplete FindInPath
"           \ :find<bang> <args>
"     function! s:PathComplete(ArgLead, CmdLine, CursorPos)
"       return UserFileComplete(a:ArgLead, a:CmdLine, a:CursorPos, 1, &path)
"     endfunction


" Split navigations (torna o W desnecessário)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" FOLDING ------------------------------ 
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" Try this if you want to see the docstrings for folded code:
let g:SimpylFold_docstring_preview=1
" Salva e carrega folds
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview


" Linha de status simples em lugar do "Airline"
" set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
" set statusline=%F%m%r%h%w\ [Formato=%{&ff}]\ [Tipo=%Y]\ [Ascii=\%03.3b]\ [Hex=\%02.2B]\ [Posicao=%04l,%04v][%p%%]\ [Tamanho=%L\ linhas]
" set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [Ascii=\%03.3b]\ [Hex=\%02.2B]\ [%04l,%04v][%p%%]\ [%L\ linhas]

" Ocultar/Mostrar Blocos conforme o tab
" set foldmethod=indent " ocultar/mostrar codigo baseado em recuo
" set foldcolumn=0 " coluna cinza que aparece a esquerda do vim (nao sei pra que serve, me ajudem a descobrir :D)
" set foldlevel=0 " esconder código a partir do caractere 0 de acordo com o recuo


" ======================
" Configuração do Vundle
" ======================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Automatiza o uso de folder utilizando a identação
Plugin 'tmhedberg/SimpylFold'

" Trata a indentação conforme PEP8
"Plugin 'vim-scripts/indentpython.vim'

" Python autocomplete. Depende de compilar o plugin externo
" Plugin 'Valloric/YouCompleteMe'

" Syntax highlight
Plugin 'vim-syntastic/syntastic'
" Syntax para PEP8
Plugin 'nvie/vim-flake8'

Plugin 'tpope/vim-surround'                 " git wrapper
Plugin 'itchyny/lightline.vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'bling/vim-bufferline'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'neilagabriel/vim-geeknote'
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'mbbill/undotree'
" Plugin 'mhinz/vim-startify'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rizzatti/dash.vim'
Plugin 'sirver/ultisnips'
" Plugin 'honza/vim-snippets'
Plugin 'tmhedberg/matchit'
" Plugin 'wakatime/vim-wakatime'
" Colorschemes
" Terminal
Plugin 'altercation/vim-colors-solarized'
Plugin 'challenger-deep-theme/vim'
Plugin 'cocopon/iceberg.vim'
" Plugin 'dracula/vim'
Plugin 'haishanh/night-owl.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'nanotech/jellybeans.vim'
Plugin 'rakr/vim-one'
Plugin 'sainnhe/gruvbox-material'
Plugin 'srcery-colors/srcery-vim'
Plugin 'toupeira/vim-desertink'
Plugin 'color-codes-SQL-keywords-from-Oracle-11g'

" Caracter coercion - [crt] : Iniciais em maiusculo
" Substitution multiple cases
Plugin 'tpope/vim-abolish'

" Light & Dark color schemes for terminal and graphic Inspired by Google's Material Design 
Plugin 'NLKNguyen/papercolor-theme'

" Navegação de arquivos
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
" Navegação de Tags
" Plugin 'yegappan/taglist'
" Plugin 'preservim/tagbar'
" Uso de TABS
Plugin 'jistr/vim-nerdtree-tabs'
" Integração do NERD com o Git
Plugin 'Xuyuanp/nerdtree-git-plugin'


" Pesquisa - CRTL + P
Plugin 'ctrlpvim/ctrlp.vim'

" Git Integration
Plugin 'tpope/vim-fugitive'

" Destaque de sintaxe
Plugin 'sheerun/vim-polyglot'

" Tab list panel
Plugin 'kien/tabman.vim'
" <leader>mt or run :TMToggle
" <leader>mf or run :TMFocus

" Linha de status
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugin 'powerline/fonts'


Plugin 'L9'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plugin 'git://git.wincent.com/command-t.git'
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Markdown / Writting
" Markdown - https://vimawesome.com/plugin/markdown-syntax
Plugin 'LanguageTool'
Plugin 'ajorgensen/vim-markdown-toc'
Plugin 'godlygeek/tabular'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'plasticboy/vim-markdown'
Plugin 'reedes/vim-pencil'
 

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

"
" NERDTree - Ignora alguns tipos de arquivos
let NERDTreeIgnore=['\.pyc$', '\~$', '\.DAT', '\.ini', '\.pol', '\AppData' 
            \ , '\Ambiente de Impressão', '\Ambiente de Rede', '\Cookies', '\Dados de Aplicativos'
            \ , '\Desktop', '\Configurações Locais', '\IntelGraphicsProfiles'
            \ , '\Links', '\Menu Iniciar', '\Modelos', '\Recent', '\SendTo'
            \ , '\Meus Documentos', '\Box', '\bin'
            \ , '\vimtemp', '\.kdb'] " Ignore files in NERDTree
let NERDTreeShowBookmarks=1
let Tlist_Close_On_Select=1
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=1
let NERDTreeHijackNetrw=0 " 
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
" let NERDTreeDirArrowExpandable = '?'
" let NERDTreeDirArrowCollapsible = '?'
map <F3> :NERDTreeToggle<CR>
" map <F7> :TlistToggle<CR>
map <F8> ::TagbarToggle<CR>


" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if has('gui_running')
    set background=dark
    " colorscheme papercolor
    " colorscheme challenger_deep
    " colorscheme desertink
    colorscheme srcery
else
    set background=dark
endif

" Alterna entre o Dark e Light theme do Solarized
call togglebg#map("<F5>")

syntax enable
" let g:solarized_termcolors=256
" colorscheme ron
" colorscheme solarized
" colorscheme dracula
" colorscheme industry
" colorscheme iceberg " cocopon/iceberg.vim
" colorscheme monokai
" colorscheme one "rakr/vim-one
" colorscheme challenger_deep "challenger-deep-theme/vim
" colorscheme jellybeans "nanotech/jellybeans.vim
" colorscheme desertink.vim "toupeira/vim-desertink
" coloscheme gruvbox-material "sainnhe/gruvbox-material
    " For better syntax highlighting support, please install sheerun/vim-polyglot
" colorscheme space-vim-dark "liuchengxu/space-vim-dark
" colorscheme srcery "srcery-colors/srcery-vim
" colorscheme night-owl.vim "haishanh/night-owl.vim


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
"
" =========================================
" Put your non-Plugin stuff after this line
" =========================================
"

" Substituido pelo Lighline
" Airline
" let g:airline_section_b = '%{strftime("%c")}'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
"  let g:airline_powerline_fonts = 1
"  let g:Powerline_symbols = 'unicode' 
"  " let g:airline_theme='base16'
"  let g:airline_theme='wombat'
"  
"  if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"  endif
"  
" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = 'Ɇ'
" let g:airline_symbols.whitespace = 'Ξ'
"  
"  " powerline symbols
"  let g:airline_left_sep = ''
"  let g:airline_left_alt_sep = ''
"  let g:airline_right_sep = ''
"  let g:airline_right_alt_sep = ''
"  let g:airline_symbols.branch = ''
"  let g:airline_symbols.readonly = ''
"  let g:airline_symbols.linenr = '☰'
"  let g:airline_symbols.maxlinenr = ''
"  let g:airline_symbols.dirty='⚡'

" " BufferLine
" let g:bufferline_active_buffer_left = '['
" let g:bufferline_active_buffer_right = ']'
" let g:bufferline_inactive_highlight = 'StatusLineNC'




" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" turn to next or previous errors, after open errors list
nmap <leader>n :lnext<CR>
nmap <leader>p :lprevious<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" syntastic checker for javascript.
" eslint is the only tool support JSX.
" If you don't need write JSX, you can use jshint.
" And eslint is slow, but not a hindrance
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'


" Markdown 
set conceallevel=2
" Latex
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" O Plugin do markdown cria uma janela de navegação com :Toc, apenas para
" navegação.
"
" Markdown TOC ---------------------------
" Para gerar o TOC  :GenerateMarkdownTOC
" Gera o item pai (H1)
let g:mdtoc_starting_header_level = 1

" Crtl P ---------------------------------

map <C-b> :CtrlPBuffer<CR>

if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

"  " Set no max file limit
"  let g:ctrlp_max_files = 0
"  " Search from current directory instead of project root
"  let g:ctrlp_working_path_mode = 0
"  
"  " Ignore these directories
"  set wildignore+=*/out/**
"  set wildignore+=*/vendor/**
"  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"  
"  " Search in certain directories a large project (hardcoded for now)
"  cnoremap %proj <c-r>=expand('~/Projects/some-project')<cr>
"  " ga = go api
"  map <Leader>ga :CtrlP %proj/api/<cr>
"  " gf = go frontend
"  map <Leader>gf :CtrlP %proj/some/long/path/to/frontend/code/<cr>




" fu! VimSQL()
"     nnoremap <C-K> :<C-U> exe "let linenum=".v:count<CR>:1,$-1d<CR><C-W>j:exe linenum."y"<CR><C-W>kP
"     let linenum=line("$")
"     1,$-1w! >> .sqlplus.history
"     e .sqlplus.history
"     execute ":$-".(linenum-1).",$m0"
"     "%!uniq
"     if line("$")>100
"       101,$d
"     endif
"     b#
"     set splitbelow
"     sp .sqlplus.history
"     au! BufEnter afiedt.buf
" endf
"au BufEnter afiedt.buf call VimSQL() 


"  But wait—what is the nnoremap thing? 
"  In a nutshell, nnoremap remaps one key combination to another. 
"  The no part means remap the key in normal mode as opposed to visual mode. 
"  Basically, nnoremap <C-J> <C-W><C-j> says, in normal mode when I hit <C-J>, do <C-W><C-j> instead.

