-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

vim.cmd [[

let g:ale_linters = {
\   'c': ['clangtidy', 'cppcheck', 'cpplint', 'flawfinder'],
\   'cmake': ['cmake_lint', 'cmakelint'],
\   'cpp': ['clangtidy', 'cppcheck', 'cpplint', 'flawfinder'],
\}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

let g:ale_fixers = {
\   '*': [],
\   'c': ['clangtidy'],
\   'cpp': ['clangtidy'],
\}
let g:ale_fixers_explicit = 1

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_open_list = 0
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1

let g:ale_hover_to_floating_preview = 1
let g:ale_floating_preview = 1
let g:ale_detail_to_floating_preview = 1

let g:ale_c_clangtidy_options='-Wno-unused-command-line-argument'
let g:ale_cpp_clangtidy_options='-Wno-unused-command-line-argument'
let g:ale_c_clangtidy_extra_options='-Wno-unused-command-line-argument'
let g:ale_cpp_clangtidy_extra_options='-Wno-unused-command-line-argument'

]]
