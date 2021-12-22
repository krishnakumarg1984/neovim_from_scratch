-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0

-- :help options

-- Backup settings (((
-- vim.opt.backup = false       -- creates a backup file
-- vim.opt.writebackup = false  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.cmd [[set backupdir-=.]]
-- )))

-- Case sensitivity options (((
vim.opt.ignorecase = true  -- ignore case in search patterns
vim.opt.infercase = true   -- Ignore case on insert completion. When doing keyword completion in insert mode |ins-completion|, and 'ignorecase' is also on, the case of the match is adjusted depending on the typed text.
vim.opt.smartcase = true   -- Do case-sensitive search if pattern contains upper case letters. Override the 'ignorecase' option if the search pattern contains upper case characters.
-- )))

-- Tab settings: shiftwidth, tabstop, softtabstop (((
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.shiftwidth = 4    -- Indent with four spaces (the number of spaces inserted for each indentation)
vim.opt.softtabstop = 4   -- Insert four spaces with tab key
vim.opt.tabstop = 4       -- Insert two spaces for a tab
-- )))

-- Indent settings (((
vim.opt.copyindent = true      -- Copy the previous indentation on autoindenting
vim.opt.preserveindent = true 
-- vim.opt.smartindent = true  -- make indenting smarter again
-- )))

-- Indent wrapped lines (((
vim.opt.wrap = true
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.opt.linebreak = true  -- Wrap lines at convenient point (only affects the on-screen display, not actual content in file) -- Break lines at word boundaries
vim.cmd [[let &showbreak='↪ ']]
-- set showbreak=…
vim.cmd [[set breakat=\ \ ;:,!?]]  -- which characters might cause a line break if 'linebreak' is on.
vim.cmd [[set breakindentopt=shift:2,sbr]]
vim.opt.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.
-- )))

-- swapfile, updatecount and updatetime (((
-- vim.opt.swapfile = false           -- creates a swapfile
vim.opt.updatecount = 100  -- After typing these no. of characters, the swap file will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).
vim.opt.updatetime = 275   -- milliseconds elapsed before which swap file will be written to disk (250ms is recommended by the gitgutter plugin, 300 ms by coc.nvim). You will have bad experience for diagnostic messages when it's at the default value of 4000 ms. 
-- vim.opt.updatetime = 300           -- faster completion (4000ms default)
-- )))

-- cursorline settings (((
vim.opt.cursorline = true          -- highlight the current line
vim.opt.cursorlineopt = "number"
-- )))

-- shortmess settings (((
vim.opt.shortmess:append "I"  -- Don't give the intro message when starting Vim |:intro|.
vim.opt.shortmess:append "c"  -- Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc.
-- vim.opt.shortmess-=x  -- Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions
-- )))

-- Scroll-related settings (scrolljump, sidescroll) (((
vim.opt.scrolloff = 2       -- Minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8   -- The minimal number of screen columns to keep to the left and to the right of the cursor
-- vim.opt.scrolljump = 3   -- How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
-- vim.opt.sidescroll = 3   -- The minimal number of columns to scroll horizontally
-- )))

-- gutter (number and signcolumn) settings (((
vim.opt.number = true           -- set numbered lines
vim.opt.relativenumber = false  -- set relative numbered lines
vim.opt.numberwidth = 4         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"      -- always show the sign column, otherwise it would shift the text each time diagnostics appear/become resolved

-- )))

-- vim.opt.conceallevel = 0         -- so that `` is visible in markdown files
-- vim.opt.showmode = false         -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.termguicolors = true     -- set term gui colors (most terminals support this)
vim.opt.clipboard = "unnamedplus"   -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2               -- more space in the neovim command line for displaying messages. Height of command-line (easy-readable). Better display for messages.
vim.opt.completeopt = { "menuone",  "noselect" } -- mostly just for cmp
vim.opt.fileencoding = "utf-8"      -- the encoding written to a file
vim.opt.guifont = "monospace:h17"   -- the font used in graphical neovim applications
vim.opt.mouse = "a"                 -- allow the mouse to be used in neovim (in all modes)
vim.opt.pumheight = 10              -- pop up menu height.Maximum number of items to show in the popup menu (|ins-completion-menu|). Zero means "use available screen space". Default is 0.
vim.opt.showtabline = 2             -- always show tabs
vim.opt.splitbelow = true           -- force all horizontal splits to go below current window
vim.opt.splitright = true           -- force all vertical splits to go to the right of current window
vim.opt.timeoutlen = 500            -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true             -- enable persistent undo
vim.opt.virtualedit:append "block"  -- Allow movement beyond buffer text only in visual block mode

-- vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=t]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
