-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

vim.cmd([[
  " Set this option to exclude regexp patterns for filetypes or filepaths
  let g:editorconfig_blacklist = {
              \ 'filetype': ['git.*', 'fugitive'],
              \ 'pattern': ['\.un~$']}

]])
