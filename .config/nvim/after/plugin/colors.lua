function ColorMyPencils()
    color = color or "onenord"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeotreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeotreeNormalNC", { bg = "none" })
end

ColorMyPencils()
