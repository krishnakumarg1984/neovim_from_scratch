-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
  return
end

-- Aerial does not set any mappings by default, so you'll want to set some up
aerial.register_attach_cb(function(bufnr)
  -- Toggle the aerial window with <leader>a
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", {})
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialClose<CR>", {})
  -- Jump forwards/backwards with '{' and '}'
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>{", "<cmd>AerialPrev<CR>", {})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>}", "<cmd>AerialNext<CR>", {})
  -- Jump up the tree with '[[' or ']]'
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>[[", "<cmd>AerialPrevUp<CR>", {})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>]]", "<cmd>AerialNextUp<CR>", {})
end)

-- open_automatic can be specified as a filetype map. For example, the below
-- configuration will open automatically in all filetypes except python and rust
vim.g.aerial = {
  -- The minimum width of the aerial window.
  -- To disable dynamic resizing, set this to be equal to max_width
  min_width = 20,
  open_automatic = {
    -- use underscore to specify the default behavior
    -- ["_"] = true,
    -- python = false,
    -- rust = false,
  },
  placement_editor_edge = true,
  close_behavior = "global",
}

vim.cmd([[
    augroup _aerialFiletype
    autocmd!
    autocmd filetype aerial setlocal nolist
  ]])
