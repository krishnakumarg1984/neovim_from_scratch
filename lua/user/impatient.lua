-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

-- impatient.enable_profile()
local packer_compiled_status_ok, packer_compiled = pcall(require, "packer_compiled")

