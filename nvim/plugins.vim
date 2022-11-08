
call plug#begin("~/.vim/plugged")
	" Theme
	Plug 'dracula/vim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'ellisonleao/gruvbox.nvim'

	" Misc
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'beauwilliams/statusline.lua'
    Plug 'tveskag/nvim-blame-line'
    Plug 'petertriho/nvim-scrollbar'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'alvan/vim-closetag'
    Plug 'preservim/nerdcommenter'
    Plug 'windwp/nvim-autopairs'        

    " Golang
    Plug 'fatih/vim-go'

    " Ruby
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'vinibispo/ruby.nvim'
    Plug 'tpope/vim-rails'

    " Rust
    Plug 'simrat39/rust-tools.nvim'

    " Typescript
    Plug 'leafgarland/typescript-vim'

    " Debugging
    Plug 'mfussenegger/nvim-dap'
    " File searching - for now using telescope and fzf + ripgrep
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Prisma
    Plug 'pantharshit00/vim-prisma'

    " LSP support 
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'prabirshrestha/vim-lsp'

    " Autocomplete
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'

    " Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'

    Plug 'VonHeikemen/lsp-zero.nvim'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    Plug 'folke/trouble.nvim'

    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'
call plug#end()
