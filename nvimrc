call plug#begin('~/.vim/vimplugs')

" Quality of life 
Plug 'bling/vim-airline'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'relastle/bluewery.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

" Bash
Plug 'kovetskiy/vim-bash'

" Javascript
Plug 'nzakas/eslint'
Plug 'prettier/vim-prettier', {
	\ 'do': 'npm install',
	\ 'for': ['javascript'] }

call plug#end()

if !exists("g:syntax_on")
	syntax enable
endif

colorscheme bluewery
set termguicolors

filetype plugin indent on

set background=dark
set nocompatible
set modelines=0

set tabstop=4
set softtabstop=4
set shiftwidth=4

au Filetype javascript,typescript set tabstop=2
au Filetype javascript,typescript set softtabstop=2
au Filetype javascript,typescript set shiftwidth=2

au Filetype yaml set tabstop=2
au Filetype yaml set softtabstop=2
au Filetype yaml set shiftwidth=2

set autoindent
set expandtab

set nomodeline

set wrap
set textwidth=80
set formatoptions=qrn1

set splitbelow
set splitright

set number
set relativenumber

set wildmenu
set wildmode=longest,list

set lazyredraw
set showmode
set showcmd

set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
set gdefault

" Use tab to navigate completion lists
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

let g:airline#extensions#ale#enabled = 1

" Ale
let g:ale_completion_autoimport = 1
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'go': ['gofmt', 'goimports'],
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
    \ 'go': ['golangci-lint', 'gopls'],
    \ 'javascript': ['eslint', 'tsserver'],
    \ 'javascript.jsx': ['eslint', 'tsserver'],
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

" Deoplete
let g:deoplete#enable_at_startup = 1

" General mappings
let mapleader = ","

noremap <leader>ff :Files<CR>
noremap <leader>gf :GFiles<CR>
noremap <leader>rg :Rg<space>
noremap <leader>nt :NERDTreeToggle<CR>
noremap <leader>ss <C-W><C-W>
noremap <leader>te :tabedit<space>
noremap <leader>tn :tabnext<CR>
noremap <leader>tp :tabprevious<CR>

" Regex mappings
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>

" Ale mappings
set hidden

nnoremap <silent><leader>H :ALEHover<CR>
nnoremap <silent><leader>jj :ALEFix<CR>
nnoremap <silent><leader>gr :ALEFindReferences<CR>
nnoremap <silent><leader>gd :ALEGoToDefinition -tab<CR>
nnoremap <silent><leader>gt :ALEGoToTypeDefinition -tab<CR>
