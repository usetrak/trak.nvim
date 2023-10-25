local cfg = require("trak.config").config
local U = require("trak.utils")

local D = {}

function D.db_exists()
  return vim.fn.findfile(cfg.db_filepath)
end

---Initialize the db file using the filepath from config
---@return boolean
function D.init_db()
  if D.db_exists() == cfg.db_filepath then
    return true
  else
    io.open(cfg.db_filepath, 'w'):close()
    vim.notify(string.format("%s succesfully init!", cfg.db_filepath), vim.log.levels.INFO)
    return true
  end
end

---@param r Record[]
---@return boolean
function D.dinsert(r)
  local db = io.open(cfg.db_filepath, 'w')

  assert(db ~= nil, { msg = string.format('Failing insert new session in db, %s not found', cfg.db_filepath) })

  db:write(U.json_encode(r))
  db:close()
  return true
end

function D.dupdate()
  local db = U.json_decode(cfg.db_filepath)

  assert(db ~= nil, { msg = string.format('Failing update db, %s not found', cfg.db_filepath) })

  if db[#db]['end'] == '' then
    db[#db]['end'] = os.date("%Y-%m-%dT%H:%M:%s")

    if D.dinsert(db) then
      return true
    end
  end
  error('You don\'t have any active project!')
end

return D
