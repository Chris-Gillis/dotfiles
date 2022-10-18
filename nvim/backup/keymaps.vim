" Remap leader key
let mapleader=";"

nnoremap <silent> <leader>w :set wrap! wrap?<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fd <cmd>Telescope live_grep<cr>
" Swap between current and last buffer
nnoremap <silent> <leader>bb <C-^>
" go to next buffer
nnoremap <silent> <leader>bn :bn<CR>
" go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>
" close buffer
nnoremap <silent> <leader>bd :bd<CR>
" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>
" list buffers
nnoremap <silent> <leader>bl :ls<CR>
" list and select buffer
nnoremap <silent> <leader>bg :ls<CR>:buffer
" Horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>
" Vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>
" Turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" move line up or down by 1
nnoremap <C-j> <Esc>:m .+1<CR>
nnoremap <C-k> <Esc>:m .-2<CR>

lua <<EOF
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

end

local servers = { 'solargraph', 'gopls' }
for _, lsp in pairs(servers) do 
    require('lspconfig')[lsp].setup{
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150
        }
    } 
end
