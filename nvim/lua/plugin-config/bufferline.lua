local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("Can not find bufferline")
    return
end


bufferline.setup({
    options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",

        -- For nvim-tree
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },

        -- Show erros by LSP
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
            end,
        },
}) 

