local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("Can not find nvim-treesitter")
    return
end

treesitter.setup({
    ensure_installed = { "json", "vim", "lua", "python", "bibtex", "latex" },
    highlight = {
        enable = true,
        additional_vim_regex_highlightning = false,
    },
    incremental_selection = {
    enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },
    indent = {
        enable = true,
    },
})

-- Fold code
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
