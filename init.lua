-- Basic
require("core.plugins")
require("core.mappings")
require("core.configs")

-- Plugins
require("plugins.neotree")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.github-theme")
require("plugins.cmp")
require("plugins.mason")
require("plugins.telescope")
require("plugins.nullls")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.comment")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("AWStart")
  end
})

vim.g.startify_custom_header = {
    '  ╔╗╔╗╔══╗',
    '  ║║║║╚═╗║',
    '  ║╚╝║╔═╝║',
    '  ╚═╗║║╔═╝',
    '    ║║║╚═╗',
    '    ╚╝╚══╝',
}
