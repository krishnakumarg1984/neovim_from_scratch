-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

vim.cmd([[
nmap <localleader>vc <plug>(vimtex-cmd-create)|
xmap <localleader>vc <plug>(vimtex-cmd-create)|
vmap <localleader>vc <plug>(vimtex-cmd-create)|

" hooks~ A list of |Funcref|s. If running in continuous mode, each hook will be called for each line of output from `latexmk`, with that line as argument. E.g., to show information about the compilation run numbers, one could do this:
function! Callback(msg)
    let l:m = matchlist(a:msg, '\vRun number (\d+) of rule ''(.*)''')
    if !empty(l:m)
        echomsg l:m[2] . ' (' . l:m[1] . ')'
    endif
endfunction
let g:vimtex_compiler_latexmk = { 'hooks': [function('Callback')] }

" let g:vimtex_bibliography_commands = ['%(no)?bibliography', 'add%(bibresource|globalbib|sectionbib)'] "     A list of command names for commands that include bibliography files. Each list entry is interpreted as a pattern (very magic, see |/\v|) to match a particular command name. This option may be useful if one defines custom commands that includes bibliography files.

let g:vimtex_complete_bib = { 'simple': 1 }   " Default value: 0 If zero, then the cite completion is "smart", i.e. not simple. This behaviour is described in more detail in |vimtex-complete-cites|.

" let g:vimtex_complete_ref This option is a dictionary for controlling the label completion. The keys each control a different thing: custom_patterns~ Default value: [] List of custom trigger patterns that may be used to allow completion for e.g. custom macros. For example, if one has defined the command `\figref`, one could add following custom pattern >
" let g:vimtex_complete_ref = {
"             \ 'custom_patterns' = ['\\figref\*\?{[^}]*$']
"             \ }

" let g:vimtex_complete_enabled=1 " 1 is default
" let g:vimtex_complete_close_braces=0 " 0 is default. This option controls whether to append a closing brace after a label or a citation has been completed.
" let g:vimtex_parser_bib_backend='bibparse'  " 'bibtex' is the default.   This option sets the desired default backend for parsing bibliographies. This is used e.g. for gathering completion candidates. Possible values:

let g:vimtex_delim_list = {'mods' : {}}
let g:vimtex_delim_list.mods.name = [
            \ ['\left', '\right'],
            \ ['\mleft', '\mright'],
            \ ['\bigl', '\bigr'],
            \ ['\Bigl', '\Bigr'],
            \ ['\biggl', '\biggr'],
            \ ['\Biggl', '\Biggr'],
            \ ['\big', '\big'],
            \ ['\Big', '\Big'],
            \ ['\bigg', '\bigg'],
            \ ['\Bigg', '\Bigg'],
            \]
let g:vimtex_delim_toggle_mod_list = [
            \ ['\left', '\right'],
            \ ['\mleft', '\mright'],
            \ ['\bigl', '\bigr'],
            \ ['\Bigl', '\Bigr'],
            \ ['\biggl', '\biggr'],
            \ ['\Biggl', '\Biggr'],
            \ ['\big', '\big'],
            \ ['\Big', '\Big'],
            \ ['\bigg', '\bigg'],
            \ ['\Bigg', '\Bigg'],
            \]

let g:vimtex_disable_recursive_main_file_detection=1  "   In rare cases, the recursive method of finding the main file in multi file projects may be slow. This might happen for instance when there are _very_ many tex files in the directory tree that is searched. In such cases, one may disable the recursive method by setting this variable to a nonzero value.

nmap <localleader><localleader>k <plug>(vimtex-doc-package)

let g:vimtex_doc_handlers = ['MyHandler']
function! MyHandler(context)
    call vimtex#doc#make_selection(a:context)
    if !empty(a:context.selected)
        execute '!texdoc' a:context.selected '&'
    endif
    return 1
endfunction

let g:vimtex_env_change_autofill=1  "   If enabled, the current environment value is used as a default input for |<plug>(vimtex-env-change)| and |<plug>(vimtex-env-change-math)|. Some users may find this useful in order to quickly change from things like `align` to `aligned`.

let g:vimtex_fold_enabled=1
let g:vimtex_format_enabled=1

let g:vimtex_grammar_textidote = {
            \ 'jar': '~/bin/textidote.jar',
            \ 'args': '--output singleline --check en --read-all',
            \}

" let g:vimtex_grammar_vlty = {
"             \ 'lt_enable': '',
"             \ 'lt_disablecategories': '',
"             \ 'lt_enablecategories': '',
"             \}

let g:vimtex_grammar_vlty = {}
let g:vimtex_grammar_vlty.lt_directory = '~/bin/LanguageTool-5.4'
" let g:vimtex_grammar_vlty.lt_command = 'languagetool'
let g:vimtex_grammar_vlty.lt_disable = 'WHITESPACE_RULE'
let g:vimtex_grammar_vlty.server = 'my'
let g:vimtex_grammar_vlty.encoding = 'auto'
let g:vimtex_grammar_vlty.show_suggestions = 1
let g:vimtex_grammar_vlty.shell_options =
        \   ' --multi-language'
        \ . ' --packages "*"'
        " \ . ' --define ~/vlty/defs.tex'
        " \ . ' --replace ~/vlty/repls.txt'
        \ . ' --equation-punctuation display'
        \ . ' --single-letters "i.\,A.\|z.\,B.\|\|"'

let g:vimtex_imaps_leader='^'

if executable('pplatex')
    let g:vimtex_quickfix_method='pplatex'
endif

" let g:vimtex_quickfix_mode=1  "   1) The quickfix window is opened automatically when there are errors, and it becomes the active window. 2) Default. The quickfix window is opened automatically when there are errors, but it does not become the active window.

let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_autoclose_after_keystrokes=3
" let g:vimtex_syntax_custom_cmds
" let g:vimtex_syntax_nospell_commands=[] " A list of commands whose argument should be excluded from spell checking.

let g:vimtex_view_automatic=0

if has('unix')
    if executable('zathura')
        let g:vimtex_view_method='zathura'
        let g:vimtex_view_use_temp_files=1
        let g:vimtex_context_pdf_viewer = 'zathura'
    else
        let g:vimtex_view_method='skim'
        let g:vimtex_view_skim_activate=1
    endif
endif

if has('win32') || (has('unix') && exists('$WSLENV'))
    if executable('mupdf.exe')
        let g:vimtex_view_general_viewer = 'mupdf.exe'
    elseif executable('SumatraPDF.exe')
        let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
    endif
    set isfname-={,}
endif

highlight link texAuthorArg      texArg
highlight link texCmdBooktabs    texEnvArgName
highlight link texCmdItem        texArg
highlight link texMathEnvArgName texMathCmd
highlight link texMathSymbol     texMathCmd
highlight link texNewenvArgName  texArgNew
highlight link texPgfType        texCmd
highlight link texSpecialChar    texSymbol
highlight link texTabularChar    texMathOper

nnoremap <localleader>vt :call vimtex#fzf#run('ctli')<cr>

" https://vim.fandom.com/wiki/Toggle_to_open_or_close_the_quickfix_window
function! GetBufferList()
    redir =>buflist
    silent! ls!
    redir END
    return buflist
endfunction

function! ToggleList(bufname, pfx)
    let buflist = GetBufferList()
    for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
        if bufwinnr(bufnum) != -1
            exec(a:pfx.'close')
            return
        endif
    endfor
    if a:pfx == 'l' && len(getloclist(0)) == 0
        echohl ErrorMsg
        echo 'Location List is Empty.'
        return
    endif
    let winnr = winnr()
    exec(a:pfx.'open')
    if winnr() != winnr
        wincmd p
    endif
endfunction


augroup VimtexAuCmds
    autocmd!
    " autocmd FileType tex nnoremap <silent><localleader><localleader>l :lclose<cr>
    autocmd FileType tex nnoremap <silent><localleader><localleader>l :call ToggleList("Location List", 'l')<CR>
    autocmd FileType bib  command! -buffer -range=% -bar AddMissingCommas keeppatterns
                \ <line1>,<line2>substitute:\v([}"])(\s*\n)+(\s*\a+\s*\=):\1,\2\3:giep
    autocmd BufWritePre *.bib exe
                \ 'normal! m`' | silent AddMissingCommas | silent! exe 'normal! g``'
    if executable('blacktex')
        command BlackTex %!blacktex --keep-comments %
        " autocmd BufWritePost *.tex silent! BlackTex
    endif
    if executable('style-check.rb')
        " autocmd BufWritePost *.tex silent! compiler style-check | lmake! | redraw!
        autocmd FileType tex map <localleader>vs :up <bar> compiler style-check <bar> make <bar> :cw <cr><esc>
    endif
    autocmd User VimtexReverseGoto normal! zvzz
    autocmd FileType tex map <localleader>vv :up <bar> compiler vlty <bar> make <bar> :cw <cr><esc>
    autocmd FileType tex map <localleader>vg :up <bar> compiler textidote <bar> make <bar> :cw <cr><esc>
    autocmd BufWritePost *.bib silent! compiler bibertool | lmake! " | redraw!
    autocmd QuickFixCmdPost lmake lwindow
    autocmd FileType tex call SetServerName()
    autocmd FileType tex nnoremap <localleader>lb :call MyBeamerViewer()<cr>
augroup END

if has('nvim')
    function! SetServerName()
        if has('win32')
            let nvim_server_file = $TEMP . '/curnvimserver.txt'
        else
            let nvim_server_file = '/tmp/curnvimserver.txt'
        endif
        let cmd = printf('echo %s > %s', v:servername, nvim_server_file)
        call system(cmd)
    endfunction
endif

function! MyBeamerViewer()
    try
        let l:out = b:vimtex.out()
    catch /.*/
        let l:out = ''
    endtry

    if empty(l:out) | return | endif

    if executable('pympress')
        call system('pympress ' . l:out . '&')
    endif
endfunction

]])
