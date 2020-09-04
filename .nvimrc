call plug#begin('~/.vim/vimplugs')

" Qol
Plug 'bling/vim-airline'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

" Bash
Plug 'kovetskiy/vim-bash'

" Go
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Javascript
Plug 'mxw/vim-jsx'
Plug 'nzakas/eslint'
Plug 'prettier/vim-prettier', {
	\ 'do': 'npm install',
	\ 'for': ['javascript'] }

call plug#end()

if !exists("g:syntax_on")
	syntax enable
endif

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

filetype plugin indent on

set background=dark
set nocompatible
set modelines=0

" four spaces per tab
set tabstop=2
set softtabstop=2
set shiftwidth=2

au Filetype javascript,typescript set tabstop=2
au Filetype javascript,typescript set softtabstop=2
au Filetype javascript,typescript set shiftwidth=2

au Filetype yaml set tabstop=2
au Filetype yaml set softtabstop=2
au Filetype yaml set shiftwidth=2

set expandtab
set autoindent

" disable modeline
set nomodeline

" soft wrap long lines
set wrap
set textwidth=80
set formatoptions=qrn1

" set splits
set splitbelow
set splitright

" show line numbers
set number
set relativenumber

" command menu autocomplete
set wildmenu
set wildmode=longest,list

set lazyredraw
set showmode
set showcmd

" regex tweaks
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
set gdefault

" use tab to navigate completion lists
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

let g:airline#extensions#ale#enabled = 1

let g:ale_completion_tsserver_autoimport = 1
let g:ale_fixers = {
    \ 'markdown': ['prettier'],
    \ 'javascript': ['eslint'],
    \ 'javascript.jsx': ['eslint'],
    \ 'json': ['fixjson'],
    \ 'python': ['black', 'isort'],
    \ 'rust': ['rustfmt'],
    \ 'typescript': ['eslint'],
    \ 'typescriptreact': ['eslint'],
    \ 'yaml': ['prettier']
    \ }
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
    \ 'bash': ['shellcheck'],
    \ 'elixir': ['credo'],
    \ 'javascript': ['eslint', 'tsserver'],
    \ 'javascript.jsx': ['eslint', 'tsserver'],
    \ 'go': ['gofmt', 'goimports', 'go vet', 'golint', 'staticcheck'],
    \ 'markdown': ['prettier'],
    \ 'python': ['flake8', 'mypy', 'pyls'],
    \ 'rust': ['cargo', 'rls'],
    \ 'sh': ['shellcheck'],
    \ 'sql': ['sqlint'],
    \ 'terraform': ['tflint'],
    \ 'typescript': ['eslint', 'tsserver'],
    \ 'typescriptreact': ['eslint', 'tsserver'],
    \ }
let g:ale_open_list = 1
let g:ale_set_loclist = 1

let g:ale_python_isort_options = '--multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=88'
let g:ale_python_pyls_config = {'pyls': {
      \ 'configurationSources': ['flake8'],
      \ 'plugins': { 'pyls_mypy': { 'live_mode': v:false } } }
    \ }

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1

" deoplete setup
let g:deoplete#enable_at_startup = 1

" general use key mappings
let mapleader = ","

noremap <leader>ff :Files<CR>
noremap <leader>gf :GFiles<CR>
noremap <leader>rg :Rg<space>
noremap <leader>nt :NERDTreeToggle<CR>
noremap <leader>ss <C-W><C-W>
noremap <leader>te :tabedit<space>
noremap <leader>tn :tabnext<CR>
noremap <leader>tp :tabprevious<CR>

" regex key mappings
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>

" ale mappings
set hidden

nnoremap <silent><leader>H :ALEHover<CR>
nnoremap <silent><leader>jj :ALEFix<CR>
nnoremap <silent><leader>gr :ALEFindReferences<CR>
nnoremap <silent><leader>gd :ALEGoToDefinition -tab<CR>
nnoremap <silent><leader>gt :ALEGoToTypeDefinition -tab<CR>
