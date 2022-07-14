local status, project = pcall(require, "project_nvim")
if not status then
    vim.notify("can not find project.nvim")
    return
end

-- Support nvim-tree
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
    detection_methods = { "pattern" },
    patterns = { ".git" },
})

local status, telescope = pcall(require, "telescope")
if not status then
    vim.notify("Can not find telescope")
    return
end

pcall(telescope.load_extension, "projects")
