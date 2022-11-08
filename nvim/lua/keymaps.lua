vim.g.mapleader = ";"

function Map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local builtin = require('telescope.builtin')
Map("n", "<leader>w", "<cmd>set wrap! wrap?<cr>", { silent = true })
Map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
Map("n", "<leader>fh", "<cmd>Telescope find_files hidden=true<cr>", { silent = true })
Map("n", "<leader>fd", "<cmd>Telescope live_grep<cr>", { silent = true })

-- Swap between current and last buffer
Map("n", "<leader>bb", "<C-^>", { silent = true })
-- close buffer
Map("n", "<leader>bd", "<cmd>bd<cr>", { silent = true })
-- kill buffer
Map("n", "<leader>bk", "<cmd>bd!<cr>", { silent = true })
-- list buffers
Map("n", "<leader>bl", "<cmd>ls<cr>", { silent = true })
-- list and select buffer
Map("n", "<leader>bg", "<cmd>ls<cr>:buffer", { silent = true })
-- move line up or down by 1
Map("n", "<C-j>", "<cmd>m .+1<cr>", { silent = true })
Map("n", "<C-k>", "<cmd>m .-2<cr>", { silent = true })

-- nvim-tree mappings
Map("n", "<leader>ww", "<cmd>NvimTreeToggle<cr>", { silent = true })
Map("n", "<leader>ee", "<cmd>NvimTreeFindFile<cr>", { silent = true })
Map("n", "<leader>we", "<cmd>NvimTreeFocus<cr>", { silent = true })

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

local on_attach = function(_client, bufnr)
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
  buf_set_keymap('n', 'go', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

end

local rt = require('rust-tools')
rt.setup({
    server = {
        on_attach = on_attach,
        ['rust-analyzer'] = {
            checkOnSave = {
                command = "clippy"
            }
        }
    }
})

require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

local servers = { 'solargraph', 'gopls' }
for _, lsp in pairs(servers) do 
    require('lspconfig')[lsp].setup{
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150
        }
    } 
end
