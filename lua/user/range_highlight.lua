-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, range_highlight = pcall(require, "range-highlight")
if not status_ok then
  return
end

range_highlight.setup({})
