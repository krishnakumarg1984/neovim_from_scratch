-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

lsp_signature.setup({})
