local util = require("trak.util")
local config = require("trak.config")

local Trak = {}

function Trak.setup(options)
  if vim.fn.has("nvim-0.7.2") == 0 then
    util.error("Trak needs Neovim >= 0.7.2")
    return
  end

  config.setup(options)
end

Trak.status = function()
  local getStatus = function()
    local output = vim.fn.system("trak status -s")
    print(output)
  end

  vim.api.nvim_create_user_command("TrakStatus", getStatus, {})
end

return Trak
