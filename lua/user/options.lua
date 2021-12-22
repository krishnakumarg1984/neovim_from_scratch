-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0

-- Backup settings (((
-- vim.opt.backup = false       -- creates a backup file
-- vim.opt.writebackup = false  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.cmd [[set backupdir-=.]]
-- )))

vim.cmd "set whichwrap+=<,>,[,],h,l"

vim.cmd [[let &showbreak='↪ ']]
vim.cmd [[set breakat=\ \ ;:,!?]]  -- which characters might cause a line break if 'linebreak' is on.
vim.cmd [[set breakindentopt=shift:2,sbr]]

-- vim.cmd [[set iskeyword+=-]]

vim.cmd [[set formatoptions-=t]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- shortmess settings (((
vim.opt.shortmess:append "I"  -- Don't give the intro message when starting Vim |:intro|.
vim.opt.shortmess:append "c"  -- Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc.
-- vim.opt.shortmess-=x       -- Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions
-- )))

vim.opt.virtualedit:append "block"  -- Allow movement beyond buffer text only in visual block mode

local options = {
    -- conceallevel = 0,        -- so that `` is visible in markdown files
    -- showmode = false,        -- we don't need to see things like -- INSERT -- anymore
    -- termguicolors = true,    -- set term gui colors (most terminals support this)

    -- Case sensitivity options (((
    ignorecase = true,  -- ignore case in search patterns
    infercase = true,   -- Ignore case on insert completion. When doing keyword completion in insert mode |ins-completion|, and 'ignorecase' is also on, the case of the match is adjusted depending on the typed text.
    smartcase = true,   -- Do case-sensitive search if pattern contains upper case letters. Override the 'ignorecase' option if the search pattern contains upper case characters.
    -- )))

    -- Tab settings: shiftwidth, tabstop, softtabstop (((
    expandtab = true,  -- Use spaces instead of tabs
    shiftwidth = 4,    -- Indent with four spaces (the number of spaces inserted for each indentation)
    softtabstop = 4,   -- Insert four spaces with tab key
    tabstop = 4,       -- Insert four spaces for a tab
    -- )))

    -- Indent settings (((

    -- Basic indent settings (((
    copyindent = true,      -- Copy the previous indentation on autoindenting
    preserveindent = true, 
    -- smartindent = true,  -- make indenting smarter again
    -- )))

    -- Indent wrapped lines (((
    wrap = true,
    linebreak = true,   -- Wrap lines at convenient point (only affects the on-screen display, not actual content in file) -- Break lines at word boundaries
    -- showbreak=…,
    breakindent = true, -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.
    -- )))

    -- )))

    -- swapfile, updatecount and updatetime (((
    -- swapfile = false,  -- creates a swapfile
    updatecount = 100,    -- After typing these no. of characters, the swap file will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).
    updatetime = 275,     -- milliseconds elapsed before which swap file will be written to disk (250ms is recommended by the gitgutter plugin, 300 ms by coc.nvim). You will have bad experience for diagnostic messages when it's at the default value of 4000 ms. Faster completion.
    -- )))

    -- cursorline settings (((
    cursorline = true,    -- highlight the current line
    cursorlineopt = "number",
    -- )))

    -- Scroll-related settings (scrolljump, sidescroll) (((
    scrolloff = 2,        -- Minimal number of screen lines to keep above and below the cursor
    sidescrolloff = 8,    -- The minimal number of screen columns to keep to the left and to the right of the cursor
    -- scrolljump = 3,    -- How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
    -- sidescroll = 3,    -- The minimal number of columns to scroll horizontally
    -- )))

    -- gutter (number and signcolumn) settings (((
    number = true,          -- set numbered lines
    relativenumber = true,  -- set relative numbered lines
    numberwidth = 4,        -- set number column width to 2 {default 4}
    signcolumn = "yes",     -- always show the sign column, otherwise it would shift the text each time diagnostics appear/become resolved
    -- )))

    clipboard = "unnamedplus",   -- allows neovim to access the system clipboard
    cmdheight = 2,               -- more space in the neovim command line for displaying messages. Height of command-line (easy-readable). Better display for messages.
    completeopt = { "menuone",  "noselect" }, -- mostly just for cmp
    fileencoding = "utf-8",      -- the encoding written to a file
    guifont = "monospace:h17",   -- the font used in graphical neovim applications
    mouse = "a",                 -- allow the mouse to be used in neovim (in all modes)
    pumheight = 10,              -- pop up menu height.Maximum number of items to show in the popup menu (|ins-completion-menu|). Zero means "use available screen space". Default is 0.
    showtabline = 2,             -- always show tabs
    splitbelow = true,           -- force all horizontal splits to go below current window
    splitright = true,           -- force all vertical splits to go to the right of current window
    timeoutlen = 500,            -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,             -- enable persistent undo

}

for k, v in pairs(options) do
    vim.opt[k] = v
end

