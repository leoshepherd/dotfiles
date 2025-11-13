local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

keyset("n", "<M-h>", "<C-w>h")
keyset("n", "<M-j>", "<C-w>j")
keyset("n", "<M-k>", "<C-w>k")
keyset("n", "<M-l>", "<C-w>l")

if require('plugins.coc').completion then
    -- Use Tab for trigger completion with characters ahead and navigate
    -- NOTE: There's always a completion item selected by default, you may want to enable
    -- no select by setting `"suggest.noselect": true` in your configuration file
    -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
    -- other plugins before putting this into your config
    keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
    keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
    keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
    keyset("n", "<space>k", show_docs)

    keyset("n", "<space>r", "<Plug>(coc-references)")

    keyset("n", "gd", ":call CocAction('jumpDefinition', 'vsplit')<cr>")

    keyset("n", "<space>n", "<Plug>(coc-rename)")
else
    keyset("i", "<TAB>", [[pumvisible() ? "\<C-n>" : "\<TAB>"]], opts)
    keyset("i", "<S-TAB>", [[pumvisible() ? "\<C-p>" : "\<C-h>"]], opts)
    keyset("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], opts)
    if require('plugins.telescope').enabled then
        keyset("n", "<space>r", "Telescope lsp_references<cr>")
        keyset("n", "<space>r", "Telescope lsp_implementations<cr>")
    else
        keyset("n", "<space>r", vim.lsp.buf.references)
    end
end

if require('plugins.neotree') and require('plugins.neotree').enabled then
    keyset("n", "<space>e", ':Neotree toggle reveal=true position=left<cr>')
end

if require('plugins.gitsigns') and require('plugins.gitsigns').enabled then
    keyset("n", "<space>b", ":Gitsign blame_line<cr>")
end

if require('plugins.coc').enabled then
    keyset("n", "<space>e", ":CocCommand explorer<cr>")
    keyset("n", "<space>b", ":CocCommand git.showBlameDoc<cr>")
end

if require("plugins.telescope").enabled then
    -- Telescope keybinds
    keyset("n", "<space>ff", require('telescope.builtin').find_files, { desc = 'Telescope find files' })
    keyset("n", "<space>fg", require('telescope.builtin').git_files, { desc = 'Telescope find git files' })
    keyset("n", "<space>lg", require('telescope.builtin').live_grep, { desc = 'Telescope file ripgrep' })
end

keyset("n", "<space>o", ":copen<cr>")
keyset("n", "<space>c", ":cclose<cr>")
keyset("n", "<space>d", ":cexpr []<cr>")
keyset("n", "<space>h", ":noh<cr>")
keyset("n", "<space>m", git_modified_to_quick_fix)
--keyset("n", "<space>f", ":call GradleFailures()<cr>")
keyset("n", "<space>t", open_floating_terminal)
-- Double tap Escape to leave terminal insert
keyset("t", "<esc><esc>", "<c-\\><c-n>")
