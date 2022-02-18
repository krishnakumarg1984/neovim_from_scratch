-- vim: foldmarker=(((,))):foldmethod=marker:foldlevelstart=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Boilerplate for packer automation (((

-- Automatically install packer (((

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer: close and reopen Neovim..."
  print "If you get errors after reopening, run :PackerInstall to install missing plugins"
  vim.cmd [[packadd packer.nvim]]
end

-- )))

-- Autocommand that reloads neovim whenever you save the plugins.lua file (((

-- vim.cmd([[
--   augroup packer_user_config
--   autocmd!
--   autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

--)))

-- Use a protected call so we don't error out on first use (((

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- )))

-- Have packer use a popup window (((

-- packer.init {
--   compile_path = vim.fn.stdpath "config" .. "/lua/user/packer_compiled.lua",
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

-- )))

-- )))

-- 'packer.startup' lua function to load plugins
return packer.startup(function(use)
  -- My plugins here (((

  -- Barebones/package management and other infrastructure plugins (((

  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "nvim-lua/popup.nvim" } -- An implementation of the Popup API from vim in Neovim

  -- )))

  -- Treesitter & related plugins (((

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use {
    "nvim-treesitter/nvim-treesitter-refactor",
    after = { "nvim-treesitter" },
    -- requires = { "nvim-treesitter" },
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = { "nvim-treesitter" },
    -- requires = { { "nvim-treesitter" } },
  }
  use { "romgrk/nvim-treesitter-context", after = { "nvim-treesitter" } }
  use { "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter" } }
  -- use( "mizlan/iswap.nvim", requires = { { "nvim-treesitter" } } )
  -- use { "folke/zen-mode.nvim", cmd = "ZenMode" }
  -- use { "folke/twilight.nvim", cmd = { "ZenMode", "Twilight", "TwilightEnable" } }

  -- -- )))

  -- Colorscheme plugins (((

  use { "rebelot/kanagawa.nvim" }

  -- )))

  -- Vimscript plugins (((

  -- use { "sgur/vim-editorconfig", event = "BufWinEnter" }
  -- use { "tpope/vim-unimpaired", event = "BufWinEnter" }
  use {
    "dense-analysis/ale",
    ft = {
      "ansible",
      "asm",
      "awk",
      "bazel",
      "bib",
      "sh",
      "zsh",
      "bash",
      "c",
      "cpp",
      "chef",
      "cmake",
      "cuda",
      "dockerfile",
      "fortran",
      "gitcommit",
      "go",
      "html",
      "markdown",
      "vim",
      "tex",
      "julia",
      "mail",
      "make",
      "matlab",
      "yaml",
      "help",
      "txt",
      "text",
      "rust",
      "ruby",
      "perl",
      "rst",
      "r",
      "python",
      "puppet",
      "powershell",
    },
    cmd = "ALEEnable",
    config = "vim.cmd[[ALEEnable]]",
  }
  use { "gauteh/vim-cppman", ft = { "c", "cpp" }, cmd = { "Cppman" } }
  -- use {
  --   "ilyachur/cmake4vim",
  --   cmd = {
  --     "CMake",
  --     "CMakeResetAndReload",
  --     "CMakeReset",
  --     "CMakeBuild",
  --     "CMakeSelectTarget",
  --     "CMakeSelectBuildType",
  --     "CMakeInfo",
  --     "CMakeClean",
  --     "CMakeCompileSource",
  --     "CMakeRun",
  --     "CMakeRun!",
  --     "CTest",
  --     "CTest!",
  --     "CCMake",
  --   },
  -- }
  use { "jeffkreeftmeijer/vim-numbertoggle", event = "InsertEnter" }
  use { "lervag/vimtex", ft = "tex" }
  use { "ludovicchabant/vim-gutentags" } -- , event = "BufWinEnter" }
  use { "machakann/vim-sandwich", keys = { "sa", "sr", "sd" } }
  use { "petRUShka/vim-opencl", ft = { "opencl" } }
  -- use { "puremourning/vimspector", fn = "vimspector#Launch", disable = false }
  use { "svban/YankAssassin.vim" }
  use { "tpope/vim-repeat", event = "BufWinEnter" }
  use { "tyru/capture.vim", cmd = { "Capture" } }

  use { "dstein64/vim-startuptime", cmd = { "StartupTime" } }
  -- use { "tweekmonster/startuptime.vim", cmd = { "StartupTime" } }

  -- AsyncTask and AsyncRun (((

  -- use { "skywind3000/asyncrun.vim", cmd = { "AsyncRun!", "AsyncRun", "AsyncStop!", "AsyncStop" } }
  use { "skywind3000/asyncrun.vim" }

  use {
    "skywind3000/asynctasks.vim",
    -- requires = { "skywind3000/asyncrun.vim" },
    cmd = { "AsyncTask", "AsyncTaskEdit!", "AsyncTaskEdit", "AsyncTaskList", "AsyncTaskMacro" },
    config = "vim.cmd[[ALEEnable]]",
  }

  -- )))

  -- )))

  -- Other lua plugins (((

  use { "antoinemadec/FixCursorHold.nvim" } -- This is needed to fix lsp doc highlight
  use { "nathom/filetype.nvim" }
  use { "numToStr/Comment.nvim" } -- Easily comment stuff
  use { "ahmedkhalf/project.nvim" }
  use { "kyazdani42/nvim-web-devicons" }
  -- use { "kyazdani42/nvim-tree.lua" }
  -- -- use({
  -- --   "nvim-neo-tree/neo-tree.nvim",
  -- --   branch = "v1.x",
  -- --   requires = {
  -- --     "nvim-lua/plenary.nvim",
  -- --     "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
  -- --     "MunifTanjim/nui.nvim",
  -- --   },
  -- -- -- cmd = { "NeoTreeRevealToggle", "NeoTreeFloat", "NeoTreeFocus", "NeoTreeFocusToggle", "NeoTreeReveal" },
  -- -- })
  -- use { "akinsho/bufferline.nvim" }
  -- use { "kazhala/close-buffers.nvim", cmd = {} }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim", cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" } }
  use { "lukas-reineke/indent-blankline.nvim" } -- slow plugin (try and restrict to a few filetypes)
  -- use { "luukvbaal/stabilize.nvim" }
  -- use { "folke/todo-comments.nvim" } -- :ToDoQuickFix, :ToDoTrouble, :ToDoTelescope,
  -- -- TODO: do this today
  -- -- HACK: This is just a hack
  -- -- FIX: this needs fix
  -- -- PERF: perf issue here
  -- -- WARN: things don't work much
  -- -- NOTE: make a note of this
  use { "karb94/neoscroll.nvim" }
  use { "kevinhwang91/nvim-hlslens", keys = { "/", "?", "q/", "q?", "*", "#", "g*", "g#" } }
  -- use { "https://gitlab.com/yorickpeterse/nvim-pqf", event = { "QuickFixCmdPre", "QuickFixCmdPost" } }
  use { "https://gitlab.com/yorickpeterse/nvim-pqf" }
  -- use { "TimUntersberger/neogit", cmd = { "Neogit" } }
  -- -- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
  -- use { "stevearc/dressing.nvim" }
  -- use { "chentau/marks.nvim", keys = { "m", "dm" }, cmd = { "MarksToggleSigns", "MarksListBuf", "MarksListGlobal", "MarksListAll", "MarksQFListBuf", "MarksQFListGlobal", "MarksQFListAll" } }
  use { "klen/nvim-config-local" }
  use { "ellisonleao/glow.nvim", ft = { "md", "Rmd", "rmarkdown", "Rmarkdown" }, cmd = { "Glow", "GlowInstall" } }
  use { "anuvyklack/pretty-fold.nvim" }
  use { "winston0410/range-highlight.nvim", requires = "winston0410/cmd-parser.nvim" }
  use { "Shatur/neovim-cmake", ft = { "c", "cpp", "cmake", "fortran" }, requires = { "mfussenegger/nvim-dap" } }

  --
  -- -- )))

  -- Autocompletion and snippets support (((

  -- cmp plugins (((

  use { "L3MON4D3/LuaSnip" } -- , event = "InsertEnter" } -- snippet engine
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-path" } -- path completions
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-cmdline" } -- cmdline completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }
  -- use("andersevenrud/cmp-tmux")
  use { "quangnguyen30192/cmp-nvim-tags" }
  -- use {
  --   "f3fora/cmp-nuspell",
  --   rocks = { "lua-nuspell" },
  --   ft = { "text", "markdown", "rmd", "gitcommit", "mail", "tex", "rst", "asciidoc" },
  -- }
  -- use {
  --   "f3fora/cmp-spell",
  --   ft = { "text", "markdown", "rmd", "gitcommit", "mail", "tex", "rst", "asciidoc" },
  -- }
  -- use {
  --   "octaltree/cmp-look",
  --   ft = { "text", "markdown", "rmd", "gitcommit", "mail", "tex", "rst", "asciidoc" },
  -- }

  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use
  use { "saadparwaiz1/cmp_luasnip" } -- , event = "InsertEnter" } -- snippet completions
  use { "windwp/nvim-autopairs" } --, event = "InsertEnter" } -- , after = "nvim-cmp" } -- Autopairs, integrates with both cmp (and treesitter?)

  -- )))

  -- )))

  -- LSP (((

  -- , ft = { "ansible", "awk", "bash", "sh", "c", "cpp", "cmake", "dockerfile", "fortran", "go", "java", "json", "julia", "tex", "text", "txt", "lua", "perl", "powershell", "puppet", "python", "r", "ruby", "rust", "sql", "viml", "yaml", "javascript", "typescript", "mail", "md", "markdown" }
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/nvim-lsp-installer" } -- simple to use language server installer
  use { "folke/trouble.nvim" }
  use { "https://gitlab.com/yorickpeterse/nvim-dd" }
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "kosayoda/nvim-lightbulb" }
  use { "ray-x/lsp_signature.nvim", requires = "kyazdani42/nvim-web-devicons" } -- event = { "InsertEnter" }, }
  use { "rmagatti/goto-preview" }
  use { "stevearc/aerial.nvim" }
  use { "tami5/lspsaga.nvim" } -- , event = "InsertEnter" })
  -- use { "ldelossa/litee-calltree.nvim", requires = { "ldelossa/litee.nvim" } }

  -- )))

  -- -- Telescope (((
  --
  -- use "nvim-telescope/telescope.nvim"
  -- -- use("nvim-telescope/telescope-media-files.nvim")
  -- -- use("nvim-telescope/telescope-packer.nvim")
  -- -- cheatsheet.nvim (((
  -- use {
  --   "sudormrfbin/cheatsheet.nvim",
  --   requires = {
  --     { "nvim-telescope/telescope.nvim" },
  --     { "nvim-lua/popup.nvim" },
  --     { "nvim-lua/plenary.nvim" },
  --   },
  --   cmd = { "Cheatsheet", "CheatsheetEdit" },
  -- }
  -- -- )))
  -- -- octo.nvim ((( -- or  nvim-telescope / telescope-github.nvim
  -- use {
  --   "pwntester/octo.nvim",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "kyazdani42/nvim-web-devicons",
  --   },
  --   cmd = { "Octo" },
  -- }
  -- -- )))
  -- -- telescope-fzf-native (((
  -- use {
  --   "nvim-telescope/telescope-fzf-native.nvim",
  --   run = "make",
  --   requires = { { "nvim-telescope/telescope.nvim" }, { "nvim-lua/plenary.nvim" } },
  -- }
  -- -- )))
  -- use {
  --   "crispgm/telescope-heading.nvim",
  --   requires = { { "nvim-telescope/telescope.nvim" }, { "nvim-lua/plenary.nvim" } },
  -- }
  -- use "nvim-telescope/telescope-symbols.nvim"
  -- -- use({
  -- --   "nvim-telescope/telescope-frecency.nvim",
  -- --   requires = { "tami5/sqlite.lua" },
  -- -- })
  -- -- use("sQVe/sort.nvim")
  --
  use { "folke/which-key.nvim" }
  -- -- )))

  -- -- Git (((
  --
  -- use "lewis6991/gitsigns.nvim"
  --
  -- -- )))

  -- )))

  -- use { "lewis6991/impatient.nvim" }  --  https://github.com/lewis6991/impatient.nvim/issues/20 (needs treesitter)

  -- Automatically set up your configuration after cloning packer.nvim (((
  -- Put this at the end after all plugins

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

  -- )))
