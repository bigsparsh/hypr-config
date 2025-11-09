vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", {
	desc = "Saving current file",
})

vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Remove the highlighting after search or exit from currrent mode" })

vim.keymap.set("n", "<c-d>", "<c-d>zz", { desc = "go half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go Half Page Up" })

vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

vim.keymap.set("n", "h", "hzz", { desc = "Go Left" })
vim.keymap.set("n", "j", "jzz", { desc = "Go Down" })
vim.keymap.set("n", "k", "kzz", { desc = "Go Up" })
vim.keymap.set("n", "l", "lzz", { desc = "Go Right" })

vim.keymap.set("n", "<C-f>o", "<cmd>FlutterOutlineToggle<CR>", { desc = "Toggle Flutter Outline" })
vim.keymap.set("n", "<C-f>r", "<cmd>FlutterRun<CR>", { desc = "Run Flutter Application" })
vim.keymap.set("n", "<C-f>l", "<cmd>FlutterLogToggle<CR>", { desc = "Toggle Flutter Logs" })

vim.keymap.set("n", "<leader>lf", function()
	vim.diagnostic.open_float()
end, {
	desc = "Removing current Buffer",
})

vim.keymap.set("n", "<tab>", "<cmd>bn<CR>", {
	desc = "Switching to next buffer",
})

vim.keymap.set("n", "<S-tab>", "<cmd>bp<CR>", {
	desc = "Switching to previous buffer",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
	desc = "Move to right window",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
	desc = "Move to top window",
})

vim.keymap.set("n", "<C-h>", "<C-w>h", {
	desc = "Move to bottom window",
})

vim.keymap.set("n", "<C-h>", "<C-w>h", {
	desc = "Move to left window",
})

vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle right<CR>", {
	desc = "Toggle Neotree on right",
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
