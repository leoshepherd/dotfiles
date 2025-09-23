vim.lsp.set_log_level('debug')

vim.lsp.enable({'java'})

vim.diagnostic.config({
    virtual_text = { current_line = true },
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = "󰰄 ",
            [vim.diagnostic.severity.HINT] = " ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarnMsg",
        },
    },
})


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    vim.keymap.set("n", "gd", function()
        vim.cmd("vsplit")
        vim.lsp.buf.definition()
    end, {silent=true, noremap=true})

    if client.supports_method('textDocument/completion') then
        local trigger = {};
        for i = 32, 126 do
            table.insert(trigger, string.char(i))
        end
        client.server_capabilities.completionProvider.triggerCharacters = trigger

        vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
    end

    if not client.supports_method('textDocument/willSaveWaitUntil')
        and client.supports_method('textDocument/formatting') then
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
        })
    end
  end,
})
