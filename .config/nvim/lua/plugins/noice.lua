return {
    enabled = true,
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = { false
    },
    dependencies = {
        {
            "MunifTanjim/nui.nvim",
        },
        {
            "rcarriga/nvim-notify",
        },
    },
    config = function()
        require("noice").setup {
            presets = {
            }
        }
    end
}
