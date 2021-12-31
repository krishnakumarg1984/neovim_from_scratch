-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "cmake",
    -- "comment",
    "cpp",
    "cuda",
    "dockerfile",
    "dot",
    "fortran",
    "go",
    "html",
    "java",
    "javascript",
    "json",
    "json5",
    "jsonc",
    "julia",
    "latex",
    "lua",
    "make",
    "markdown",
    "perl",
    "python",
    "r",
    "regex",
    -- "rst",
    "ruby",
    -- "rust",
    "toml",
    "verilog",
    -- "vim",
    "yaml",
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  refactor = {
    highlight_definitions = { enable = true },
    -- highlight_current_scope = { enable = true },
    -- smart_rename = {
    --     enable = true,
    --     keymaps = {
    --         smart_rename = "grr",
    --     },
    -- },
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      vim = "// %s",
    },
  },
})
