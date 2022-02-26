-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Vimscript-style settings (((
vim.cmd [[

let g:ale_disable_lsp = 1
let g:python3_host_prog = 'python3'

set iskeyword+=-

" colorscheme morning
set backupdir-=.
set whichwrap+=<,>,[,],h,l

" Linebreak settings (((

let &showbreak='→ '
" let &showbreak='↪ '
" let &showbreak='… '
set breakat=\ \ ;:,!? " which characters might cause a line break if 'linebreak' is on.
set breakindentopt=shift:2,sbr

" )))

" formatoptions (((

" set formatoptions-=cro " TODO: this doesn't seem to work
set formatoptions-=t " Disable 'auto-wrap text using textwidth'
set formatoptions+=n " When formatting text, recognize numbered lists. This actually uses the 'formatlistpat' option, thus any kind of list can be used. Helps to avoid joining distinct items as if they were a single paragraph.

" )))

" Settings for 'fillchar' (((

set fillchars=vert:│,diff:⣿  " no ~ for end-of-buffer lines.
set fillchars+=foldopen:▾,foldsep:│,foldclose:▸ " https://vi.stackexchange.com/questions/21872/change-fold-sign-character

" )))

" Wildmode and wildmenu settings (((

" set wildmode=longest,list:full  " Tab press completes and lists
set wildignorecase      " If supported, make wildmenu completions case-insensitive

" Wildignore and low-priority suffixes/filetype-extensions (((
" Ignore the following type of files when tab completing. " There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
set wildignore+=*.4ct,*.4tc,*.7z,*.a,*.acn,*.acr,*.alg,*.auxlock,*.backup,*.bcf,*.beam,*.bin,*.blg,*.bmp,*.brf,*.cb,*.cb2,*.class,*.cpt,*.cut,*.dats,*.db,*.dll,*.dmg,*.docx,*.dpth,*.DS_Store,*.dx64fsl,*.el,*.end,*.ent,*.eps,*.exe,*.fasl,*.fdb_latexmk,*.fff,*.fls,*.flv,*.fmt,*.fot,*.gaux,*.gem,*.gif,*.git,*.glg,*.glo,*.gls,*.glsdefs,*.glstex,*.gtex,*.hg,*.hst,*.idv,*.idx,*.ilg,*.img,*.ind,*.ini,*.ist,*.jpeg,*.JPG,*.la,*.lb,*.lg,*.listing,*.lnk,*.loa,*.load,*.loe,*.lof,*.lol,*.lot,*.lox,*.ltjruby,*.luac,*.lx64fsl,*.maf,*.manifest,*.mf,*.mkv,*.mlf,*.mlt,*.mo,*.mod,*.mp,*.mp4,*.mw,*.nav,*.nlg,*.nlo,*.nls,*.o,*.obj,*.orig,*.pax,*.pdf,*.pdfpc,*.pdfsync,*.png,*.pre,*.ps,*.psd,*.pyc,*.pyg,*.pyo,*.pytxcode,*.rar,*.rbc,*.rbo,*.run.xml,*.save,*.snm,*.so,*.soc,*.sout,*.spl,*.sqlite,*.sta,*.svg,*.svn,*.sw?,*.swp,*.sympy,*.synctex,*.synctex.gz,*.tar,*.tar.bz2,*.tar.gz,*.tar.xz,*.tdo,*.texpadtmp,*.tfm,*.thm,*.tiff,*.toc,*.trc,*.ttt,*.upa,*.upb,*.ver,*.vrb,*.wrt,*.xcp,*.xdv,*.xdy,*.xlsx,*.xmpi,*.xpm,*.xref,*.xyc,*.xz,*.zip,*/.bundle/*,*/.cls,*/.fdb*/,*/.git/*,*/.glo,*/.ist,*/.sass-cache/*,*/.svn/*,*/.toc,*/.vim$,*/__pycache__/*,*/builds/*,*/dist*/*,*/node_modules/*,*/target/*,*/tmp/*,*/vendor/cache/*,*/vendor/gems/*,*/venv/*,*\\tmp\\*,*~,./tags,._*,.git/,.git/*,.idea/,\~$,_site,bower_components/*,CVS,CVS/*,media/*,migrations,tags,types_*taghl,vendor/cache/**,vendor/rails/**,

" This gives files lower priority, instead of outright ignoring them
set suffixes+=*.info,*.aux,*.log,*/.log,*.dvi,*.bbl,*.out,*/.out,*.old,*.bak
" )))

" )))

" set pumwidth=35
" set complete=.,w,b,u,t,kspell,U,s,k,d,],i ". through t is the default. . = current buffer. w  = any other windows, b = any other buffers opened, u = unopened buffers, t = tags, i = current and included files
set complete+=U,s,k,kspell,]

" Custom 'Underline' command using user-defined function (((
" https://vim.fandom.com/wiki/Underline_using_dashes_automatically
function! s:Underline(chars) abort
    let chars = empty(a:chars) ? '-' : a:chars
    let nr_columns = virtcol('$') - 1
    let uline = repeat(chars, (nr_columns / len(chars)) + 1)
    put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)
" )))

  " Formatlistpat settings (((

  " A pattern that is used to recognize a list header.  This is used for the "n" flag in 'formatoptions'. The pattern must match exactly the text that will be the indent for the line below it.  You can use |/\ze| to mark the end of the match while still checking more characters.  There must be a character following the pattern, when it matches the whole line it is handled like there is no match. The default recognizes a number, followed by an optional punctuation character and white space.

  set formatlistpat=^\\s*                " Optional leading whitespace
  set formatlistpat+=[                   " Start character class
  set formatlistpat+=\\[({]\\?           " |  Optionally match opening punctuation
  set formatlistpat+=\\(                 " |  Start group
  set formatlistpat+=[0-9]\\+            " |  |  Numbers
  set formatlistpat+=\\\|                " |  |  or
  set formatlistpat+=[a-zA-Z]\\+         " |  |  Letters
  set formatlistpat+=\\)                 " |  End group
  set formatlistpat+=[\\]:.)}            " |  Closing punctuation
  set formatlistpat+=]                   " End character class
  set formatlistpat+=\\s\\+              " One or more spaces
  set formatlistpat+=\\\|                " or
  set formatlistpat+=^\\s*[-–+o*•]\\s\\+ " Bullet points

  " )))

  " Global g:tex_ settings ((((((

  " let g:tex_no_error=1   " The <tex.vim> supports lexical error checking of various sorts.  Thus, although the error checking is ofttimes very useful, it can indicate errors where none actually are.  If this proves to be a problem for you, you may put in your vimrc the following statement: > let g:tex_no_error=1 and all error checking by <syntax/tex.vim> will be suppressed.
  let g:tex_comment_nospell= 1
  let g:tex_conceal='abdmgs'
  let g:tex_flavor = 'latex'
  let g:tex_fold_enabled=1
  let g:tex_isk='48-57,a-z,A-Z,192-255,:,_'

  " ))))))

  " Disable unnecessary internal plugins (((
	
  let g:did_install_default_menus = 1
  let g:did_install_syntax_menu   = 1
  let g:did_indent_on             = 1
  let g:do_filetype_lua           = 1
  let g:did_load_filetypes        = 1
  let g:did_load_ftplugin         = 1
  let g:skip_loading_mswin        = 1

  let g:loaded_2html_plugin       = 1

  " I manage plugins myself with Git
  let g:loaded_getscript          = 1
  let g:loaded_getscriptPlugin    = 1

  " I prefer filtering text with Unix tools
  let g:loaded_logiPat            = 1
  let g:loaded_logipat            = 1
  
  let g:loaded_man                = 1
  let g:loaded_matchit            = 1
  let g:loaded_matchparen         = 1

  " I don't use Vim servers
  let g:loaded_rrhelper           = 1

  let g:loaded_shada_plugin       = 1
  let g:loaded_spellfile_plugin   = 1
	let g:loaded_remote_plugins     = 1
  let g:loaded_tutor_mode_plugin  = 1
  let g:loaded_vimball            = 1
  let g:loaded_vimballPlugin      = 1

  " Vim is the wrong tool for reading archives or compressed text
  let g:loaded_gzip               = 1
	let g:loaded_tar                = 1
  let g:loaded_tarPlugin          = 1
  let g:loaded_zip                = 1
  let g:loaded_zipPlugin          = 1

  let g:loaded_netrw              = 1
  let g:loaded_netrwFileHandlers  = 1
  let g:loaded_netrwPlugin        = 1
  let g:netrw_nogx                = 1

  " )))

  " Folding-related global(g:) variables for various languages (((

  let g:markdown_folding        = 1
  let g:markdown_enable_folding = 1
  let g:tex_fold_enabled        = 1
  let g:vimsyn_folding          = 'af'
  let g:xml_syntax_folding      = 1
  let g:javaScript_fold         = 1
  let g:sh_fold_enabled         = 7
  let g:ruby_fold               = 1
  let g:perl_fold               = 1
  let g:perl_fold_blocks        = 1
  let g:r_syntax_folding        = 1
  let g:rust_fold               = 1
  let g:php_folding             = 1

  let g:cursorhold_updatetime   = 100

  " )))

" Diff-mode settings (((

set diffopt+=vertical,foldcolumn:0,context:3,iwhiteall,hiddenoff
" set diffopt+=internal,indent-heuristic,algorithm:histogram
set diffopt+=indent-heuristic,algorithm:patience

" )))

" Settings for 'listchars' which define extra list display characters (((

set listchars=
set listchars+=tab:▸\     " Tab characters, preserve width
set listchars+=trail:·    " Trailing spaces
set listchars+=extends:>  " Unwrapped text to screen right
set listchars+=precedes:< " Unwrapped text to screen left
set listchars+=nbsp:␣

" )))

" Title (GUI/terminal) settings (((
set title
set titleold="Terminal"

" https://github.com/factorylabs/vimfiles/blob/ad1f9ffcd8c1e620a75a28822aaefc2097640b0d/home/.vimrc#L309
" Set the title bar to something meaningful

" set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " working directory
" set titlestring=%f%(\ [%M]%)
" set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

set titlestring=
set titlestring+=%f\                " file name
set titlestring+=%h%m%r%w           " flags
set titlestring+=\ -\ %{v:progname} " program name

" )))

set virtualedit+=block " Allow movement beyond buffer text only in visual block mode

" Settings for grepprg and grepformat (((

if executable('rg')
    set grepprg=rg\ -H\ --no-heading\ --vimgrep
    set grepformat^=%f:%l:%c:%m
endif

" )))

" Other non-conditional settings/declarations (set xxxxxxx) (((

set fileformats=unix,dos,mac " This gives the end-of-line (<EOL>) formats that will be tried when starting to edit a new buffer and when reading a file into an existing buffer:
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " Probably overridden by status-line plugins

" set colorcolumn=99999 " fixes indentline for now
set cpoptions-=a      " Stop the :read command from annoyingly setting the alternative buffer
set guioptions-=e
set isfname-={,}
" set path+=**          " Search current directory's whole tree

" )))

" Mappings (((

" https://github.com/neovim/neovim/issues/9953
" if &wildoptions == 'pum'
"     cnoremap <expr> <up>   pumvisible() ? "<C-p>" : "\<up>"
"     cnoremap <expr> <down> pumvisible() ? "<C-n>" : "\<down>"
" endif
" 
" cnoremap <c-n> <down>
" cnoremap <c-p> <up>

" Replace :w with :up
cnoreabbrev <expr> w getcmdtype() == ":" && getcmdline() == 'w' ? 'up' : 'w'

" nnoremaps (((

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" )))

" replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

noremap <c-w>" <c-w>t<c-w>K     " change vertical to horizontal with -
noremap <c-w>% <c-w>t<c-w>H    " change horizontal to vertical with %

" Remap 'gx' for opening the URL under cursor on macOS (((
" https://github.com/vim/vim/issues/4738
if has('macunix')
    function! OpenURLUnderCursor()
        let s:uri = expand('<cWORD>')
        let s:uri = substitute(s:uri, '?', '\\?', '')
        let s:uri = shellescape(s:uri, 1)
        if s:uri != ''
            silent exec "!open '".s:uri."'"
            :redraw!
        endif
    endfunction
    nnoremap gx :call OpenURLUnderCursor()<CR>
endif
" )))

" Make jump-selections work better in visual block mode (((
xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"
" )))

" Substitute word under cursor and dot repeat (((
" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
" nnoremap <silent> \\C :let @/='\<'.expand('<cword>').'\>'<CR>cgn
" xnoremap <silent> \\C "sy:let @/=@s<CR>cgn
" )))

" )))

" Dictionary settings (((

if has('unix')
    silent! set dictionary+=/usr/share/dict/words
    silent! set dictionary+=/usr/share/dict/american-english
    silent! set dictionary+=/usr/share/dict/british-english
    silent! set dictionary+=/usr/share/dict/cracklib-small
endif

" )))

" Custom highlights (((
" highlight clear SignColumn     " SignColumn should match background,SignColumn is the column where |signs| are displayed
" highlight Comment cterm=italic gui=italic
" 
" highlight link HelpBar Normal
" highlight link HelpStar Normal
" 
" highlight OverLength ctermfg=0 ctermbg=3
" match OverLength /\%121v/

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Nobody wants to commit merge conflict markers, so let’s highlight these so we can’t miss them: https://vimways.org/2018/vim-and-git/

" )))

" shortmess settings (((

set shortmess+=I  " Don't give the intro message when starting Vim |:intro|.
set shortmess+=c  " Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc.
set shortmess-=x  " Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions

" )))

if executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

set tags=~/.cache/tags

]]

-- )))

