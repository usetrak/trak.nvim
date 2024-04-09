-- TODO: It does not work, help 🥹

local popup = require("plenary.popup")

local Win_id

local M = {}

M.show_popup = function(content)
  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

  local HEIGHT_RATIO = 0.8
  local WIDTH_RATIO = 0.3

  local screen_w = vim.opt.columns:get()
  local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
  local window_w = screen_w * WIDTH_RATIO
  local window_h = screen_h * HEIGHT_RATIO
  local window_w_int = math.floor(window_w)
  local window_h_int = math.floor(window_h)
  local center_x = (screen_w - window_w) / 2
  local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

  local head = table.remove(content, 1)
  local win_id = popup.create(content, {
    line = center_y,
    col = center_x,
    width = window_w_int,
    height = window_h_int,
    minwidth = window_w_int,
    minheight = window_h_int,
    borderchars = borderchars,
    title = head,
  })

  local bufnr = vim.api.nvim_win_get_buf(win_id)
end

return M
