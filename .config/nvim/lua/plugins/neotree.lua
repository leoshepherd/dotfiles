local function recursive_dir_expansion(state, node, max_depth)
    local fs = require('neo-tree.sources.filesystem')
    local max_depth_reached = 1
    local stack = { node }
    while next(stack) ~= nil do
        node = table.remove(stack)
        if node.type == 'directory' then
            fs.toggle_directory(state, node, nil, true, false)
            vim.wait(20)
        end

        local depth = node:get_depth()
        max_depth_reached = math.max(depth, max_depth_reached)

        if not max_depth or depth < max_depth - 1 then
            local children = state.tree:get_nodes(node:get_id())
            for _, v in ipairs(children) do
                table.insert(stack, v)
            end
        end
    end
    return max_depth_reached
end

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
                ['L'] = function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    if node.type == 'directory' then
                        recursive_dir_expansion(state, node, 100)
                        require('neo-tree.ui.renderer').redraw(state)
                    else
                        require('neo-tree.utils').open_file(state, path)
                    end
                end,
                ['<cr>'] = function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    if node.type == 'directory' then
                        vim.api.nvim_set_current_dir(path)
                    else
                        require('neo-tree.utils').open_file(state, path)
                    end
                end,
                ['h'] = 'close_node',
                ['H'] = 'close_all_subnodes',
                ['e'] = 'open_vsplit',
                ['E'] = 'open_vsplit',
                ['g.'] = 'toggle_hidden',
                ['d'] = 'noop',
                ['df'] = 'delete',
                ['a'] = { 'add', config = { show_path = 'relative' } },
                ['A'] = { 'add_directory', config = { show_path = 'relative' } },
            },
        },
    },
}
