---@mod trak.config Config
local Config = {
  _ = {},
  config = {
    trak_folder = os.getenv('HOME') .. '/.trak',
    db_filepath = os.getenv('HOME') .. '/.trak/db.json',
    dev = { -- see: github.com/folke/lazy.nvim
      enabled = false,
      dev_trak_folder = "",
      dev_db_filepath = ""
    }
    -- config_file_path = '' -- TODO: FEATURE
  }
}

function Config:set(cfg)
  if cfg then
    self.config = vim.tbl_deep_extend('force', self.config, cfg)
  end
  return self
end

function Config:get() return self.config end

return setmetatable(Config, {
  __index = function(t, k)
    return t._[k]
  end,

  __newindex = function(t, k, v)
    t._[k] = v
  end
})
