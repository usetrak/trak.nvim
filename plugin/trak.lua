local T = require("trak.init")
local A = vim.api


A.nvim_create_user_command('TrakStart', function() T.start() end, { desc = "Start a Trak session" })
A.nvim_create_user_command('TrakStop', function() T.stop() end, { desc = "Stop a Trak session" })
