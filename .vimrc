set encoding=utf-8
set termguicolors!
syntax on

" swap files far away from the project folders
set directory=$HOME/.vim/swapfiles//

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'

Plug 'ervandew/ag'
Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }
Plug 'docker/docker'

"Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"colorscheme base16-default-dark
" column markers
"set cc=80,120
"set colorcolumn=80,120
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

set number ignorecase smartcase undofile spell list hlsearch incsearch lazyredraw
set fillchars=vert:\ ,fold:\  listchars=tab:⎸\ ,nbsp:⎕
set linebreak showbreak=↪\  breakindent breakindentopt=shift:-2
set formatoptions+=nj
let g:PHP_outdentphpescape = 0

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Change cursor shape based on mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let g:indentLine_char = "│"

let g:vim_markdown_conceal = 0

let NERDTreeShowHidden=1
set laststatus=2

set wildignore+=*/node_modules/*,*/dist/*,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

autocmd VimEnter * NERDTree
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

