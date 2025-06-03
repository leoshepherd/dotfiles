local keyset = vim.keymap.set

keyset("n", "<space>e", ":CocCommand explorer<cr>")
keyset("n", "<space>b", ":CocCommand git.showBlameDoc<cr>")
keyset("n", "<space>o", ":copen<cr>")
keyset("n", "<space>c", ":cclose<cr>")
keyset("n", "<space>d", ":cexpr []<cr>")
keyset("n", "<space>h", ":noh<cr>")
keyset("n", "<space>m", git_modified_to_quick_fix)
keyset("n", "<space>f", ":call GradleFailures()<cr>")
keyset("n", "<space>t", open_floating_terminal)
keyset("n", "<M-h>", "<C-w>h")
keyset("n", "<M-j>", "<C-w>j")
keyset("n", "<M-k>", "<C-w>k")
keyset("n", "<M-l>", "<C-w>l")

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
