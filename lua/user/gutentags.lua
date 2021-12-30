-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

vim.cmd([[
let g:gutentags_ctags_exclude_wildignore = 1   " https://idie.ru/posts/vim-modern-cpp
" let g:gutentags_add_default_project_roots = 0
let g:gutentags_cache_dir = expand('~/.gutentags_cache') " One of the things that annoyed me was that for every new project I would have at work, I had to add the tags and tags.lock file to the .gitignore file every single project so I tried to configure it outside of the git repository so that Git wouldn't track it. You can do this with g:gutentags_cache_dir by configuring it like so:
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_modules=['ctags']
let g:gutentags_project_root  = ['GNUmakefile','makefile','Makefile','.root','package.json', '.latexmain']
let g:gutentags_add_ctrlp_root_markers=0

" Use the following command to clear the cache quickly:
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

" Make Gutentags generate in most cases. let g:gutentags_generate_on_write = 1 is a must in my opinion. Gutentags should generate new tags if you just finished writing a new file which you're going to include and use in another file. When you write it, you can immediately jump to its definitions. This saves you time by manually calling Gutentags.
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" Let Gutentags generate more info for the tags.
" Explaining --fields=+ailmnS (info gathered from: $ ctags --list-fields)
"     a: Access (or export) of class members
"     i: Inheritance information
"     l: Language of input file containing tag
"     m: Implementation information
"     n: Line number of tag definition
"     S: Signature of routine (e.g. prototype or parameter list)
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']

" Making Gutentags faster by ignoring a lot of unnecessary filetypes. If you have used Gutentags and you have looked at the tag files it generates by default, it can be extremely slow because it generated a tag for every line for almost any filetype it can find. Below is a list of globs I personally ignore.
let g:gutentags_ctags_exclude = [
            \ '*-lock.json',
            \ '*.bak',
            \ '*.bin',
            \ '*.bmp',
            \ '*.cache',
            \ '*.class',
            \ '*.csproj',
            \ '*.csproj.user',
            \ '*.css',
            \ '*.dll',
            \ '*.doc',
            \ '*.docx',
            \ '*.exe',
            \ '*.flac',
            \ '*.gif',
            \ '*.git',
            \ '*.hg',
            \ '*.html',
            \ '*.ico',
            \ '*.jpg',
            \ '*.json',
            \ '*.less',
            \ '*.lock',
            \ '*.map',
            \ '*.Master',
            \ '*.md',
            \ '*.min.*',
            \ '*.mp3',
            \ '*.ogg',
            \ '*.pdb',
            \ '*.pdf',
            \ '*.plist',
            \ '*.png',
            \ '*.ppt',
            \ '*.pptx',
            \ '*.pyc',
            \ '*.rar',
            \ '*.run',
            \ '*.scss',
            \ '*.sln',
            \ '*.svg',
            \ '*.svn',
            \ '*.swo',
            \ '*.swp',
            \ '*.tar',
            \ '*.tar.bz2',
            \ '*.tar.gz',
            \ '*.tar.xz',
            \ '*.tex',
            \ '*.tmp',
            \ '*.ui',
            \ '*.vscode',
            \ '*.xls',
            \ '*.xlsx',
            \ '*.xml',
            \ '*.xmls',
            \ '*.zip',
            \ '*/tests/*',
            \ '*build*.js',
            \ '*bundle*.js',
            \ '*sites/*/files/*',
            \ '.*rc*',
            \ '.DS_Store',
            \ '.mypy_cache',
            \ '_build',
            \ 'bin',
            \ 'bower_components',
            \ 'build',
            \ 'bundle',
            \ 'cache',
            \ 'CMakeFiles',
            \ 'compiled',
            \ 'cscope.*',
            \ 'dist',
            \ 'docs',
            \ 'example',
            \ 'node_modules',
            \ 'tags*',
            \ 'vendor',
            \ 'venv',
            \]



]])
