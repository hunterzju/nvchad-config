-- 在 custom/mappings.lua 文件中
local map = require("core.utils").map

-- 将 'cf' 映射为复制当前文件路径到剪贴板的命令
map("n", "cf", "let @+ = expand('%:t') | call system('xsel --clipboard', @+)<CR>", {silent = true})

