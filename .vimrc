" Must come first because it changes other options
set nocompatible

" swap files far away from the project folders
set directory=$HOME/.vim/swapfiles//

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'

Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }

Plug 'sheerun/vim-polyglot'

Plug 'dense-analysis/ale'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-signify'
Plug 'chrisbra/Colorizer'
Plug 'mattn/emmet-vim'

Plug 'tpope/vim-fugitive'
Plug 'kevinhui/vim-docker-tools'

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '⚑'
let g:ale_sign_warning = '⚐'

let g:ale_php_phpcs_standard = 'psr2'

let b:ale_linters = ['php', 'phpcs']
let b:ale_fixers = ['phpcbf']

" [vim-airline] Status bar settings
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:dracula_colorterm = 0
let g:dracula_italic = 0

colorscheme dracula
color dracula

let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

syntax on
set encoding=utf-8      " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set termguicolors!
set backspace=indent,eol,start  " more powerful backspacing
set number
set ignorecase
set smartcase
set undofile
set spell
set list
set hlsearch
set incsearch
set lazyredraw
set fillchars=vert:\ ,fold:\  listchars=tab:⎸\ ,nbsp:⎕
set linebreak showbreak=↪\  breakindent breakindentopt=shift:-2
set formatoptions+=nj
set laststatus=2
set wildignore+=*/node_modules/*,*/dist/*,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Change cursor shape based on mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

let g:vim_markdown_conceal = 0

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:PHP_outdentphpescape = 0
let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
