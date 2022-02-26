-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  ---@param ctx ctx
  pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == "typescriptreact" then
      local U = require "Comment.utils"

      -- Determine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

      -- Determine the location where to calculate commentstring from
      local location = nil
      local ts_cs_utils_status_ok, ts_context_commentstring_utils = pcall(require, "ts_context_commentstring.utils")
      if ts_cs_utils_status_ok then
        if ctx.ctype == U.ctype.block then
          location = ts_context_commentstring_utils.get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = ts_context_commentstring_utils.get_visual_start_location()
        end
      end

      local ts_cs_internal_status_ok, ts_context_commentstring_internal = pcall(
        require,
        "ts_context_commentstring.internal"
      )
      if ts_cs_internal_status_ok then
        return ts_context_commentstring_internal.calculate_commentstring {
          key = type,
          location = location,
        }
      end
    end
  end,
}
