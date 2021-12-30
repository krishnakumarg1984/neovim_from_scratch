-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, surround = pcall(require, "surround")
if not status_ok then
  return
end

surround.setup({ mappings_style = "sandwich" })
