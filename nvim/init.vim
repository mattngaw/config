" source ~/.config/.vimrc "

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Basic config options "
set nocompatible            " disable compatibility to old-time vi
set ttyfast                 " Speed up scrolling in Vim
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set noswapfile            " disable creating swap file
set cursorline              " highlight current cursorline
set hidden " Required for operations modifying multiple buffers like rename
filetype indent on   "allow auto-indenting depending on file type
filetype plugin on
syntax on                   " syntax highlighting

" Unused config options "
" set cc=80                  " set an 80 column border for good coding style
" highlight ColorColumn ctermbg=7

" Red highlighting past 80 chars "
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Key rebinds "
nmap <C-w>, <Esc>:tabp<CR>
nmap <C-w>. <Esc>:tabn<CR>
nmap <C-w>n <Esc>:tabnew<CR>
nmap <C-w>- <Esc>:sp<CR>
nmap <C-w>\| <Esc>:vsp<CR>

let termdebug_wide = 1

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Async lint engine
Plug 'dense-analysis/ale'

" Vim mode bar
Plug 'itchyny/lightline.vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Rust
Plug 'rust-lang/rust.vim'

Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" Zen 1
Plug 'folke/zen-mode.nvim'

" Zen 2
Plug 'junegunn/goyo.vim'

" Tim Pope
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" Git Gutter
Plug 'airblade/vim-gitgutter'

Plug 'kana/vim-operator-user'

Plug 'rhysd/vim-clang-format'

Plug 'vim-scripts/DoxygenToolkit.vim'

" Discord
Plug 'andweeb/presence.nvim'

" Presenting
Plug 'sotte/presenting.vim'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

let g:ale_linters = { 'rust': ['analyzer'], 'verilog': ['verible'], 'ocaml': ['merlin'] }
let g:ale_verilog_verilator_options = '-y . -sv --default-language "1800-2012"'
let g:ale_completion_enabled = 1

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp+=" . "/Users/matto/.opam/default/bin/ocamlmerlin"
autocmd FileType ocaml setlocal shiftwidth=2 tabstop=2
autocmd FileType c setlocal syntax=c.doxygen
autocmd BufNewFile,BufRead *.l1 set syntax=c
autocmd BufNewFile,BufRead *.l2 set syntax=c
autocmd BufNewFile,BufRead *.l3 set syntax=c
autocmd BufNewFile,BufRead *.l4 set syntax=c
autocmd BufNewFile,BufRead *.l5 set syntax=c

let g:ale_fixers = { 'ocaml': ['ocamlformat'], 'rust': ['rustfmt'], 'c': ['clang-format'] }
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_fix_on_save = 1

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
