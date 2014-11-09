set nocompatible
set shortmess=aI
" don't beep
set visualbell
set noerrorbells

" more redraws
set ttyfast

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if has("gui_running")
    set lines=50 columns=90
endif

call neobundle#begin(expand('~/.vim/bundle/'))
call neobundle#end()

NeoBundle 'rizzatti/dash.vim'
map <Leader>d :Dash<CR>


" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" HTML related
NeoBundle 'sukima/xmledit'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'moll/vim-node'

" Expose
NeoBundle 't9md/vim-choosewin'
" if you want to use overlay feature
let g:choosewin_overlay_enable = 1
" invoke with '-'
nmap  -  <Plug>(choosewin)
" swap buffer with '='
nmap = <Plug>(choosewin-swap)


" Coffee-script
NeoBundle 'kchmck/vim-coffee-script'
" does not warn about ending line with spaces
NeoBundle 'othree/coffee-check.vim'

" auto-close chars like parenthesis"
"NeoBundle 'Townk/vim-autoclose'

" HATML, Sass and SCSS
"NeoBundle 'gummesson/companion.vim'
" JavaScript/CSS validator
" NeoBundle 'joestelmach/lint.vim'

NeoBundle 'Shutnik/jshint2.vim'
let jshint2_save = 1
let jshint2_height = 10

" color in CSS
NeoBundle 'ap/vim-css-color'

" fold functions
NeoBundle 'rayburgemeestre/phpfolding.vim'

" colorscheme
"NeoBundle 'tomasr/molokai'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'jeetsukumaran/vim-buffergator'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

" quickly open companion file such as .h
NeoBundle 'vim-scripts/a.vim'

" auto add closing quotes, parens, brackets, curlies, etc
"NeoBundle 'ervandew/matchem'
NeoBundle 'ervandew/supertab'

NeoBundle 'ervandew/screen'

NeoBundle 'junegunn/fzf', {
                \ 'build': {
                    \ 'mac': './install',
                    \ 'unix': './install',
                \ },
            \ }

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell.vim'
let g:vimshell_prompt = '$'
" Use current directory as vimshell prompt.
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '



" maybe this?
" NeoBundle "Valloric/YouCompleteMe", {
" 	\ "build" : {
" 	\ 	"mac" : "./install.sh --clang-completer",
" 	\	"linux" : "./install.sh --clang-completer",
" 	\ },
" \ }
"NeoBundle 'Shougo/neocomplete.vim'

"NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'

" Fish-shell syntax highlighting
NeoBundle 'dag/vim-fish'

" Github flavored Markdown
NeoBundle 'tpope/vim-markdown'
NeoBundle 'jtratner/vim-flavored-markdown'

" TaskPaper
" NeoBundle 'davidoc/taskpaper.vim'
" NeoBundle 'mattn/calendar-vim'

" why do you aks
NeoBundle 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" Swift language
NeoBundle 'Keithbsmiley/swift.vim'

" quickly locate files
NeoBundle 'ervandew/ag'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fU :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|ttf)$'
  \ }
" http://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

NeoBundle 'tyok/nerdtree-ack'

" git
NeoBundle 'tpope/vim-fugitive'

" i j k l for up, left, down, and right
" h for insert mode
" map i <Up>
" map j <Left>
" map k <Down>
" noremap h i

set winminheight=0

"No keypressing -- focus-follows-mouse for gvim, in _gvimrc
set mousefocus
set mouse=a

" moving between splits
map <C-H> <C-W><C-H>
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>

vnoremap <silent><C-H> <C-C><C-W><C-H>
vnoremap <silent><C-J> <C-C><C-W><C-J>
vnoremap <silent><C-K> <C-C><C-W><C-K>
vnoremap <silent><C-L> <C-C><C-W><C-L>

inoremap <silent><C-H> <C-O><C-W><C-H>
inoremap <silent><C-J> <C-O><C-W><C-J>
inoremap <silent><C-K> <C-O><C-W><C-K>
inoremap <silent><C-L> <C-O><C-W><C-L>

" resize vertically opened splits
nnoremap <C-S><C-H> <C-W><
nnoremap <C-S><C-L> <C-W>>

" change split layout vertical -> horizontal
nnoremap <C-S><C-N> <C-W>t<C-W>H
nnoremap <C-S><C-M> <C-W>t<C-W>K


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
set noundofile

set tabstop=4
set shiftwidth=4
set softtabstop=4
" tab
set smarttab
set expandtab
set autoindent
set copyindent

" display the current mode in the status line:
set showmode

" wrap long lines
set display=lastline

" Quicker timeouts for tmux + vim + iTerm
set ttimeout
set timeoutlen=50
set notimeout

" Check the first five lines in a file for vim
set modelines=5

"set relativenumber
set number
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

" visualize tabs and spaces
" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

" wildmenu: command-line completion operates in an enhanced mode
" " wildignore: A file that matches with one of these patterns is ignored when
" completing file or directory names.
set wildmenu
set wildmode=list:longest
"set wildmode=longest:full,full
set wildignore=*.bak,*.toc,*.out,*.log,*.aux,*.out,*~

if has("clipboard")     " If the feature is available
  set clipboard=unnamed " copy to the system clipboard
endif

