local M = {}

M.namespace = vim.api.nvim_create_namespace("Trak")

local defaults = {}

M.options = {}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

M.setup()

return M
