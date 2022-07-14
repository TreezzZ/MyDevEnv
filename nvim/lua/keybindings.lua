-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Reserve to local variables
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

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
    { key = {"<CR>", "o"}, action = "edit" },

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
map("n", "<C-h>", ":BufferlineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferlineCycleNext<CR>", opt)

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


return plugin_keys
