local opts = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    },
    single_file_support = true,
    on_attach = function(client, bufnr)
        -- Disable formatting, we use specific plugins
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        require('keybindings').mapLSP(buf_set_keymap)

        -- Format when saving
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    end,
}

return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
