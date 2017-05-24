" Start plugin manager
call plug#begin('~/.vim/plugged')

"""""""""""
" Styling "
"""""""""""
" Solarized
Plug 'altercation/vim-colors-solarized'

" Airline (last thing shortens git flow"
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
Plug 'romainl/flattened'

" Tomorrow Theme
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'chriskempson/base16-vim'

"""""""""""""
" Languages "
"""""""""""""
" C doc generator (:dox)
Plug 'vim-scripts/DoxygenToolkit.vim',

" CoffeeScript
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }

" Javascript doc tool
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }

" Jsx
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

" Stylus
Plug 'wavded/vim-stylus', { 'for': 'stylus' }

" Python thing - makes indentation the way I like
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Tmux
Plug 'keith/tmux.vim'

"""""""""""
" Editing "
"""""""""""
" This is for making vim obey editor config files
Plug 'editorconfig/editorconfig-vim'

" Edit indent block
"   * ai – the current indentation level and the line above
"   * ii – the current indentation level excluding the line above
Plug 'michaeljsmith/vim-indent-object'

" Abolish - random vi things
Plug 'tpope/vim-abolish'

" ArgWrap - fix argument wrapping <#
Plug 'FooSoft/vim-argwrap'

" Commenter
Plug 'tpope/vim-commentary'

" HARDMODE!
Plug 'takac/vim-hardtime'

" Async highlighting
Plug 'neomake/neomake'

" Surround
Plug 'tpope/vim-surround'

" Repeater
Plug 'tpope/vim-repeat'

"""""""""""""""""""""""""
" Autocomplete - Neovim "
"""""""""""""""""""""""""
if has('nvim')
    " formatting tool
    Plug 'sbdchd/neoformat'

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

" Supertab
Plug 'ervandew/supertab'

""""""""""""""""""""
" Navigation Tools "
""""""""""""""""""""
" Allows colon as an arg
" Plug 'bogado/file-line'

" Vim sneak - better movement
Plug 'justinmk/vim-sneak'

" Mapping from Tim
Plug 'tpope/vim-unimpaired'

" Gutentags
Plug 'ludovicchabant/vim-gutentags'

" Relative Number Toggle
" if ($USER == "ty" || $USER == "tyrocca")
"     Plug 'jeffkreeftmeijer/vim-numbertoggle'
" endif

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

" Vim Grepper
Plug 'mhinz/vim-grepper'

""""""""""""""""""
" Misc Things... "
""""""""""""""""""
" Undo Tree
Plug 'simnalamburt/vim-mundo'
" Gundo doesn't work with neovim :(
" Plug 'sjl/gundo.vim'

" Git tools
Plug 'tpope/vim-fugitive'

" vim REPL
Plug 'jpalardy/vim-slime'

" Git changes
" Plug 'airblade/vim-gitgutter'

" Notes
" Plug 'xolox/vim-notes' | Plug 'xolox/vim-misc'

" Trial
" Plug 'metakirby5/codi.vim'

" Add plugins to &runtimepath
call plug#end()
