-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

vim.cmd [[
  let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg', '_darcs', 'build.xml']

  let g:asyncrun_open = 12

  noremap <silent><leader><leader>q :call asyncrun#quickfix_toggle(8)<cr>

  noremap <leader><leader>afb :AsyncTask file-build<cr>
  noremap <leader><leader>afr :AsyncTask file-run<cr>
  noremap <leader><leader>afc :AsyncTask file-clean<cr>

  noremap <leader><leader>amfb :AsyncTask make-filebuild<cr>
  noremap <leader><leader>amfa :AsyncTask make-fileall<cr>
  noremap <leader><leader>amfc :AsyncTask make-fileclean<cr>
  noremap <leader><leader>amfr :AsyncTask make-filerun<cr>
  noremap <leader><leader>amft :AsyncTask make-filetest<cr>

  noremap <leader><leader>ampb :AsyncTask make-projectbuild<cr>
  noremap <leader><leader>ampr :AsyncTask make-projectrun<cr>
  noremap <leader><leader>ampt :AsyncTask make-projecttest<cr>

  noremap <leader><leader>acpi :AsyncTask cmake-projectinit<cr>
  noremap <leader><leader>acpb :AsyncTask cmake-projectbuild<cr>
  noremap <leader><leader>acpr :AsyncTask cmake-projectrun<cr>

  noremap <leader><leader>agw :AsyncTask grep-word<cr>
  noremap <leader><leader>agcw :AsyncTask grep-cword<cr>

  let g:asynctasks_term_pos = 'tab'
  let g:asynctasks_term_reuse = 1
  " nnoremap <leader><leader>cm :AsyncRun -cwd=<root> cmake . <cr>
  " nnoremap <leader><leader>M :AsyncRun -cwd=<root> make <cr>
  " nnoremap <leader><leader>mt :AsyncRun -cwd=<root> make test <cr>
  " nnoremap <leader><leader>ma :AsyncRun -cwd=<root> make all <cr>
  " nnoremap <leader><leader>mr :AsyncRun -cwd=<root> make run <cr>
  " nnoremap <leader><leader>mc :AsyncRun -cwd=<root> make clean <cr>
  ]]
