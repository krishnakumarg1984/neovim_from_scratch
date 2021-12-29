-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Setup stabilize.nvim
local status_ok, stabilize = pcall(require, "stabilize")
if not status_ok then
  -- print("stabilize.nvim is not loaded")
  return
end

stabilize.setup({
  nested = "QuickFixCmdPost",
})
