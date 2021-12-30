-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, dd = pcall(require, "dd")
if not status_ok then
  return
end

dd.setup({
  timeout = 1500,
})
