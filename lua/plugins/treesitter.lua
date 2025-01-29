require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "typescript",  -- For TypeScript in both React and Angular
    "javascript",  -- For JavaScript in React
    "tsx",         -- For JSX/TSX in React
    "html",        -- For HTML templates in both React and Angular
    "css",         -- For CSS styles in both React and Angular
    "angular",     -- For Angular templates (if available)
    "json",        -- Useful for package.json, tsconfig.json, etc.
  },

  sync_install = false,  -- Don't wait for the parser to finish installing before starting Neovim
  auto_install = true,   -- Automatically install missing parsers when opening a file
  highlight = {
    enable = true,  -- Enable Treesitter syntax highlighting
    additional_vim_regex_highlighting = false,  -- Disable regex-based highlighting to avoid conflicts
  },

  -- If you want to enable other features, you can configure them here (e.g., indent, rainbow, etc.)
}
