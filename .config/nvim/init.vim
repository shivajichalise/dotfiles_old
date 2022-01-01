let g:mapleader = "\<Space>"

" Settings
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
" set smartindent
set relativenumber
set nu
set nohlsearch
set nowrap
set guicursor=
set incsearch
set noshowmode
set scrolloff=10
set hidden
set noerrorbells
set termguicolors
set colorcolumn=90
set signcolumn=yes
set cmdheight=1
" set mouse=a                             " Enable your mouse
set clipboard=unnamedplus               " Copy paste between vim and everything else
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set cursorline                          " Enable highlighting of the current line
set ruler
set encoding=utf-8

" Mappings
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Moving lines up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" UNDO Break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <ESC><ESC> :bd<CR>

" Behave VIM
nnoremap Y y$

" Airline Settings
" Enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" Switch to your current theme
let g:airline_theme = 'gruvbox'

" Trigger configuration
let g:UltiSnipsExpandTrigger="<C-l>"

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Sources
source $HOME/.config/nvim/plug-config/coc.vim

" Plugins
call plug#begin('~/.vim/plugged')

" Language Support
Plug 'pangloss/vim-javascript'
" Plug 'chemzqm/vim-jsx-improve'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

" Color Scheme
Plug 'morhetz/gruvbox'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" TPOPE
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" React code snippets
Plug 'epilande/vim-react-snippets'

Plug 'luochen1990/rainbow'
Plug 'gregsexton/matchtag'

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:gruvbox_italic=1
colorscheme gruvbox
