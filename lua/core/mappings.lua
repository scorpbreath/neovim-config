vim.g.mapleader = " "

--NeoTree
-- vim.keymap.set('n', '<leader>e', ':Neotree float focus<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree focus filesystem reveal<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')
vim.keymap.set('n', '<leader>c', ':Neotree close<CR>')

-- Other
vim.api.nvim_set_keymap('n', '<Leader>cp', ':let @+ = expand("%:p")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>re', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cl', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<Leader>ss', ':mksession! ' .. vim.fn.expand('%:p:h') .. '/.nvim_session<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>s', ':source ' .. vim.fn.expand('%:p:h') .. '/.nvim_session<CR>', { noremap = true, silent = true })
