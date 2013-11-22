set nocompatible
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

"remove left side scrollbar
set guioptions-=L
set backspace=indent,eol,start

" by default, open buffer below, or to the right
set splitbelow
set splitright

" setting up xmledit for html file
let g:xmledit_enable_html=1

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
"let g:SuperTabMappingBackward = '<s-tab>'

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
let g:SuperTabDefaultCompletionType = "<c-n>"

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



"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"let g:neocomplete#enable_ignore_case = 0
"let g:neocomplete#enable_smart_case  = 1
"let g:neocomplete#enable_fuzzy_completion = 0

" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"    \ }

" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  " return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y> neocomplete#close_popup()
"inoremap <expr><C-e> neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :
""

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'






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


" In visual mode, git blame the selection
function! GitBlame() range
" look up function-range-example for more information
    let beg_line = line("'<")
    let end_line = line("'>")
    exec '!git blame -L '. beg_line. ','. end_line. ' %'
endfunction
vnoremap <leader>g :call GitBlame()<CR>
 
" In normal mode, git blame the current line
nnoremap <leader>g :exec '!git blame -L '. line("."). ','. line("."). ' %'<CR>


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
