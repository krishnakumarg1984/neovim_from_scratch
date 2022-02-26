-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, goto_preview = pcall(require, "goto-preview")
if not status_ok then
  return
end

goto_preview.setup {
  -- default_mappings = true,
  -- resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
  dismiss_on_move = true, -- Dismiss the floating window when moving the cursor.
}
