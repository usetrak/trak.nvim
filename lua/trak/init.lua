local util = require("trak.util")
local config = require("trak.config")
local popup = require("trak.ui.popup")

local trak = {}

trak.status = function()
  local output = vim.fn.system("trak status -s")
  print(output)
end

trak.report = function()
  local output = vim.fn.system("trak report projects")
  print(output)
end

local function bind_command()
  vim.api.nvim_create_user_command(
    "TrakStatus",
    trak.status,
    { desc = "Show the status of the current session.", nargs = "*" }
  )
  vim.api.nvim_create_user_command(
    "TrakReportAll",
    trak.report,
    { desc = "Show the report for all projects.", nargs = "*" }
  )
end

function trak.setup(options)
  config.setup(options)
  bind_command()
end

return trak
