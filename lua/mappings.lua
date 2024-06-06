require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- telescop key bindings 
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "telescope lsp_definitions" })
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "telescope lsp_references" })
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "telescope lsp_implementations" })

