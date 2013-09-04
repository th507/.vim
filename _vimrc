set nocompatible
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'sukima/xmledit'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'othree/coffee-check.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'tpope/vim-surround'
NeoBundle 'joestelmach/lint.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'dag/vim-fish'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'
" on rare occasion we might as well run installer manually
"NeoBundleCheck

"remove left side scrollbar
set guioptions-=L

syntax on
filetype plugin indent on

set noswapfile
set nobackup

set tabstop=4
set shiftwidth=4
set softtabstop=4
" tab
set smarttab
set expandtab
set autoindent

" display the current mode in the status line:
set showmode

" Check the first five lines in a file for vim
set modelines=5

set nu
" Always show current position
set ruler

" show matching brackets
set showmatch
" How many tenths of a second to blink matching brackets for
set matchtime=1


" Set to auto read when a file is changed from the outside
set autoread
" Set to the current folder
set autochdir


"To search for a word under the cursor from the current cursor position to the
"end of the file, press the shift key and click on the word using the left
"mouse button.  To search in the opposite direction, press the shift key and
"click on the word using the the right mouse button.
set mousemodel=extend

" Switch on search pattern highlighting.
set hlsearch
" make search queries case-insensitive, unless they contain upper-case letters
set ignorecase 
" on keyword completion while 'ignorecase' is on, the case of the match is
" adjusted with context.
set infercase

" wildmenu: command-line completion operates in an enhanced mode
" " wildignore: A file that matches with one of these patterns is ignored when
" completing file or directory names.
set wildmenu
set wildmode=list:longest
set wildignore=*.bak,*.toc,*.out,*.log,*.aux,*.out,*~

" supertab
let g:SuperTabMappingBackward = '<s-tab>'

set complete=.,w,b,u,t
"set complete=.
set completeopt=menu,preview

" Map all keys to Auto complete
let letter = "a"
if len(letter) == 1
    while letter <= "z"
        execute "imap " letter letter . "<C-n><C-p>"
        let letter = nr2char(char2nr(letter)+1)
    endwhile
endif

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l

set guifont=Menlo:h14
set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp932,cp936,big5,euc-jp,euc-kr,latin1

set background=dark
colo molokai

au BufRead,BufNewFile *.coffee set ft=coffee
let g:coffeeCheckHighlightErrorLine = 1
autocmd Filetype html let g:xml_syntax_folding = 1
autocmd Filetype html set foldmethod=syntax

" NERDTree related
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:NERDTreeWinPos = "right"
" end of NERDTree related

" Fix terminal timeout when pressing escape
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set laststatus=2 " Always display the statusline in all windows

" KEYMAP

" shorthand for language specific files
cnorea to tabe

cnorea ej e ++enc=japan
cnorea ep e ++enc=prc
cnorea et e ++enc=taiwan


" NERDTree related
map <D-Bslash> :NERDTreeTabsToggle<CR>
vnoremap <silent><D-Bslash> <C-C>:NERDTreeTabsToggle<CR>
inoremap <silent><D-Bslash> <C-O>:NERDTreeTabsToggle<CR>

" bufferlist
let g:BufferListWidth = 25
let g:BufferListMaxWidth = 50
map <Leader><Leader> :BuffergatorToggle<CR>
vnoremap <silent><Leader><Leader> <C-C>:BuffergatorToggle<CR>
inoremap <silent><Leader><Leader> <C-O>:BuffergatorToggle<CR>

"nmap <leader><left>   :leftabove  vnew<CR>
"nmap <leader><right>  :rightbelow vnew<CR>
"nmap <leader><up>     :leftabove  new<CR>
"nmap <leader><down>   :rightbelow new<CR>

" tab new
map <D-t> :tabnew<CR>
vnoremap <silent><D-t> <C-C>:tabnew<CR>
inoremap <silent><D-t> <C-O>:tabnew<CR>

" Re-indent the code
map <C-p><C-i> :normal ggVG=<CR>

" END OF KEYMAP
"
iab xtime <C-R>=strftime("%m/%d/%y %H:%M:%S")<CR>
iab xfulltime <C-R>=strftime("%a %d %b %Y %I:%M:%S %p")<CR>
iab xdate <C-R>=strftime("%b %d, %Y")<CR>
iab xdatestamp <C-R>=strftime("%m,%d,%Y")<CR>
iab xfile <C-R>=expand("%:t:r")<CR>
