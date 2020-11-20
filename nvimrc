call plug#begin('~/.vim/vimplugs')

" Quality of life 
Plug 'bling/vim-airline'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'relastle/bluewery.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'Xuyuanp/nerdtree-git-plugin'

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

set termguicolors
colorscheme bluewery

filetype plugin indent on

set background=dark
set nocompatible
set modelines=0

set tabstop=4
set softtabstop=4
set shiftwidth=4

au Filetype cs,javascript,typescript,yaml set tabstop=2
au Filetype cs,javascript,typescript,yaml set softtabstop=2
au Filetype cs,javascript,typescript,yaml set shiftwidth=2

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

let g:airline_theme='bluewery'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Ale
let g:ale_completion_autoimport = 1
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'go': ['gofmt', 'goimports'],
    \ 'markdown': ['prettier'],
    \ 'javascript': ['eslint'],
    \ 'javascript.jsx': ['eslint'],
    \ 'json': ['prettier'],
    \ 'python': ['black', 'isort'],
    \ 'rust': ['rustfmt'],
    \ 'terraform': ['terraform'],
    \ 'typescript': ['eslint'],
    \ 'typescriptreact': ['eslint'],
    \ 'yaml': ['prettier']
    \ }
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
    \ 'bash': ['shellcheck'],
	\ 'cs': ['OmniSharp'],
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
noremap <leader>e :edit<space>
noremap <leader>bn :bnext<CR>
noremap <leader>bp :bprevious<CR>

" Regex mappings
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>

" Ale mappings
set hidden

nnoremap <silent><leader>H :ALEHover<CR>
nnoremap <silent><leader>jj :ALEFix<CR>
nnoremap <silent><leader>gr :ALEFindReferences<CR>
nnoremap <silent><leader>gd :ALEGoToDefinition<CR>
nnoremap <silent><leader>gt :ALEGoToTypeDefinition<CR>

" OmniSharp mappings

autocmd FileType cs nnoremap <buffer><silent><leader>H :OmniSharpDocumentation<CR>
autocmd FileType cs nnoremap <buffer><silent><leader>jj :OmniSharpCodeFormat<CR>
autocmd FileType cs nnoremap <buffer><silent><leader>gr :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <buffer><silent><leader>gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer><silent><leader>gt :OmniSharpTypeLookup<CR>
