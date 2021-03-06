""""""""""""""""
" * Vim Plug * "
""""""""""""""""
set nocompatible              " be iMproved, required
" https://github.com/junegunn/vim-plug

" Automatic install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Start plugin manager
call plug#begin('~/.vim/plugged')

"""""""""""
" Styling "
"""""""""""
" Solarized
Plug 'altercation/vim-colors-solarized'

" LightLine
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" Tmux line
Plug 'edkolev/tmuxline.vim'

" Groovebox
Plug 'morhetz/gruvbox'

" Monokai
Plug 'sickill/vim-monokai'


"""""""""""""
" Languages "
"""""""""""""
" CoffeeScript
Plug 'kchmck/vim-coffee-script'

" CJSX
Plug 'mtscout6/vim-cjsx'

" Stylus
Plug 'wavded/vim-stylus', { 'for': 'stylus' }

"""""""""""
" Editing "
"""""""""""
" Edit indent block
"   * ai – the current indentation level and the line above
"   * ii – the current indentation level excluding the line above
Plug 'michaeljsmith/vim-indent-object'

" TEMP - vim repl
Plug 'jpalardy/vim-slime'

" Abolish - random vi things
Plug 'tpope/vim-abolish'

" Commentout
Plug 'scrooloose/nerdcommenter'

" Commenter
Plug 'tpope/vim-commentary'

" Syntax highighting
if !has('nvim')
    Plug 'scrooloose/syntastic'
else
    " Async highlighting
    Plug 'neomake/neomake'
endif

" Server auto complete < no dependent files
Plug 'ervandew/supertab'

" Surround
Plug 'tpope/vim-surround'

" ArgWrap - fix argument wrapping
Plug 'FooSoft/vim-argwrap'

" Repeater
Plug 'tpope/vim-repeat'

""""""""""""""""""""
" Navigation Tools "
""""""""""""""""""""
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

if has("gui_running")
    " plugin to control p
    Plug 'ctrlpvim/ctrlp.vim'
    " plugin to speed up control p
    Plug 'FelikZ/ctrlp-py-matcher'
endif

" tmux
Plug 'christoomey/vim-tmux-navigator'

"File Insert
Plug 'rking/ag.vim'

""""""""""""""""""
" Misc Things... "
""""""""""""""""""
" Git tools
Plug 'tpope/vim-fugitive'

" Add plugins to &runtimepath
call plug#end()


""""""""""""""""""""""""
" * Built in Toggles * "
""""""""""""""""""""""""
" Colors
syntax enable
set background=dark
if ($USER == "ty" || $USER == "tyrocca")
    if !has("nvim")
        set t_Co=256
        let g:solarized_termcolors=16
    endif
    colorscheme solarized
else
    colorscheme gruvbox
endif

" Formatting
set fileformat=unix    " Make sure the files are always unix
set fileformats=unix    " Make sure the files are always unix
set tabstop=4 		    " number of visual spaces per TAB
set softtabstop=4  	    " number of spaces in tab when editing
set shiftwidth=4        " number of spaces when ?
set expandtab       	" tabs are spaces (tab button = spaces)
set colorcolumn=80      " keep within this column
set backspace=2         " make backspace work

"UI configs
set number 		        " show line nums
set showcmd 		    " show last entered command
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch 		    " show matching ()
if !has('nvim')
    set ttymouse=xterm2
    set mouse=a             " Turn on mouse mode
endif
set timeoutlen=1000 ttimeoutlen=0  " prevent slowdown on normal mode

" Prevent Arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Some people say this helps speed up normal mode
inoremap jj <ESC>
set scrolloff=5     " Makes the cursor offset


" http://usevim.com/2012/10/19/vim101-set-hidden/
set hidden
set history=1000

"UX config

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"Searching
set ignorecase
set smartcase
"/copyright      " Case insensitive
"/Copyright      " Case sensitive
"/copyright\C    " Case sensitive
"/Copyright\c    " Case insensitive


" turn off search highlight
"Vim will keep highlighted matches from searches until you
"either run a new one or manually stop highlighting the old
"search with :nohlsearch. I find myself running this all
" the time so I've mapped it to <leader><space>.
nnoremap <silent> <leader><space> :nohlsearch<CR>

"Smarter searching
":set smartcase
"/copyright      " Case insensitive
"/Copyright      " Case sensitive
"/copyright\C    " Case sensitive
"/Copyright\c    " Case insensitive

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=0         "this is just what i use


"""""""""""""""""""""""
" Copying and pasting "
"""""""""""""""""""""""
" Reselecting Pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"Paste toggle
set pastetoggle=<F2>

" f3 will toggle linenumbers
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>
noremap <F4> :colorscheme gruvbox <CR>
call togglebg#map("<F5>")


