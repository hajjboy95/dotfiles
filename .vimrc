set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set hlsearch
set background=dark
set cursorline
set ignorecase
set autoread
set encoding=UTF-8
set t_Co=256
set mouse=a
set colorcolumn=120


highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10


filetype plugin on
syntax enable

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
" Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'mhinz/vim-signify'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-fugitive'
" Plug 'psliwka/vim-smoothie'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

"Gruvbox setup
" autocmd vimenter * ++nested colorscheme gruvbox
" colorscheme gruvbox
"let g:airline_theme='gruvbox'

" onehalflightsetup
colorscheme  onehalfdark
let g:airline_theme='onehalfdark'

let mapleader=";"

"NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nnoremap <Leader>f :NERDTreeFind<cr>


"custom mapping
nnoremap <C-P> :GFiles<cr>
nnoremap <C-J> <C-W>j
nnoremap<C-K> <C-W>k
nnoremap<C-l> <C-W>l
nnoremap<C-h> <C-W>h
nnoremap<C-@> <C-6s

"vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"leader commands
nnoremap <Leader>' :bprev<cr>
nnoremap <Leader>\ :bnext<cr>
nnoremap <leader>w :bp<bar>sp<bar>bn<bar>bd<CR>

"vimtest shortcuts
nnoremap <Leader>tf :TestFile<cr>
nnoremap <Leader>tn :TestNearest<cr>
nnoremap <Leader>ts :TestSuite<cr>

"ack vim setup
"Use ripgrep for searching as its faster then the default need to have ripgrep
"installed `brew install ripgrep`
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case --hidden'
let g:ack_use_cword_for_empty_search = 1
cnoreabbrev Ack Ack! " Don't jump to first match
nnoremap <Leader>s :Ack!<Space>

"goto for coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_global_extension = [
                \'coc-eslint',
                \'coc-json',
                \'coc-pairs',
                \'coc-tsserver',
                \'coc-css',
                \'coc-yank'
\]

" \'coc-highlight',
    

"coc-yank 
nnoremap <silent> <C-y>  :<C-u>CocList -A --normal yank<cr>

" "coc-highlight setup
" autocmd CursorHold * silent call CocActionAsync('highlight')

"turn off the bell sound
autocmd GUIEnter * set vb t_vb=
set belloff=all

"undotree
if has('persistent_undo')
    " define a path to store persistent_undo files.
    let target_path = expand('~/.config/vim-persisted-undo/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
    " finally, enable undo persistence.
    set undofile
endif

nnoremap <Leader>u :UndotreeToggle<cr>

" ale setuo
let g:ale_linters = {
\   'javascript': ['standard'],
\   'typescript': ['prettier']
\}
let g:ale_fixers = {'javascript': ['standard'] }
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1


