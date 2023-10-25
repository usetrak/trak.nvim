local cfg = require("trak.config").config

local U = {}
-- os.date("%Y-%m-%dT%H:%M:%s")
---@class Record
---@field project string
---@field start osdate|string
---@field end osdate|string
---@field billable boolean
---@field category string|string[]
---@field tag string|string[]
---@type Record
U.record = {
  project = '',
  start = os.date("%Y-%m-%dT%H:%M:%s"),
  ['end'] = '',
  billable = false,
  tag = '',
  category = ''
}


--- Return a JSON formatted string from table
---@param t table
---@return string|nil
function U.json_encode(t)
  if not vim.tbl_isempty(t) then
    return vim.json.encode(t)
  end
end

--- Returns an array of tbl representing JSON object
---@param f string|nil
---@return table
function U.json_decode(f)
  f = f or cfg.db_filepath
  local rf = io.open(f, 'r'):read('*a')

  if rf ~= nil and rf ~= '' then
    return vim.json.decode(rf)
  else
    return {}
  end
end

return U