"""""""""""""""""""""
" Function Key Maps "
"""""""""""""""""""""
" f5 will strip out whitespace
"nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Toggle foldmethod on
nnoremap <F8> :setlocal foldmethod=indent<CR>:setlocal foldignore= <CR>

" Launch vimrc
nnoremap <F9> :tabe ~/.vimrc<CR>

"""""""""""""""""""""""
" Leader Key Mappings "
"""""""""""""""""""""""
" for inserting new lines (like <C-o>)
nnoremap <silent> <leader><CR> i<CR><ESC>
" this makes a nice surrounding block around a piece of text
nnoremap <leader>1 :center 80<CR>hhv0r#A<SPACE><ESC>40A#<ESC>d80<BAR>YppVr#kk.
" Remove those fucking ^M characters
nnoremap <silent> <leader>6 :%s///g<CR>

" for saving
nnoremap <leader>w :w<CR>

"""""""""""""""""""""""
" * GUI only things * "
"""""""""""""""""""""""

if has("gui_running")
    set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline
endif

""""""""""""""""""""
" * Plugin Mods  * "
""""""""""""""""""""

"""""""""""""""""""""""""
" Modifications for FZF "
"""""""""""""""""""""""""
if !has("gui_running")
    nnoremap <silent> <C-p> :GitFiles<CR>
    nnoremap <silent> <leader>l :History<CR>
    nnoremap <silent> <leader>t :Tags<CR>
    nnoremap <silent> <leader>b :BTags<CR>
endif
"""""""""""""""""""""""""""
" Modifications for CTRLP "
"""""""""""""""""""""""""""
"Accessing mru mode
if has("gui_running")
    nnoremap <silent> <leader>l :CtrlPMRU<CR>
    nnoremap <silent> <leader>b :CtrlPBuffer<CR>
    nnoremap <silent> <leader>t :CtrlPTag<cr>
    let g:ctrlp_map = '<leader>p'
    let g:ctrlp_cmd = 'CtrlP'

    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
    let g:ctrlp_use_caching = 0
endif
set wildignore+=*/tmp/*,**/css/*,
    \*/cc/*,*.so,*.swp,*.zip,*.pyc,*/.git

"""""""""""
" Airline "
"""""""""""
" For Airline
set laststatus=2

" For Airline
let g:airline_powerline_fonts = 1

" For TMUX plugin
let g:tmuxline_powerline_separators = 1

"""""""""""
" ArgWrap "
"""""""""""
" Command to exec
nnoremap <silent> <leader>a :ArgWrap<CR>

"""""""""""""
" Syntastic "
"""""""""""""
if !has('nvim')
    " for syntastic use f12
    let g:syntastic_mode_map = { 'mode': 'active' }
    nnoremap <F10> :SyntasticToggleMode<CR>
    " Toggles Syntax check
    nnoremap <F12> :update<CR>:SyntasticCheck<CR>

    " Fun styling for syntastic
    let g:syntastic_error_symbol = '❌'
    let g:syntastic_style_error_symbol = '⁉️'
    let g:syntastic_warning_symbol = '⚠️'
    let g:syntastic_style_warning_symbol = '💩'

    " Javascript
    let g:syntastic_javascript_checkers = ['eslint']

    " Python
    let g:syntastic_python_checkers = ["flake8"]

    " Ignore Errors
    let g:syntastic_python_flake8_args = '--max-line-length=200 --ignore=W391'
else
    let g:neomake_python_enabled_makers = ['flake8']
    autocmd! BufWritePost * Neomake
endif


""""""""""""""""""""
" Fugitive settings "
"""""""""""""""""""""
" by default is split
set diffopt+=vertical

""""""""""""""""
" Indent lines "
""""""""""""""""
" Disabled by default
let g:indentLine_enabled = 0
" Thing to speed up vim
let g:indentLine_faster = 1
" Toggle them on and off
nnoremap <F7> :IndentLinesToggle<CR>

""""""""
" TMUX "
""""""""
let g:tmux_navigator_save_on_switch = 1  " Save on close

"""""""""""""""""
" Auto Commands "
"""""""""""""""""
" auto cmd to strip whitespace
"autocmd BufWritePre * :%s/\s\+$//e
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"""""""""""""""
" Misc things "
"""""""""""""""
" prevents writing stupid files
cabbrev w] w
cabbrev w\ w
cabbrev w' w

" make write actually write
command! W  write

"""""""""""
" Credits "
"""""""""""
" inspiration
" http://marcgg.com/blog/2016/03/01/vimrc-example/


""""""""""""""""""""
" Webpack problems "
""""""""""""""""""""
" https://github.com/webpack/webpack/issues/781
set backupcopy=yes


"""""""""""""""
" Trial Items "
"""""""""""""""
" changes the cursor in vim
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" SLIME
let g:slime_target = "tmux"
let g:slime_python_ipython = 1


nnoremap dd o
