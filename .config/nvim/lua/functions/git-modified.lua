function git_modified_to_quick_fix()
    local res = vim.fn.system("git status --porcelain | awk 'match($1, \"M\"){print $2}'")
    local modified = {}
    for index, entry in ipairs(vim.split(res, '\n')) do
        if not (entry == nil or entry == '') then
            table.insert(modified, { filename = entry, lnum= 1, type="I", text="Modified" })
        end
    end
    vim.fn.setqflist(modified, "r")
    vim.cmd.copen()
    return modified
end
