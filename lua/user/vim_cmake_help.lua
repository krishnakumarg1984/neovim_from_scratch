-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

vim.cmd([[
augroup vimcmakehelp
    autocmd!
    autocmd FileType cmake setlocal keywordprg=:CMakeHelpPopup
augroup END
]])
