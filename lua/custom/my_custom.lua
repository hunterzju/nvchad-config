-- 将当前文件名复制到剪贴板的函数
-- local function copy_filename_to_clipboard()
--   local filename = vim.fn.expand('%:t') -- 获取当前文件名
--   vim.fn.setreg('+', filename) -- 复制到剪贴板
-- end

-- 将函数绑定到快捷键
-- vim.api.nvim_set_keymap('n', '<leader>cf', ':lua copy_filename_to_clipboard()<CR>', { noremap = true, silent = true })

-- load workspace config if exists
vim.o.exrc = true
-- local workconfig = vim.fn.getcwd() .. '/.workspace.lua';
-- local workconfig_exists = vim.fn.filewritable(workconfig)
-- if workconfig_exists == 1 then
--   package.path = package.path..";"..workconfig
--   require('.workspace.lua')
-- end

-- dap config
local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end


-- local dap = require('dap')
-- dap.adapters.python = function(cb, config)
--   if config.request == 'attach' then
--     ---@diagnostic disable-next-line: undefined-field
--     local port = (config.connect or config).port
--     ---@diagnostic disable-next-line: undefined-field
--     local host = (config.connect or config).host or '127.0.0.1'
--     cb({
--       type = 'server',
--       port = assert(port, '`connect.port` is required for a python `attach` configuration'),
--       host = host,
--       options = {
--         source_filetype = 'python',
--       },
--     })
--   else
--     cb({
--       type = 'executable',
--       command = '/usr/bin/python3',
--       args = { '-m', 'debugpy.adapter' },
--       options = {
--         source_filetype = 'python',
--       },
--     })
--   end
-- end

-- require("dap-python").setup("python")

vim.api.nvim_set_keymap('n', '<leader>db', ':lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>b', ':lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
