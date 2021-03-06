-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Setup stabilize.nvim
local status_ok, stabilize = pcall(require, "stabilize")
if not status_ok then
  -- print("stabilize.nvim is not loaded")
  return
end

stabilize.setup({
  force = false, -- stabilize window even when current cursor position will be hidden behind new window
  forcemark = nil, -- set context mark to register on force event which can be jumped to with '<forcemark>
  ignore = {  -- do not manage windows matching these file/buftypes
    filetype = { "help", "list", "Trouble" },
    buftype = { "terminal", "quickfix", "loclist" },
    },
  nested = "QuickFixCmdPost,DiagnosticChanged *",
})
