return {
   enabled = true,
   'nvim-telescope/telescope.nvim',
   tag = '0.1.8',
   dependencies = ('nvim-lua/plenary.nvim'),
   config = function()
       require('telescope').setup {
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
