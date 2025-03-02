local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Sntup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {
  settings = {
    python = {
      pythonPath = '/home/marius/.venv/bin/python3', -- Убедитесь, что путь к виртуальной среде правильный
      analysis = {
        diagnosticSeverityOverrides = {
          reportAttributeAccessIssue = "warning", -- Отключаем предупреждения по доступу к атрибутам
          reportOptionalMemberAccess = "warning", -- Отключаем предупреждения по опциональным членам
          reportCallIssue = "warning",
          reportReturnType = "warning",
          reportAssignmentType = "warning",
          reportArgumentType = "warning",
          reportIncompatibleVariableOverride = "warning",
          reportIncompatibleMethodOverride = "warning",
        }
      }
    }
  }
}
lspconfig.gopls.setup {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" }, -- Подключаем Go и Go modules
  root_dir = lspconfig.util.root_pattern("go.mod", ".git"), -- Ищем корень проекта по go.mod или .git
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,  -- Анализ unusedparams для предупреждения
      },
      staticcheck = true,  -- Включаем статическую проверку
    },
  },
}
lspconfig.ts_ls.setup {}
lspconfig.cssls.setup {
  capabilities = capabilities
}

lspconfig.stylelint_lsp.setup {}
-- lspconfig.golangci_lint_ls.setup {}
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
      },
    },
  },
}

lspconfig.html.setup {
  cmd = { "vscode-html-language-server", "--stdio" },
}
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

    vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>re', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cl', '<cmd>lua vim.diagnostic.setloclist()<CR>',
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>',
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>',
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
  end
})
