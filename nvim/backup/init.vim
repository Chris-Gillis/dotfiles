source ~/.config/nvim/plugins.vim 
source ~/.config/nvim/settings.vim 

" Enable nvim-blame-line
autocmd BufEnter * EnableBlameLine

" Ruby / Rails Settings
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" React stuff
" Enable code folding
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Set file types for vim-jsx-typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd FileType go autocmd BufWritePre <buffer> GoFmt
source ~/.config/nvim/lua/keymaps.lua

lua<<EOF
require('nvim-autopairs').setup{}
-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

require("trouble").setup{}
EOF

" load keymaps last to override any defaults
