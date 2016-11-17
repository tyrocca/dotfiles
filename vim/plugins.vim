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

" Molokai
Plug 'tomasr/molokai'

" Monokai
Plug 'sickill/vim-monokai'

" Alt solarized
Plug 'lifepillar/vim-solarized8'

" Tomorrow Theme
Plug 'chriskempson/vim-tomorrow-theme'

" Zenburn
Plug 'Zenburn'

" Base16 - this is so damn big...
" Plug 'chriskempson/base16-vim'

"""""""""""""
" Languages "
"""""""""""""
" CoffeeScript
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee', 'cjsx', 'coffee.cjsx'] }

" CJSX
Plug 'mtscout6/vim-cjsx', { 'for': ['coffee', 'cjsx', 'coffee.cjsx'] }

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Jsx
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

" Stylus
Plug 'wavded/vim-stylus', { 'for': 'stylus' }

" Python thing
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

"""""""""""
" Editing "
"""""""""""
" Edit indent block
"   * ai – the current indentation level and the line above
"   * ii – the current indentation level excluding the line above
Plug 'michaeljsmith/vim-indent-object'

" Abolish - random vi things
Plug 'tpope/vim-abolish'

" Commentout
" Plug 'scrooloose/nerdcommenter'

" Commenter
Plug 'tpope/vim-commentary'

" Async highlighting
Plug 'neomake/neomake'

" Server auto complete < no dependent files
Plug 'ervandew/supertab'

" Autocomplete
if has('nvim')
    " * Auto complete tool *
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " * Snippets *
    " Track the engine.
    Plug 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'
    " More snippets
    Plug 'greg-js/vim-react-es6-snippets', { 'for': ['javascript', 'javascript.jsx'] }

    " Python Autocomplete
    Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
    Plug 'davidhalter/jedi', { 'for': ['python'] }

    " Javascript Autocomplete
    " New trial items
    " setting up deoplete etc... http://bit.ly/2duFHbJ
    " ~/.config/nvim/plugged/tern_for_vim/ <<< run npm install or ...
    " ~/.vim/plugged/tern_for_vim/ <<< run npm install
    Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/jspc.vim', { 'for': ['coffee', 'cjsx', 'coffee.cjsx', 'javascript', 'javascript.jsx'] }

endif

" Surround
Plug 'tpope/vim-surround'

" ArgWrap - fix argument wrapping
Plug 'FooSoft/vim-argwrap'

" Repeater
Plug 'tpope/vim-repeat'

""""""""""""""""""""
" Navigation Tools "
""""""""""""""""""""
" Allows colon as an arg
Plug 'bogado/file-line'

" Relative Number Toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Gutentags
Plug 'ludovicchabant/vim-gutentags'

" Mapping from Tim
Plug 'tpope/vim-unimpaired'

" Fuzzy finder
if has("gui_running")
    " plugin to control p
    Plug 'ctrlpvim/ctrlp.vim'
    " plugin to speed up control p
    Plug 'FelikZ/ctrlp-py-matcher'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
endif

" tmux
Plug 'christoomey/vim-tmux-navigator'

" Ag - deprecated
" Plug 'rking/ag.vim'
" Ack
" Plug 'mileszs/ack.vim'
" Vim Grepper
Plug 'mhinz/vim-grepper'

""""""""""""""""""
" Misc Things... "
""""""""""""""""""
" Git tools
Plug 'tpope/vim-fugitive'

" TEMP - vim repl
Plug 'jpalardy/vim-slime'

" Git
Plug 'airblade/vim-gitgutter'

" Notes
" Plug 'xolox/vim-notes' | Plug 'xolox/vim-misc'

" HARDMODE!
" Plug 'wikitopian/hardmode'
Plug 'takac/vim-hardtime'
Plug 'justinmk/vim-sneak'

" Add plugins to &runtimepath
call plug#end()
