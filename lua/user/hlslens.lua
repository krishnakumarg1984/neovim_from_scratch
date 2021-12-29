-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, hlslens = pcall(require, "hlslens")
if not status_ok then
  return
end

hlslens.setup({ calm_down = true })
