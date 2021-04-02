"-- Plugins --"
call plug#begin('~/.vim/plugged')

" Nord color scheme
Plug 'arcticicestudio/nord-vim'

" Gruvbox color scheme
Plug 'morhetz/gruvbox'

" NerdTree
Plug 'preservim/nerdtree'

" Syntax Plugins
Plug 'pangloss/vim-javascript' " JavaScript syntax
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty' " JSX syntax
Plug 'peitalin/vim-jsx-typescript' "TSX syntax
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Coc Plugin
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Fuzzy Finder (FZF)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Use FZF inside of Coc (instead of Coc's finder)
Plug 'antoinemadec/coc-fzf'

call plug#end()

" -- Coc config -- "
let g:coc_global_extensions = [ 'coc-tsserver' ]

" (use local configs if available)
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

"autocmd CursorHold * silent call CocActionAsync('highlight') " this should do coc-highlight TODO configure this later

" highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js.jsx,ts,tsx} :syntax sync clear

"-- Colorscheme --"
" Nord
" colorscheme nord
" Gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

syntax on

" llet g:ale_sign_error = '●'
" llet g:ale_sign_warning = '.'
" llet g:ale_lint_delay = 10

"--- Keymaps ---"
let mapleader = ","

" --- CoC keymaps --- "
" ',k' - show info about whatever cursor is on
" 'gd' go to definition
" 'gy' 
" 'gr' find references for whatever is under cursor
" '[g' go to previous error
" ']g' go to next error
" ',d' show list of errors
" ',a' show list of code actions
" ',r' rename
nnoremap <silent> <leader>k :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<CR>
nmap <leader>a <Plug>(coc-codeaction)
nmap <leader>r <Plug>(coc-rename)

" Ultimate Vim TypeScript keymaps
" ',1' - reload .vimrc
" ',2' - reload .vimrc and install any plugins
nnoremap <silent><leader>1 :source ~/.vimrc<CR>
nnoremap <silent><leader>2 :source ~/.vimrc \| :PlugInstall<CR>

" Nerd Tree keymap
nnoremap <C-n> :NERDTreeToggle<CR>

" FZF Search Keymaps
nnoremap <leader>f :Ag<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>p :Buffers<CR>

" My standard keymaps
inoremap jk <ESC>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap <space> zz
nnoremap <CR> :nohlsearch<CR>

"--- Settings ---"
set textwidth=80
set termguicolors
set hlsearch				" highlight searches
set nowrap 					" don't wrap lines
set autoindent 			" set autoindenting on
set copyindent			" copy the previous indention on autoindenting
set ignorecase			" ignore case when searching
set smartcase				" ignore case when all lowercase, otherwise use case
set smarttab				" inserts tabs on the start of a line according to shiftwidth
set history=1000		" remember more
set undolevels=1000 " more undo
set wildignore=*.swp,*.bak
set visualbell			" don't beep
set noerrorbells		" don't beep
set number					" show current line number
set relativenumber  " show relative line numbers

" tab settings
set tabstop=2				" tabs are 2 spaces
set shiftwidth=2		" number of spaces to use for autoindenting
set expandtab

" no backup files
set nobackup
set noswapfile

