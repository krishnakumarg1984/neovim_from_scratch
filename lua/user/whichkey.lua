-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  -- add operators that will trigger motion and text object completion
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPACE",
    ["<cr>"] = "ENTER",
    ["<tab>"] = "TAB",
  },
  window = {
    border = "rounded", -- none, single, double, shadow
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  -- triggers = {"<leader>"} -- or specify a list manually
}

local opts = {
  prefix = "<leader>",
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  -- ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    -- "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "<cmd>Telescope buffers<cr>",
    "Buffers",
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  -- ["w"] = { "<cmd>w!<CR>", "Save" },
  -- ["q"] = { "<cmd>q!<CR>", "Quit" },
  -- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  -- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = {
    -- "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "<cmd>lua require('telescope.builtin').find_files()<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },

  a = {
    name = "Code Outline",
    a = { "<cmd>AerialToggle!<cr>", "Toggle Outline" },
    c = { "<cmd>AerialClose<cr>", "Close Outline" },
    d = { "<cmd>AerialNextUp<cr>", "Next Symbol (up 1 level)" },
    n = { "<cmd>AerialNext<cr>", "Next Symbol" },
    o = { "<cmd>AerialOpen!<cr>", "Open Outline" },
    p = { "<cmd>AerialPrev<cr>", "Prev Symbol" },
    t = { "<cmd>AerialToggle!<cr>", "Toggle Outline" },
    u = { "<cmd>AerialPrevUp<cr>", "Prev Symbol (up 1 level)" },
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    B = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commits" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
    f = { "<cmd>Telescope git_files<cr>", "Repo files" },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    s = { "<cmd>Telescope git_status<cr>", "Git Status" },
    S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    t = { "<cmd>Telescope git_stash<cr>", "Git Stash" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
  },

  L = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },

  T = {
    name = "Terminal",
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  t = {
    name = "Telescope Search",
    a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
    b = { "<cmd>Telescope builtin<cr>", "Builtins" },
    B = { "<cmd>Telescope current_buffer_tags<cr>", "Tags in Current Buffer" },
    c = { "<cmd>Telescope colorscheme<cr>", "Pick colorscheme" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    e = { "<cmd>Telescope symbols<cr>", "Unicode Emojis/Icons/Symbols" },
    f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in Current Buffer" },
    g = { "<cmd>Telescope grep_string<cr>", "Search string" },
    F = { "<cmd>Telescope filetypes<cr>", "Choose filetype" },
    h = { "<cmd>Telescope help_tags<cr>", "Get Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlight Group" },
    j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope man_pages<cr>", "Open Man Page" },
    M = { "<cmd>Telescope marks<cr>", "Marks" },
    o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    R = { "<cmd>Telescope resume<cr>", "Resume last" },
    s = { "<cmd>Telescope aerial<cr>", "Outline (aerial) Symbols" },
    S = { "<cmd>Telescope treesitter<cr>", "Outline (treesitter) Symbols" },
    t = { "<cmd>Telescope tags<cr>", "Tags in Project" },
    T = { "<cmd>Telescope tagstack<cr>", "Tagstack" },
    v = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
  },
}

which_key.setup(setup)
-- which_key.setup({})
which_key.register(mappings, opts)
