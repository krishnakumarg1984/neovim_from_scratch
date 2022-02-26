-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
  return
end

aerial.setup {
  on_attach = function(bufnr)
    -- Toggle the aerial window with <leader>a
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
    -- Jump forwards/backwards with '{' and '}'
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>{", "<cmd>AerialPrev<CR>", {})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>}", "<cmd>AerialNext<CR>", {})
    -- Jump up the tree with '[[' or ']]'
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader><leader>{", "<cmd>AerialPrevUp<CR>", {})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader><leader>}", "<cmd>AerialNextUp<CR>", {})
  end,
  -- The minimum width of the aerial window.
  -- To disable dynamic resizing, set this to be equal to max_width
  min_width = 20,
  placement_editor_edge = true,
  close_behavior = "global",
  open_automatic = function(bufnr)
    -- Enforce a minimum line count
    return vim.api.nvim_buf_line_count(bufnr) > 26
      -- Enforce a minimum symbol count
      and aerial.num_symbols(bufnr) > 3
      -- A useful way to keep aerial closed when closed manually
      and not aerial.was_closed()
  end,
}

-- vim.cmd([[
--     augroup _aerialFiletype
--     autocmd!
--     autocmd filetype aerial setlocal nolist
--   ]])
