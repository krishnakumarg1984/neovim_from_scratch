-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<C-h>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
  -- terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = "float",
  -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

-- function _G.set_terminal_keymaps()
--   local opts = { noremap = true }
--   vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
-- end

-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- vim.cmd [[
-- let g:toggleterm_terminal_mapping = '<A-;>'
-- " or manually...
-- " autocmd TermEnter term://*toggleterm#*
-- "       \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
--
-- " By applying the mappings this way you can pass a count to your
-- " mapping to open a specific window.
-- " For example: 2<C-t> will open terminal 2
-- " nnoremap <silent><c-,> <Cmd>exe v:count1 . "ToggleTerm"<CR>
-- " inoremap <silent><c-,> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
-- ]]

-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

-- function _LAZYGIT_TOGGLE()
--   lazygit:toggle()
-- end

-- local node = Terminal:new { cmd = "node", hidden = true }
--
-- function _NODE_TOGGLE()
--   node:toggle()
-- end
--
-- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
--
-- function _NCDU_TOGGLE()
--   ncdu:toggle()
-- end
--
-- local htop = Terminal:new { cmd = "htop", hidden = true }
--
-- function _HTOP_TOGGLE()
--   htop:toggle()
-- end
--
-- local python = Terminal:new { cmd = "python", hidden = true }
--
-- function _PYTHON_TOGGLE()
--   python:toggle()
-- end
