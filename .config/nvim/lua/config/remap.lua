local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

keyset("n", "<M-h>", "<C-w>h")
keyset("n", "<M-j>", "<C-w>j")
keyset("n", "<M-k>", "<C-w>k")
keyset("n", "<M-l>", "<C-w>l")

keyset("i", "<TAB>", [[pumvisible() ? "\<C-n>" : "\<TAB>"]], opts)
keyset("i", "<S-TAB>", [[pumvisible() ? "\<C-p>" : "\<C-h>"]], opts)
keyset("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], opts)
keyset("n", "<space>r", vim.lsp.buf.references)

keyset("n", "<space>o", ":copen<cr>")
keyset("n", "<space>c", ":cclose<cr>")
keyset("n", "<space>d", ":cexpr []<cr>")
keyset("n", "<space>h", ":noh<cr>")
-- Double tap Escape to leave terminal insert
keyset("t", "<esc><esc>", "<c-\\><c-n>")
