-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
  return
end

fidget.setup({})