noremap ??? :CtrlP<CR>
" swapping G and <c-g>
noremap G <C-G>
noremap <C-G> G

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" use tab and shift-tab in visual mode
" mimicking intellij idea
vnoremap <silent><s-tab> <gv
vnoremap <silent><tab> >gv

" supertab
let g:SuperTabMappingBackward = '<C-tab>'
let g:SuperTabMappingTabLiteral = '<S-tab>'
let g:SuperTabDefaultCompletionType = '<C-N>'

set complete=.,w,b,u,t
set completeopt=menu,preview

" Map all keys to Auto complete
let letter = 'a'
if len(letter) == 1
    while letter <= 'z'
        execute 'imap ' letter letter . '<C-N><C-P>'
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
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS


" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l

set guifont=Menlo:h14
"set guifont=Source\ Code\ Pro:h14
set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp932,cp936,big5,euc-jp,euc-kr,latin1

set background=dark
colo molokai

au BufRead,BufNewFile *.coffee set ft=coffee
au Filetype coffee set tabstop=2
au Filetype coffee set shiftwidth=2
au Filetype coffee set softtabstop=2
au Filetype coffee set expandtab

let g:coffeeCheckHighlightErrorLine = 1

au Filetype javascript set foldmethod=indent
au Filetype javascript set foldlevel=1
" au Filetype javascript set foldclose=all

" setting up xmledit for html file
let g:xmledit_enable_html=1

au Filetype html let g:xml_syntax_folding = 1
au Filetype html set foldmethod=manual

au BufRead,BufNewFile *.taskpapertheme set ft=xml

" set no fileline for taskpaper
au BufRead, BufNewFile *.taskpaper set nonu

" compile sass
" http://ellengummesson.com/blog/2013/05/20/a-handy-function-for-going-to-the-root-directory-of-a-project-in-vim/
function! GoToSASSConfigDir()
    if filereadable("config.rb") || isdirectory("usr")
        silent! exec "!compass compile %"
    else
        silent! exec 'cd ../'
        call GoToSASSConfigDir()
    endif 
endfunction

" au BufWritePost *.scss :call GoToSASSConfigDir()

" NERDTree related
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:NERDTreeWinPos = "right"
" end of NERDTree related

" Fix terminal timeout when pressing escape
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
" if ! has('gui_running')
"     set ttimeoutlen=10
"     augroup FastEscape
"         autocmd!
"         au InsertEnter * set timeoutlen=0
"         au InsertLeave * set timeoutlen=1000
"     augroup END
" endif

set laststatus=2 " Always display the statusline in all windows


"lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

" improved upon http://usevim.com/2013/11/29/pollution/
if did_filetype()
  finish
endif
if getline(1) =~# '^#!.*/bin/env\s\+node\>'
    setfiletype javascript
else
    if getline(1) =~# '^#!.*/bin/env\s\+coffee\>'
        setfiletype coffee
    endif
endif

" KEYMAP
cnorea ej e ++enc=japan
cnorea ep e ++enc=prc
cnorea et e ++enc=taiwan

" rebase fix
cnorea rebase 2,$s/pick/f/

" NERDTree related
let NERDTreeShowBookmarks=1
map <C-Bslash> :NERDTreeTabsToggle<CR>
vnoremap <silent><C-Bslash> <C-C>:NERDTreeTabsToggle<CR>
inoremap <silent><C-Bslash> <C-O>:NERDTreeTabsToggle<CR>

map <F1> :tabprevious<CR>
vnoremap <silent><F1> <C-C>:tabprevious<CR>
inoremap <silent><F1> <C-O>:tabprevious<CR>


" bufferlist
let g:BufferListWidth = 25
let g:BufferListMaxWidth = 50
map <Leader><Leader> :BuffergatorToggle<CR>
vnoremap <silent><Leader><Leader> <C-C>:BuffergatorToggle<CR>
inoremap <silent><Leader><Leader> <C-O>:BuffergatorToggle<CR>

" tab new
map <D-T> :tabnew<CR>
vnoremap <silent><D-T> <C-C>:tabnew<CR>
inoremap <silent><D-T> <C-O>:tabnew<CR>

" Re-indent the code
map <C-P><C-I> :normal ggVG=<CR>

map <leader>z $zf%
" http://ellengummesson.com/blog/2013/05/20/a-handy-function-for-going-to-the-root-directory-of-a-project-in-vim/
function! GoToRootDir()
  if isdirectory(".git")|| filereadable("Rakefile") || filereadable("Gruntfile.js") || isdirectory("usr")
    pwd
  else
    silent! exec 'cd ../'
    call GoToRootDir()
  endif
endfunction
command! -nargs=0 Root call GoToRootDir()


" END OF KEYMAP
"
iab xname Jingwei "John" Liu
iab xemail liujingwei@gmail.com
iab xtime <C-R>=strftime("%m/%d/%y %H:%M:%S")<CR>
iab xfulltime <C-R>=strftime("%a %d %b %Y %I:%M:%S %p")<CR>
iab xdate <C-R>=strftime("%b %d, %Y")<CR>
iab xdatestamp <C-R>=strftime("%m,%d,%Y")<CR>
iab xfile <C-R>=expand("%:t:r")<CR>
