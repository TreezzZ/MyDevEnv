require('basic')
require('keybindings')
require('plugins')
require('colorscheme')

-------- Plugin Configurations ------
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.project')
require('plugin-config.nvim-treesitter')
require('plugin-config.indent-blankline')

-------- LSP -----------
require('lsp.setup')
require('lsp.cmp')
require('lsp.null-ls')

-------- DAP ----------
require('dap.vimspector')
