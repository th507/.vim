set nocompatible
set shortmess=aI
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" HTML related
NeoBundle 'sukima/xmledit'
NeoBundle 'mattn/emmet-vim'

" Coffee-script
NeoBundle 'kchmck/vim-coffee-script'
" does not warn about ending line with spaces
NeoBundle 'othree/coffee-check.vim'

" HATML, Sass and SCSS
NeoBundle 'gummesson/companion.vim'
" JavaScript/CSS validator
NeoBundle 'joestelmach/lint.vim'

" fold functions
NeoBundle 'rayburgemeestre/phpfolding.vim'

NeoBundle 'tomasr/molokai'

NeoBundle 'jeetsukumaran/vim-buffergator'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

NeoBundle 'ervandew/supertab'

" maybe this?
"NeoBundle "Valloric/YouCompleteMe"
"NeoBundle 'Shougo/neocomplete.vim'

"NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'

" Fish-shell syntax highlighting
NeoBundle 'dag/vim-fish'

" Github flavored Markdown
NeoBundle "tpope/vim-markdown"
NeoBundle "jtratner/vim-flavored-markdown"

" TaskPaper
NeoBundle "davidoc/taskpaper.vim"
NeoBundle "mattn/calendar-vim"


NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
  \     'mac' : 'make',
  \     'unix' : 'make',
  \    },
  \ }
NeoBundle "Shougo/vimshell.vim"

" Use current directory as vimshell prompt.
" let g:vimshell_prompt_expr =
" \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
" let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

" JS Scope
" NeoBundle 'bigfish/vim-js-context-coloring', {
"   \ 'build' : {
"   \     'mac' : 'npm install --update',
"   \     'unix' : 'npm install --update',
"   \    },
"   \ }
" let g:js_context_colors_enabled = 0
" let g:js_context_colors_usemaps = 0

" why do you aks
NeoBundle 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

NeoBundle "tyok/nerdtree-ack"

" git
NeoBundle "tpope/vim-fugitive"

" i j k l for up, left, down, and right
" h for insert mode
map i <Up>
map j <Left>
map k <Down>
noremap h i

" moving between splits
nnoremap <C-I> <C-W><C-K>
nnoremap <C-K> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-H>

" resize vertically opened splits
nnoremap <C-S><C-J> <C-W><
nnoremap <C-S><C-L> <C-W>>

" change split layout vertical -> horizontal
nnoremap <C-S><C-N> <C-W>t<C-W>H
nnoremap <C-S><C-M> <C-W>t<C-W>K


"nnoremap <C-S-J> :wincmd H

"remove left side scrollbar
set guioptions-=L
set backspace=indent,eol,start

" by default, open buffer below, or to the right
set splitbelow
set splitright


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
" set autochdir


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
let g:SuperTabMappingBackward = '<c-tab>'
let g:SuperTabMappingTabLiteral = '<s-tab>'
let g:SuperTabDefaultCompletionType = "<c-n>"

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

" Toggle fold state between closed and opened.
"
" If there is no fold at current line, just moves forward.
" If it is present, reverse it's state.
function! ToggleFold()
    if foldlevel('.') == 0
    normal! l
    "visual! zf<CR>
    else
        if foldclosed('.') < 0
            . foldclose
        else
            . foldopen
        endif
    endif
    " Clear status line
    echo
endfunction

" Toggle Fold in Normal Mode
noremap <Leader>] :call ToggleFold()<CR>


" There are conflicts with the AutoComplPop script.
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci



" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l

set guifont=Menlo:h14
set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp932,cp936,big5,euc-jp,euc-kr,latin1

set background=dark
colo molokai

au BufRead,BufNewFile *.coffee set ft=coffee
auto Filetype coffee set shiftwidth=4 softtabstop=4 expandtab

let g:coffeeCheckHighlightErrorLine = 1

" setting up xmledit for html file
let g:xmledit_enable_html=1

autocmd Filetype html let g:xml_syntax_folding = 1
autocmd Filetype html set foldmethod=manual

au BufRead,BufNewFile *.taskpapertheme  set ft=xml

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


"lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

" In visual mode, git blame the selection
" function! GitBlame() range
" " look up function-range-example for more information
"     let beg_line = line("'<")
"     let end_line = line("'>")
"     exec '!git blame -L '. beg_line. ','. end_line. ' %'
" endfunction
" vnoremap <leader>g :call GitBlame()<CR>
"  
" " In normal mode, git blame the current line
" nnoremap <leader>g :exec '!git blame -L '. line("."). ','. line("."). ' %'<CR>

" improved upon http://usevim.com/2013/11/29/pollution/
if did_filetype()
  finish
endif
if getline(1) =~# '^#!.*/bin/env\s\+node\>'
  setfiletype javascript
else
    if getline(1) =~# '^#!.*/bin/env\s\+node\>'
        setfiletype coffee
    endif
endif

" KEYMAP

" shorthand for language specific files
cnorea to tabe

cnorea ej e ++enc=japan
cnorea ep e ++enc=prc
cnorea et e ++enc=taiwan


" NERDTree related
let NERDTreeShowBookmarks=1
map <C-Bslash> :NERDTreeTabsToggle<CR>
vnoremap <silent><C-Bslash> <C-C>:NERDTreeTabsToggle<CR>
inoremap <silent><C-Bslash> <C-O>:NERDTreeTabsToggle<CR>

" bufferlist
let g:BufferListWidth = 25
let g:BufferListMaxWidth = 50
"map <Leader><Leader> :BuffergatorToggle<CR>
"vnoremap <silent><Leader><Leader> <C-C>:BuffergatorToggle<CR>
"inoremap <silent><Leader><Leader> <C-O>:BuffergatorToggle<CR>

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
