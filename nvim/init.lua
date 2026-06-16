vim.opt.clipboard = "unnamedplus"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = true         
vim.opt.signcolumn = "yes"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true 
vim.opt.termguicolors = true

-- move selected lines up and down with shift+j and shift+k in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
