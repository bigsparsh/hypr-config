vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.cmd("highlight CursorLine gui=underline cterm=underline guibg=underline ")

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.cursorline = true
vim.opt.undofile = true

vim.opt.showmode = false
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = false
-- vim.opt.listchars = { tab = ' ', trail = '·', nbsp = '␣' }

vim.scrolloff = 15
vim.opt.cmdheight = 0

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
