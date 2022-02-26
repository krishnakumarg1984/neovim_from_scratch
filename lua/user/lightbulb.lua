-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, lightbulb = pcall(require, "nvim-lightbulb")
if not status_ok then
  return
end

lightbulb.setup {
  sign = { enabled = false },
  virtual_text = { enabled = true },
}

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
