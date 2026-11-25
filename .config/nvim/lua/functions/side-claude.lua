local vim = _G.vim
local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local function create_chat_window(opts)
    opts = opts or {}
    local win_width = vim.api.nvim_win_get_width(0)
    
    local width = math.floor(vim.o.columns * 0.25)
    local height = opts.height or math.floor(vim.o.lines)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = nil

    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local config = {
        relative = "win",
        anchor = "NE",      -- Anchors the top-right corner of the float
        width = width,
        height = height,
        col = win_width,    -- Right edge of the current window
        row = 0,            -- Top edge of the current window
        style = "minimal",
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, config)
    return { buf = buf, win = win }
end

function _G.open_chat_window()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_chat_window {buf = state.floating.buf}
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.term()
            vim.api.nvim_feedkeys("ollama launch claude --model qwen3.5:9b-64k --yes\n", "n", false)
        end
        vim.cmd.startinsert()
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.api.nvim_create_user_command("Sidechat", open_chat_window, {})

vim.keymap.set("n", "<leader>cl", open_chat_window )
