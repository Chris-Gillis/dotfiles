function Map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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
