local D = require("trak.dbfunc")
local U = require("trak.utils")
local T = {}

local usr_input_list = {
  'project',
  'tag',
  'category',
  'billable'
}

function T.create_session(t)
  local r = {}
  for _, k in pairs(t) do
    local v = vim.fn.input(string.format("%s: ", k))
    r[k] = v
    assert(r.project ~= '', "You should provide a name for the session")
  end
  r = vim.tbl_deep_extend('keep', r, U.record)
  return r
end

function T.start()
  D.init_db()


  local db = U.json_decode()

  -- This should be investigated.
  -- It works as intented:
  --  if project.end is empty should raise an error.
  -- I don't understand how assert read this...
  --  assert raise an error if expression is false...
  -- why raise an error now?
  assert(db[#db]['end'] ~= '',
    string.format("You have the %s session in progress. Please stop that before start a new one!", db[#db]['project']))

  local r = T.create_session(usr_input_list)
  local t = vim.tbl_deep_extend('keep', r, U.record)

  table.insert(db, t)
  D.dinsert(db)
end

function T.stop()
  D.dupdate()
end

return T
