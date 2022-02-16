-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Protected call to lspconfig (((

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- )))

require "user.lsp.lsp-installer"
require "user.lsp.lspsaga"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
