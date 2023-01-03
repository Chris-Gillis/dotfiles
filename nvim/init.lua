vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('source ~/.config/nvim/plugins.vim')
vim.cmd('source ~/.config/nvim/settings.vim')
-- Enable nvim-blame-line
vim.cmd([[
    autocmd BufEnter * EnableBlameLine
]])

-- Ruby / Rails Settings
vim.cmd([[
    autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
    autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
]])

-- React stuff
-- Enable code folding
vim.cmd([[
    augroup javascript_folding
        au!
        au FileType javascript setlocal foldmethod=syntax
    augroup END
]])

-- Set file types for vim-jsx-typescript
vim.cmd([[
    autocmd BufNewFile,BufRead *.tsx,*.jsx,*.ts set filetype=typescriptreact
    autocmd FileType go autocmd BufWritePre <buffer> GoFmt
    autocmd FileType prisma autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
]])

require("trouble").setup{}
require('nvim-autopairs').setup{}
-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

require('keymaps')
require('setup')
require('diagnostics')
