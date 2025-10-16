local vim = _G.vim
-- enable treesitter syntax highlighting on vim startup
vim.cmd [[autocmd VimEnter * TSEnable highlight]]
vim.o.showmatch      = true -- show matching
vim.o.ignorecase     = true -- case insensitive
vim.o.smartcase      = true -- smart case search
vim.o.hlsearch       = true -- highlight search
vim.o.tabstop        = 4    -- number of columns occupied by a tab
vim.o.softtabstop    = 4    -- see multiple spaces as tabstops so <BS> does the right thing
vim.o.expandtab      = true -- converts tabs to white space
vim.o.shiftwidth     = 4    -- width for autoindents
vim.o.autoindent     = true -- indent a new line the same amount as the line just typed
vim.o.number         = true -- add line numbers
vim.o.relativenumber = true -- add line numbers
vim.o.wildmenu       = true
--vim.o.cc = '80'                      -- set an 80 column border for good coding style
vim.o.splitright     = true
vim.cmd [[filetype plugin indent on]] -- allow auto-indenting depending on file type
vim.o.clipboard = unnamedplus        -- using system clipboard
vim.o.ttyfast = true                 -- Speed up scrolling in Vim
--completion options for popup menu for builtin LSP
vim.o.cot = "fuzzy,menu,menuone,noinsert,popup,noselect"
