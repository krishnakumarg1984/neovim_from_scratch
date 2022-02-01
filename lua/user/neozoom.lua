-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

---- Tmux-like window-split (and jumps).
vim.keymap.set("n", '<C-W>"', function()
  vim.cmd("NeoSplit")
end, { nowait = true, silent = true, noremap = true })
vim.keymap.set("n", "<C-W>%", function()
  vim.cmd("NeoVSplit")
end, { nowait = true, silent = true, noremap = true })