-- Lua-style settings (((

local options = {

  -- Commented-out settings (((

  -- conceallevel = 0,      -- so that `` is visible in markdown files
  -- showmode = false,      -- we don't need to see things like -- INSERT -- anymore

  -- Backup settings (((
  -- backup = false,       -- creates a backup file
  -- writebackup = false,  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- )))

  -- )))

  -- Case-sensitivity options (((

  ignorecase = true, -- ignore case in search patterns
  infercase = true, -- Ignore case on insert completion. When doing keyword completion in insert mode |ins-completion|, and 'ignorecase' is also on, the case of the match is adjusted depending on the typed text.
  smartcase = true, -- Do case-sensitive search if pattern contains upper case letters. Override the 'ignorecase' option if the search pattern contains upper case characters.

  -- )))

  -- Tab settings: shiftwidth, tabstop, softtabstop (((

  expandtab = true, -- Use spaces instead of tabs
  shiftwidth = 4, -- Indent with four spaces (the number of spaces inserted for each indentation)
  softtabstop = 4, -- Insert four spaces with tab key
  tabstop = 4, -- Insert four spaces for a tab

  -- )))

  -- Indent settings (((

  -- Basic indent settings (((

  copyindent = true, -- Copy the previous indentation on autoindenting
  preserveindent = true,
  -- smartindent = true,  -- make indenting smarter again

  -- )))

  -- Indent wrapped lines (((

  wrap = true,
  linebreak = true, -- Wrap lines at convenient point (only affects the on-screen display, not actual content in file) -- Break lines at word boundaries
  breakindent = true, -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.

  -- )))

  -- )))

  -- swapfile, updatecount and updatetime (((

  -- swapfile = false,  -- creates a swapfile
  updatecount = 100, -- After typing these no. of characters, the swap file will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).
  updatetime = 275, -- milliseconds elapsed before which swap file will be written to disk (250ms is recommended by the gitgutter plugin, 300 ms by coc.nvim). You will have bad experience for diagnostic messages when it's at the default value of 4000 ms. Faster completion.

  -- )))

  -- cursorline settings (((

  cursorline = true, -- highlight the current line
  cursorlineopt = "number",

  -- )))

  -- Scroll-related settings (scrolljump, sidescroll) (((

  scrolloff = 2, -- Minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8, -- The minimal number of screen columns to keep to the left and to the right of the cursor
  -- scrolljump = 3,  -- How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
  -- sidescroll = 3,  -- The minimal number of columns to scroll horizontally

  -- )))

  -- Gutter (number and signcolumn) settings (((

  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time diagnostics appear/become resolved

  -- )))

  -- Fold settings (((

  foldlevel = 2, -- Sets the fold level. Folds with a higher level will be closed. Setting this option to zero will close all folds.  Higher numbers will close fewer folds. This option is set by commands like |zm|, |zM| and |zR|. See |fold-foldlevel|.
  foldlevelstart = 2,
  foldcolumn = "auto:5",

  -- )))

  -- Settings for showing matching parenthesis (((
  showmatch = true,
  matchtime = 3, -- Tenths of a second to show the matching paren, when 'showmatch' is set.  Note that this is not in milliseconds, like other options that set a time.

  -- )))

  -- All other settings (((

  -- clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- more space in the neovim command line for displaying messages. Height of command-line (easy-readable). Better display for messages.
  colorcolumn = "121", -- Display text width column
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  confirm = true, -- Give me a prompt instead of just rejecting risky :write, :saveas
  fileencoding = "utf-8", -- the encoding written to a file
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  lazyredraw = true, -- Don't redraw the screen during batch execution
  list = true,
  mouse = "a", -- allow the mouse to be used in neovim (in all modes)
  pumheight = 10, -- pop up menu height. Maximum number of items to show in the popup menu (|ins-completion-menu|). Zero means "use available screen space". Default is 0.
  pumwidth = 35,
  report = 0, -- Threshold for reporting number of lines changed.
  showtabline = 2, -- always show tabs
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  winaltkeys = "no",

  -- )))
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- -- https://www.reddit.com/r/neovim/comments/s3i0ez/how_to_avoid_having_to_install_neovim_in_every/?sort=new
-- if vim.fn.exists("$VIRTUAL_ENV") == 1 then
--   vim.g.python3_host_prog = vim.fn.substitute(vim.fn.system("which -a python3 | head -n2 | tail -n1"), "\n", "", "g")
-- else
--   vim.g.python3_host_prog = vim.fn.substitute(vim.fn.system("which python3"), "\n", "", "g")
-- end

-- )))
