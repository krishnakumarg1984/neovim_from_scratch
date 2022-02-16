-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, pretty_fold = pcall(require, "pretty-fold")
if not status_ok then
  return
end

pretty_fold.setup{}

-- local status_ok, pretty_fold_preview = pcall(require, "pretty-fold.preview")
-- if not status_ok then
--   return
-- end

require('pretty-fold.preview').setup{
   key = 'l', -- choose 'h' or 'l' key
}

-- pretty_fold_preview.setup_keybinding("l")
