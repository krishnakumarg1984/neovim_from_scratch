-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, nvim_lint = pcall(require, "lint")
if not status_ok then
  return
end

nvim_lint.linters_by_ft = {
  ansible = { "ansible_lint" },
  c = { "clangtidy", "clazy", "flawfinder" },
  cmake = { "cmakelint" },
  cpp = { "clangtidy, clazy", "cpplint", "flawfinder" },
  java = { "checkstyle" },
  lua = { "luacheck" },
  markdown = { "vale" },
  matlab = { "mlint" },
}

vim.cmd([[
augroup nvimlinttrytosave
  autocmd!
  autocmd BufWritePost <buffer> lua require('lint').try_lint()
augroup END
]])
