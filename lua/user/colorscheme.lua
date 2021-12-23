--[[
local colorscheme = "kanagawa"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
--]]

vim.cmd [[
try
    colorscheme kanagawa
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme morning
endtry
]]

