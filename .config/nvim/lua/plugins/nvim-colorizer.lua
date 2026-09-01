return {
    enabled = true,
    "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                "*", -- Enable for shell scripts
                -- or use "*" for all filetypes
            }, {
                RGB = true,      -- #RGB hex codes
                RRGGBB = true,   -- #RRGGBB hex codes
                names = true,    -- "Red", "Blue", etc.
                mode = "background", -- or "foreground" / "virtualtext"
            })
    end,
}
