local M = {}

M.error = function(msg)
  vim.notify(msg, vim.log.levels.ERROR, { title = "Trak" })
end

M.to_dict = function(text)
  local lines = {}

  for line in text:gmatch("[^\r\n]+") do
    line = line:gsub("%.txt", "")
    table.insert(lines, line)
  end

  return lines
end

return M
