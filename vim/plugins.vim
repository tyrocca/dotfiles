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
" TODO (tyrocca 2020-03-16):
" Plug 'chriskempson/base16-vim'

" papercolor
Plug 'NLKNguyen/papercolor-theme'

"""""""""""""
" Languages "
"""""""""""""
" C doc generator (:dox)
Plug 'vim-scripts/DoxygenToolkit.vim'

" C extra stuff
Plug 'justinmk/vim-syntax-extra'

" Cassandra CQL
Plug 'elubow/cql-vim'

" Go Language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }

" Javascript doc tool
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }

" Typescript
Plug 'HerringtonDarkholme/yats.vim'

" Jsx
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }

" Jenkins
Plug 'martinda/Jenkinsfile-vim-syntax'

" Styling
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Stylus
Plug 'wavded/vim-stylus', { 'for': 'stylus' }

" Terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" Python thing - makes indentation the way I like
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'Integralist/vim-mypy'

" Trial item
if (has('nvim'))
    Plug 'psf/black', { 'tag': '19.10b0' }
    " Plug 'psf/black'
endif
" Plug 'heavenshell/vim-pydocstring', { 'for': 'python' }

" Markdown
Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'gitcommit']}

" Latex
" Plug 'lervag/vimtex', { 'for': ['plaintex', 'tex'] }
Plug 'xuhdev/vim-latex-live-preview', { 'for': ['plaintex', 'tex'] }

" Indent Deducer
" Plug 'tpope/vim-sleuth'

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

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
" assuming your using vim-plug: https://github.com/junegunn/vim-plug
if (has('nvim'))
    Plug 'ncm2/ncm2'
    " ncm2 requires nvim-yarp
    Plug 'roxma/nvim-yarp'

    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-tmux'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
    Plug 'ncm2/ncm2-cssomni'
    " Trial Items
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-github'
    Plug 'ncm2/ncm2-pyclang'
    " Plug 'ncm2/nvim-typescript', {'do': './install.sh'}
    Plug 'ncm2/ncm2-go', { 'do': 'go get -u github.com/mdempsky/gocode' }
    Plug 'ncm2/ncm2-markdown-subscope'
    Plug 'ncm2/ncm2-html-subscope'
    Plug 'ncm2/ncm2-tagprefix'

    " enable ncm2 for all buffer
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " note that must keep noinsert in completeopt, the others is optional
    set completeopt=noinsert,menuone,noselect
    " Autoformater
    Plug 'sbdchd/neoformat'
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif


" Supertab
" Plug 'ervandew/supertab'

""""""""""""""""""""
" Navigation Tools "
""""""""""""""""""""
" Allows colon as an arg
" Plug 'bogado/file-line'
Plug 'kopischke/vim-fetch'

" Vim sneak - better movement
Plug 'justinmk/vim-sneak'

" Mapping from Tim
Plug 'tpope/vim-unimpaired'

" Gutentags
Plug 'ludovicchabant/vim-gutentags'

" Relative Number Toggle
" if ($USER == "ty" || $USER == "tyrocca")
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" endif

" Fuzzy finder
if has("gui_running")
    " plugin to control p
    Plug 'ctrlpvim/ctrlp.vim'
    " plugin to speed up control p
    Plug 'FelikZ/ctrlp-py-matcher'
else
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
endif

" Vim Grepper
Plug 'mhinz/vim-grepper'


""""""""""""""""
" Tmux and vim "
""""""""""""""""
" Tmux
Plug 'tmux-plugins/vim-tmux'

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

" vim DB management
Plug 'tpope/vim-dadbod'

" Git changes
Plug 'airblade/vim-gitgutter'

" Notes
" Plug 'xolox/vim-notes' | Plug 'xolox/vim-misc'

" Trial
Plug 'metakirby5/codi.vim'

" File tools
Plug 'tpope/vim-eunuch'

" Fun!
Plug 'johngrib/vim-game-code-break'

" Add plugins to &runtimepath
call plug#end()



""""""""
"" NCM "
""""""""
"""" Neocomplete dead
"if has("nvim")
"    " for python completions
"    let g:python_support_python3_requirements =
"                \ add(get(g:,'python_support_python3_requirements',[]),'jedi')
"    " language specific completions on markdown file
"    let g:python_support_python3_requirements =
"                \ add(get(g:,'python_support_python3_requirements',[]),'mistune')

"    " utils, optional
"    let g:python_support_python3_requirements =
"                \ add(get(g:,'python_support_python3_requirements',[]),'psutil')
"    let g:python_support_python3_requirements =
"                \ add(get(g:,'python_support_python3_requirements',[]),'setproctitle')
"endif

    """"""""""""""""""""""""""""""""""""""
    "" DEPRECATED OLD VERSION OF COMPLETE "
    """"""""""""""""""""""""""""""""""""""
    "Plug 'roxma/nvim-completion-manager'
    "Plug 'roxma/python-support.nvim'

    "" * Snippets *
    "" Track the engine.
    "Plug 'SirVer/ultisnips'
    "" Snippets are separated from the engine. Add this if you want them:
    "Plug 'honza/vim-snippets'

    "" C/C++ autocomplete
    "Plug 'roxma/ncm-clang'

    "" Python Autocomplete
    "Plug 'davidhalter/jedi', { 'for': ['python'] }

    "" Javascript (Tern autocomplete)
    "Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
    "Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
    "" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

    "" Vimscript autocomplete
    "Plug 'Shougo/neco-vim'
    "Plug 'sbdchd/neoformat'

"" LSP
" Plug 'autozimu/LanguageClient-neovim', {
"             \ 'branch': 'next',
"             \ 'do': 'bash install.sh',
"             \ }
