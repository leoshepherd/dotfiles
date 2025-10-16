return {
    cmd = { 'lua-language-server' },

    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },

    filetypes = { 'lua' },

    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                },
            },
        },
    }
}

