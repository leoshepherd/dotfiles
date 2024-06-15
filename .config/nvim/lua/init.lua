--local status_ok, configs = pcall(require, "nvim-treesitter.configs")
--if not status_ok then
--    return
--end
--
--configs.setup() {
--    ensure_installed = "maintained",
--    sync_install = false,
--    highlight = {
--        enable = true,
--        disable = {""},
--        additional_vim_regex_highlighting = true,
--    },
--    indent = { enable = true, disable = { "yaml" } },
--}-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
return
end-- configure treesitter
treesitter.setup({
-- enable syntax highlighting
highlight = {
enable = true,
},
-- enable indentation
indent = { enable = true },
-- ensure these language parsers are installed
ensure_installed = {
"json",
"javascript",
"typescript",
"yaml",
"html",
"css",
"markdown",
"markdown_inline",
"bash",
"lua",
"vim"
},
-- auto install above language parsers
auto_install = true,
})

require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
})