end)

-- Note-taking systems, Documentation generators, to-do systems (((
--[[

Personal wiki/notes
-------------------
https://github.com/mickael-menu/zk + https://github.com/mickael-menu/zk-nvim  (others: https://github.com/terror/zk, https://github.com/sirupsen/zk)
https://github.com/xwmx/nb
mkdocs material
zeta-note (markdown lsp server)
org-mode (with org-roam)
Markdown + https://github.com/jakewvincent/mkdnflow.nvim + Markor on android + syncthing (or another service to sync)
vim-wiki (is vimscript)
wiki.vim
https://github.com/srid/emanote
neorg
https://github.com/oberblastmeister/neuron.nvim (neuron is deprecated and succeeded by emanote)

ToDo
----
todotxt.org
taskwarrior (taskwiki + vimwiki)

Time tracking
-------------
Timewarrior

Other proprietary systems
-------------------------
google keep (proprietary)
]]
-- )))

-- Other interesting vim plugins (((
-- ipython/jupyter vim plugins (((
-- use "goerz/jupytext.vim"
-- use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' } -- need to set up mappings
-- use("bfredl/nvim-ipy")
-- use("jupyter-vim/jupyter-vim")
-- use("untitled-ai/jupyter_ascending")
-- use({ "hanschen/vim-ipython-cell", requires = { "jpalardy/vim-slime" } })
-- )))

-- use("kevinhwang91/nvim-bqf")
-- use("Konfekt/FastFold")
-- use("Konfekt/vim-sentence-chopper")
-- use("mg979/tasks.vim")
-- use("norcalli/nvim-colorizer.lua")
-- use("ntpeters/vim-better-whitespace")
-- use("ojroques/vim-oscyank")
-- use("s1n7ax/nvim-comment-frame")
-- use("tweekmonster/wstrip.vim")
-- use("urbainvaes/vim-ripple")
-- use("wellle/targets.vim")
-- use("wsdjeg/vim-assembly")
-- use({ "andymass/vim-matchup", event = "BufWinEnter" })
-- use({ "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } })
-- use({ "ii14/exrc.vim" }) -- "jenterkin/vim-autosource", "embear/vim-localvimrc", "LucHermitte/local_vimrc", "thinca/vim-localrc"
-- use({ "numtostr/BufOnly.nvim", cmd = { "BufOnly" } })
-- use({ "scrooloose/vim-slumlord", requires = { { "aklt/plantuml-syntax" }, { "tyru/open-browser.vim" } } }) -- also a telescope extension
-- use({ "tpope/vim-fugitive", event = "BufWinEnter" })
-- use({ "weirongxu/plantuml-previewer.vim", requires = { { "aklt/plantuml-syntax" }, { "tyru/open-browser.vim" } } })
-- use({ "tyru/open-browser.vim", event = "BufWinEnter" })

-- -- indent-o-matic (((
-- use({
--   "Darazaki/indent-o-matic",
--   event = "InsertEnter",
--   config = function()
--     require("indent-o-matic").setup({})
--   end,
-- })
-- -- )))

-- lightspeed.nvim (((
-- use {
--     "ggandor/lightspeed.nvim",
--     requires = "tpope/vim-repeat",
-- }
-- )))

-- -- marks.nvim (((
-- use({
--  "chentau/marks.nvim",
--  event = "BufRead",
--  config = function()
--    require("marks").setup({
--      -- whether to map keybinds or not. default true
--      default_mappings = false,
--      -- which builtin marks to show. default {}
--      builtin_marks = { ".", "<", ">", "^" },
--      -- whether movements cycle back to the beginning/end of buffer. default true
--      cyclic = true,
--      -- whether the shada file is updated after modifying uppercase marks. default false
--      force_write_shada = false,
--      -- how often (in ms) to redraw signs/recompute mark positions.
--      -- higher values will have better performance but may cause visual lag,
--      -- while lower values may cause performance penalties. default 150.
--      refresh_interval = 250,
--      -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
--      -- marks, and bookmarks.
--      -- can be either a table with all/none of the keys, or a single number, in which case
--      -- the priority applies to all marks.
--      -- default 10.
--      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
--      -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
--      -- sign/virttext. Bookmarks can be used to group together positions and quickly move
--      -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
--      -- default virt_text is "".
--      bookmark_0 = {
--        sign = "⚑",
--        -- virt_text = "hello world",
--      },
--      mappings = {},
--    })
--  end,
-- })
-- -- )))

-- -- bufresize.nvim (((
-- use({
--   "kwkarlwang/bufresize.nvim",
--   config = function()
--     require("bufresize").setup()
--   end,
--   event = "BufRead",
-- })
-- -- )))

-- -- session-lens and auto-session (((

-- use({
--  "rmagatti/auto-session",
--  requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
--  config = function()
--    require("auto-session").setup({--[[your custom config--]]
--      -- path_display = { "shorten" },
--      -- theme_conf = { border = false },
--      -- previewer = true,
--    })
--  end,
-- })

-- -- )))

-- use {
--   'nvim-telescope/telescope.nvim',
--   requires = { {'nvim-lua/plenary.nvim'} }
-- }

-- https://github.com/abecodes/tabout.nvim
-- https://github.com/elihunter173/dirbuf.nvim
-- https://github.com/Julian/vim-textobj-variable-segment
-- https://github.com/marklcrns/vim-smartq
-- https://github.com/Pocco81/MerelyFmt.nvim/tree/dev
-- https://github.com/svermeulen/vim-subversive
-- https://github.com/TC72/telescope-tele-tabby.nvim
-- https://github.com/tpope/vim-apathy

-- use { "blackCauldron7/surround.nvim" }
-- use { "chipsenkbeil/distant.nvim" }
-- use { "cljoly/telescope-repo.nvim" }
-- use { "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } }
-- use { "goolord/alpha-nvim" }
-- use { "j-hui/fidget.nvim" }
-- use { "mfussenegger/nvim-lint" }
-- use { "nyngwang/NeoZoom.lua" }
-- use { "onsails/lspkind-nvim" }
-- use { "petertriho/nvim-scrollbar" }

-- )))
