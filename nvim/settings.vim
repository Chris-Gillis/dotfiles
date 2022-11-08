
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber
set nowrap                  " Disable line wrapping
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set ruler                   " enable line and column display
set autoread

" Make it easier to work with buffers
" http://vim.wikia.com/wiki/Easier_buffer_switching
set hidden
set confirm
set autowriteall
set wildmenu wildmode=full

" Set encoding for vim-devicons
set encoding=UTF-8

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=150

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

" Theme
set notermguicolors
syntax enable
colorscheme gruvbox
set background=dark

hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE

" Fixes lag when exiting insert/visual mode
if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        autocmd InsertEnter * set timeoutlen=0
        autocmd InsertLeave * set timeoutlen=1000
    augroup end
endif

" NerdComment
let g:NERDSpaceDelims = 1       " add space after comment
let g:NERDCompactSexyComs = 1   " short syntax in comment blocks

set splitright
set splitbelow

" vim-closetag
let g:closetag_filenames = '*.html,*.html.erb,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml, *.js, *.jsx, *.tsx'
let g:closetag_filetypes = 'html,erb,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,tsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }


let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
