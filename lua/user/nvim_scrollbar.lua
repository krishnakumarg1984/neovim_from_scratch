-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
  return
end

-- local status_ok, colors = pcall(require, "kanagawa.colors")
-- if not status_ok then
--   return
-- end

scrollbar.setup({
  handlers = {
    diagnostic = true,
    search = true, -- Requires hlslens to be loaded
  },
})
