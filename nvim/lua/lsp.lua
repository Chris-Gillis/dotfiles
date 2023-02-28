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

-- require('lspconfig').sumneko_lua.setup {
--     on_attach = on_attach,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- }

local servers = { 'gopls' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup{
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150
        }
    }
end
