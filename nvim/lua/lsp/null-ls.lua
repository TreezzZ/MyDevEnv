local status, null_ls = pcall(require, "null-ls")
if not status then
    vim.notify("Can not find null-ls")
    return
end

local formatting = null_ls.builtins.formatting
null_ls.setup({
    debug = false,
    sources = {
        formatting.black.with { extra_args = { "--fast" } },
        formatting.isort,
    },
    on_attach = function(client)
        if client.server_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
        end
    end,
})
