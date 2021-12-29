-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local lspsaga_status_ok, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status_ok then
  return
end

lspsaga.setup({})
-- scroll down hover doc or scroll in definition preview

vim.cmd([[
nnoremap <silent> <A-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <A-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
]])
