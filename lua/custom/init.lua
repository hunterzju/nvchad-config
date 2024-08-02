-- 将当前文件名复制到剪贴板的函数
local function copy_filename_to_clipboard()
  local filename = vim.fn.expand('%:t') -- 获取当前文件名
  vim.fn.setreg('+', filename) -- 复制到剪贴板
end

-- 将函数绑定到快捷键
vim.api.nvim_set_keymap('n', '<leader>cf', ':lua copy_filename_to_clipboard()<CR>', { noremap = true, silent = true })

