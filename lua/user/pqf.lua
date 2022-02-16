-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, pqf = pcall(require, "pqf")
if not status_ok then
  return
end

pqf.setup({
  signs = {
    error = 'E',
    warning = 'W',
    info = 'I',
    hint = 'H'
  }
})
