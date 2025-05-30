local Plug = vim.fn['plug#']

vim.call('plug#begin')
    Plug('dracula/vim', { as = 'dracula' })
    Plug('nvim-treesitter/nvim-treesitter', { ["do"] = ':TSUpdate' })
    Plug('neoclide/coc.nvim', { branch = 'release' })
    Plug('catppuccin/nvim', { as = 'catppuccin' })
    Plug('rebelot/kanagawa.nvim', { as = 'kanagawa' })
    Plug('andersevenrud/nordic.nvim', { as = 'nordic' })
    Plug('folke/tokyonight.nvim', { as = 'tokyonight' })
    Plug 'projekt0n/caret.nvim'
    Plug 'shaunsingh/nord.nvim'
    Plug 'sainnhe/everforest'
vim.call('plug#end')
