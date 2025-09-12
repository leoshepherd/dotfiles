vim.api.nvim_create_autocmd('LspProgress', {
    callback = function(args)
        vim.g.lsp_status = vim.lsp.status()
    end
})
