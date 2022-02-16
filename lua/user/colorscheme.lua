-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Lua protected function call to colorscheme and user notification if not installed (((

local colorscheme = "kanagawa"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- )))

-- Vimscript-based try-catch block for colorscheme invocation (((

-- vim.cmd([[
-- try
--     colorscheme kanagawa
-- catch /^Vim\%((\a\+)\)\=:E185/
--     colorscheme morning
-- endtry
-- ]])

-- )))
