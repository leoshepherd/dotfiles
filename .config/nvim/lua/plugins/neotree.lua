return {
    enabled = true,
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                      -- neo-tree will lazily load itsel
    opts = {
        popup_border_style = 'rounded',
        window = {
            position = 'left',
            width = 45,
            mappings = {
                ['l'] = 'open',
                ['h'] = 'close_node',
                ['H'] = 'close_all_subnodes',
                ['e'] = 'open_vsplit',
                ['E'] = 'open_vsplit',
                ['g.'] = 'toggle_hidden',
                ['a'] = { 'add', config = { show_path = 'relative' } },
                ['A'] = { 'add_directory', config = { show_path = 'relative' } },
            },
        },
    },
}
