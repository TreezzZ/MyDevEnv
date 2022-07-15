-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Reserve to local variables
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

------------ Basic --------------------
map("i", "jj", "<Esc>", opt)

------------ Window -------------------
-- Cancel default s
map("n", "s", "", opt)

-- Split window
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- Close current window
map("n", "sc", "<C-w>c", opt)

-- Close others window
map("n", "so", "<C-w>o", opt)

-- Using ALT + hjkl to switch between windows
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- Adjust window size
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-right>", ":vertical resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "s=", "<C-w>=", opt)

---------------------- Plugins keybindings ----------------------------------
local plugin_keys = {}

------ nvim-tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
plugin_keys.nvimTreeList = {
    -- Open file
    { key = { "<CR>", "o" }, action = "edit" },

    -- Enter upper directory
    { key = "u", action = "dir_up" },

    -- Open file on splited window
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },

    -- Show or hide filter
    { key = "<A-h>", action = "toggle_custom" },
    { key = "<A-.>", action = "toggle_dotfiles" },

    -- Operation
    { key = "<F5>", action = "refresh" },
    { key = "i", action = "create" },
    { key = "d", action = "remove" },
    { key = "<F2>", action = "remove" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
}

------ Bufferline
-- Switch left and right tab
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- Close tab
map("n", "<C-w>", ":Bdelete!<CR>", opt)

------ Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
plugin_keys.telescopeList = {
    i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        ["<C-c>"] = "close",
    },
}

------ LSP
plugin_keys.mapLSP = function(mapbuf)
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)

    -- Goto
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)

    -- Diagnostic
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)

    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()", opt)
end

------ Completion
plugin_keys.cmp = function(cmp)
    return {
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        -- ["<CR>"] = cmp.mapping.confirm({
        --     select = true,
        --     behavior = cmp.ConfirmBehavior.Replace
        -- }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    }
end

------ Vimspector
plugin_keys.mapVimspector = function()
    map("n", "<Leader>ds", ":call vimspector#Launch()<CR>", opt)
    map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
    map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
    map("n", "<Leader>db", ":call vimspector#ToggleBreakpoint()<CR>", opt)
    map("n", "<Leader>dcb", ":call vimspector#ClearBreakpoints()<CR>", opt)
    map("n", "<F10>", ":call vimspector#StepOver()<CR>", opt)
    map("n", "<F11>", ":call vimspector#StepInto()<CR>", opt)
    map("n", "<F12>", ":call vimspector#StepOut()<CR>", opt)
end

return plugin_keys
