local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("Can not find nvim-tree")
    return
end

local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    -- Do not show git
    git = { 
        enable = false, 
    },

    -- Configure for project.nvim
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },

    -- Hide files
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },

    view = {
        width = 20,
        side = 'left',
        hide_root_folder = true,

        -- Do not show line no.
        number = false,
        relativenumber = false,

        signcolumn = 'yes', -- Show icons

        -- Custom keybindings
        mappings = {
            custom_only = false,
            list = list_keys,
        },
    },

    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = true,
        },
    },
})

-- Auto close
vim.cmd([[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
