local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("Can not find lualine")
    return
end

lualine.setup({
    options = {
        theme = "tokyonight",
        component_separators = { left = "|", right = "|" },
    },
    extensions = {
        "nvim-tree",
        "toggleterm",
    },
})
