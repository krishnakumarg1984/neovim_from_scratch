-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- vim: ft=vim:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

vim.cmd([[

  " https://vimways.org/2018/formatting-lists-with-vim/
  " function! EmptyBuffer()
  "   if @% == ""
  "     setfiletype txt
  "   endif
  " endfunction

  " function! PlainText()
  "   setlocal comments=
  " endfunction

  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 

    " Press Enter to follow a help tag
    autocmd FileType help nnoremap <buffer><CR> <c-]>

    " Press Backspace to go back to the location of the previous tag
    autocmd FileType help nnoremap <buffer><BS> <c-T>

    autocmd FileType help setlocal number relativenumber

    " https://stackoverflow.com/questions/1832085/how-to-jump-to-the-next-tag-in-vim-help-file
    autocmd FileType help nnoremap <buffer> <leader>Tn /\|.\zs\S\{-}\|/<cr>zz

    " autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 400})
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Search', timeout=650, on_visual=true }

    " autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
    " autocmd BufWinEnter *.txt set iskeyword+=- iskeyword+=: iskeyword+=.

    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted

    " autocmd BufEnter * call EmptyBuffer()
    " autocmd BufRead,BufNewFile * setfiletype txt
    " autocmd FileType txt call PlainText()

    autocmd FileType mail,rst,text,yaml,toml,tex,txt setlocal spell

  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  " Autocommand to set commentstring for various buffer types (((

  augroup _setcommentstring
    autocmd!
    autocmd BufEnter,BufFilePost *.cpp,*.h setlocal commentstring=//\ %s

    " https://github.com/tpope/vim-commentary/issues/85
    autocmd FileType xdefaults setlocal commentstring=!\ %s
  augroup END

  " )))

  " Autocommand to set ft to julia for files ending in .jl (((

  augroup _julia
      autocmd!
      autocmd BufRead,BufNewFile *.jl set filetype=julia
  augroup END

  " )))

  " Autocommand for file changed alert (((
  augroup FileChangedAlert
      " Helps if you have to use another editor on the same file https://vimhelp.org/vim_faq.txt.html
      autocmd!
      autocmd FileChangedShell *
                  \ echohl WarningMsg |
                  \ echo "File has been changed outside of vim." |
                  \ echohl None
  augroup END
  " )))

  " Autocommand for disabling undofile in /tmp on non-windows systems (((
  if !has('win32') || !has('win64')
      augroup disableTempUndo
          autocmd!
          autocmd BufWritePre /tmp/* setlocal noundofile
      augroup END
  endif
  " )))

  " Autocommand for remembering cursor position (((
  augroup vimrc-remember-cursor-position
      autocmd!
      autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup END
  " )))

  " Autocommand to stop insert when focus is lost (((
  augroup FocusLostAucmd
      autocmd!
      autocmd FocusLost * stopinsert
  augroup END
  " )))

  " Autocommands for LaTeX filetype (((
  augroup LaTeXSettings
      autocmd!
      " autocmd FileType tex setlocal scrollbind
      autocmd FileType tex setlocal foldcolumn=auto:7
      autocmd InsertEnter *.tex set conceallevel=0
      autocmd InsertLeave *.tex set conceallevel=2
  augroup END
  " )))

]])
