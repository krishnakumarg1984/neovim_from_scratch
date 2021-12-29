-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
  return
end

zen_mode.setup({})
