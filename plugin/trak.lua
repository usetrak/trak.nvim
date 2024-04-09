if vim.fn.has("nvim-0.9.5") == 0 then
  vim.api.nvim_err_writeln("trak.nvim requires at least nvim-0.9.5")
  return
end
