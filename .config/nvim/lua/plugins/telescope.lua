local actions = require("telescope.actions")

return {
    enabled = true,
    'nvim-telescope/telescope.nvim',
    dependencies = ('nvim-lua/plenary.nvim'),
    config = function()
        require('telescope').setup {
            defaults = {
                mappings = {
                    -- Insert mode
                    i = {
                      ["<C-j>"] = actions.move_selection_next,
                      ["<C-k>"] = actions.move_selection_previous,
                    },
                    -- Normal mode
                    n = {
                      ["j"] = actions.move_selection_next,
                      ["k"] = actions.move_selection_previous,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        }
        vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files, { desc = 'Telescope find files' })
        vim.keymap.set("n", "<leader>fg", require('telescope.builtin').git_files, { desc = 'Telescope find git files' })
        vim.keymap.set("n", "<leader>lg", require('telescope.builtin').live_grep, { desc = 'Telescope file ripgrep' })
    end
}
