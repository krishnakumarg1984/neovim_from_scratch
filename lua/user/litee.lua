-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, litee = pcall(require, "litee.lib")
if not status_ok then
  return
end

litee.setup {}

local status_ok, litee_calltree = pcall(require, "litee.calltree")
if not status_ok then
  return
end

litee_calltree.setup {}
