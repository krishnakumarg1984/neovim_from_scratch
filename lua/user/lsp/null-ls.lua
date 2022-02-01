-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- local formatter_install_status_ok, formatter_install = pcall(require, "format-installer")
-- if not formatter_install_status_ok then
--   return
-- end

-- formatter_install.setup({
--   -- change path to suit your needs
--   installation_path = vim.fn.stdpath("data") .. "/formatters/",
-- })

-- -- Custom configs to pass
-- local custom_configs = {
--   -- clang_format = {
--   --   extra_args = {
--   --     "--style",
--   --     "{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 100, AllowShortFunctionsOnASingleLine: Empty}",
--   --   },
--   -- },
--   -- prettier = {
--   --   extra_args = {
--   --     "--tab-width=4",
--   --     "--print-width=100",
--   --   },
--   -- },
--   -- stylua = {
--   --   extra_args = {
--   --     "--column-width=100",
--   --     "--indent-type=Spaces",
--   --   },
--   -- },
--   -- yapf = {
--   --   extra_args = {
--   --     "--style",
--   --     "{column_limit:100}",
--   --   },
--   -- },
-- }

-- local sources = {}
-- for _, formatter in ipairs(formatter_install.get_installed_formatters()) do
--   local config = { command = formatter.cmd }
--   if custom_configs[formatter.name] ~= nil then
--     config.extra_args = custom_configs[formatter.name].extra_args
--   end
--   table.insert(sources, null_ls.builtins.formatting[formatter.name].with(config))
-- end

-- Optional: Additional formatters/diagnostics that are not included
-- This just uses the null-ls defaults
-- table.insert(
--     sources,
--     null_ls.builtins.code_actions.gitsigns,
-- )

vim.g.null_ls_disable = true

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
  debug = false,
  sources = {
    formatting.black,
    formatting.clang_format,
    formatting.codespell,
    formatting.fprettify,
    formatting.gofumpt,
    formatting.google_java_format,
    -- formatting.isort,
    formatting.latexindent,
    formatting.perltidy,
    formatting.prettier.with({
      -- filetypes = { "html", "json", "yaml", "markdown" },
      disabled_filetypes = {},
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    }),
    formatting.reorder_python_imports,
    formatting.rustfmt,
    -- formatting.shellharden,
    formatting.shfmt.with({ extra_args = { "-i", "2", "-ci" } }),
    formatting.stylua.with({
      condition = function(utils)
        return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
      end,
    }),

    -- diagnostics.flake8

    diagnostics.ansiblelint,
    diagnostics.chktex,
    diagnostics.codespell,
    diagnostics.cppcheck,
    -- diagnostics.cspell,
    diagnostics.flake8,
    diagnostics.hadolint,
    diagnostics.jsonlint,
    diagnostics.markdownlint,
    diagnostics.mypy,
    diagnostics.proselint,
    diagnostics.pylint,
    diagnostics.pylama,
    -- diagnostics.selene,
    -- will show code and source name
    diagnostics.shellcheck.with({ diagnostics_format = "[#{c}] #{m} (#{s})" }),
    diagnostics.vint,
    diagnostics.write_good,

    diagnostics.revive.with({ method = null_ls.methods.DIAGNOSTICS_ON_SAVE }),
    diagnostics.staticcheck.with({ method = null_ls.methods.DIAGNOSTICS_ON_SAVE }),

    -- code_actions.gitsigns,
    code_actions.proselint,
    code_actions.shellcheck,
  },
})
