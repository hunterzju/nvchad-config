require "nvchad.mappings"

-- add yours here

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- telescop key bindings 
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "telescope lsp_definitions" })
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "telescope lsp_references" })
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "telescope lsp_implementations" })

-- map clipbaord
map("n", "cf", ":call system('xsel --clipboard', @%)<CR>", { desc = "copy filename to system clipboard" })

