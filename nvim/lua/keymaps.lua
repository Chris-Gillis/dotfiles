vim.g.mapleader = ';'
vim.g.maplocalleader = ' '

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

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
 require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
