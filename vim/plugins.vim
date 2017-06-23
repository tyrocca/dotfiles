" Start plugin manager
call plug#begin('~/.vim/plugged')

"""""""""""
" Styling "
"""""""""""
" Solarized
Plug 'altercation/vim-colors-solarized'

" Airline (last thing shortens git flow"
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

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
Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'gitcommit']}

" Latex
Plug 'lervag/vimtex', { 'for': ['plaintex', 'tex'] }
Plug 'xuhdev/vim-latex-live-preview', { 'for': ['plaintex', 'tex'] }

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

" Pencil - for text editing
Plug 'reedes/vim-pencil'

" Autocorrect plugin
Plug 'panozzaj/vim-autocorrect'

" Easy Align
Plug 'junegunn/vim-easy-align'

"""""""""""""""""""""""""
" Autocomplete - Neovim "
"""""""""""""""""""""""""
if (has('nvim'))
    " Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
    " the framework
    Plug 'roxma/nvim-completion-manager'
    Plug 'roxma/python-support.nvim'

    " Python Autocomplete
    Plug 'davidhalter/jedi', { 'for': ['python'] }

    " Javascript (Tern autocomplete)
    Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

    " Vimscript autocomplete
    Plug 'Shougo/neco-vim'

    " * Snippets *
    " Track the engine.
    " Plug 'SirVer/ultisnips'
    " " Snippets are separated from the engine. Add this if you want them:
    " Plug 'honza/vim-snippets'
    " " More snippets
    " Plug 'greg-js/vim-react-es6-snippets', { 'for': ['javascript', 'javascript.jsx'] }
    " formatting tool
    Plug 'sbdchd/neoformat'
endif

" Supertab
Plug 'ervandew/supertab'

""""""""""""""""""""
" Navigation Tools "
""""""""""""""""""""
" Allows colon as an arg
Plug 'bogado/file-line'

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

" Vim Grepper
Plug 'mhinz/vim-grepper'


""""""""""""""""
" Tmux and vim "
""""""""""""""""
" Tmux
Plug 'keith/tmux.vim'

" Tmux line
Plug 'edkolev/tmuxline.vim'

" Tmux key bindings
Plug 'christoomey/vim-tmux-navigator'

" tmux
Plug 'benmills/vimux'


""""""""""""""""""
" Misc Things... "
""""""""""""""""""
" Async run
Plug 'skywind3000/asyncrun.vim'

" Test runner
Plug 'janko-m/vim-test'

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
Plug 'metakirby5/codi.vim'

" Add plugins to &runtimepath
call plug#end()
