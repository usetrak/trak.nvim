-- local util = require("trak.util")
-- local popup = require("trak.ui.popup")
local config = require("trak.config")

local trak = {}

trak.status = function()
  local output = vim.fn.system("trak status -s")
  print(output)
end

trak.report = function(flags)
  return function()
    local project_id = vim.fn.input("Project id: ")
    if project_id then
      local output = vim.fn.system(string.format("trak report project %s %s", project_id, flags))
      print(output)
    end
  end
end

trak.report_all = function()
  local output = vim.fn.system("trak report project all --today")
  print(output)
end

local function bind_command()
  vim.api.nvim_create_user_command(
    "TrakStatus",
    trak.status,
    { desc = "Show the status of the current session.", nargs = "*" }
  )
  vim.api.nvim_create_user_command(
    "TrakReportProject",
    trak.report(""),
    { desc = "Show the report for a project.", nargs = "*" }
  )
  vim.api.nvim_create_user_command(
    "TrakReportProjectMonth",
    trak.report("--month"),
    { desc = "Show the monthly report for a project.", nargs = "*" }
  )
  vim.api.nvim_create_user_command(
    "TrakReportProjectWeek",
    trak.report("--week"),
    { desc = "Show the weekly report for a project.", nargs = "*" }
  )
  vim.api.nvim_create_user_command(
    "TrakReportProjectToday",
    trak.report("--today"),
    { desc = "Show the today report for a project.", nargs = "*" }
  )
  vim.api.nvim_create_user_command(
    "TrakReportAll",
    trak.report_all,
    { desc = "Show the report for all projects you worked on today.", nargs = "*" }
  )
end

function trak.setup(options)
  config.setup(options)
  bind_command()
end

return trak
