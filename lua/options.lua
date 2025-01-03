vim.loader.enable()
vim.opt.backspace = vim.opt.backspace + { "nostop" } -- Don't stop backspace at insert
vim.opt.clipboard = "unnamedplus" -- Connection to the system clipboard
vim.opt.completeopt = { "menuone", "noselect"  } -- Options for insert mode completion
vim.opt.copyindent = true -- Copy the previous indentation on autoindenting
vim.opt.cursorline = true -- Highlight the text line of the cursor
vim.opt.expandtab = true -- Enable the use of space in tab
vim.opt.fileencoding = "utf-8" -- File content encoding for the buffer
vim.opt.fillchars = { eob = " "  } -- Disable `~` on nonexistent lines
vim.opt.history = 100 -- Number of commands to remember in a history table
vim.opt.ignorecase = true -- Case insensitive searching
vim.opt.laststatus = 3 -- globalstatus
vim.opt.winbar= "%f" -- globalstatus
-- vim.opt.statusline = ""
vim.opt.lazyredraw = true -- lazily redraw screen
vim.opt.mouse = "" -- Enable mouse support
vim.opt.number = true -- Show numberline
vim.opt.preserveindent = true -- Preserve indent structure as much as possible
vim.opt.pumheight = 10 -- Height of the pop up menu
vim.opt.relativenumber = true -- Show relative numberline
vim.opt.scrolloff = 5 -- Number of lines to keep above and below the cursor
vim.opt.shiftwidth = 4 -- Number of space inserted for indentation
vim.opt.showmode = false -- Disable showing modes in command line
vim.opt.sidescrolloff = 8 -- Number of columns to keep at the sides of the cursor
vim.opt.signcolumn = "yes" -- Always show the sign column
-- vim.opt.smartcase = true -- Case sensitivie searching
vim.opt.splitbelow = true -- Splitting a new window below the current one
vim.opt.hlsearch = true -- searh highlight
vim.opt.splitright = true -- Splitting a new window at the right of the current one
vim.opt.swapfile = false -- Disable use of swapfile for the buffer
vim.opt.tabstop = 4 -- Number of space in a tab
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.opt.undofile = true -- Enable persistent undo
vim.opt.updatetime = 300 -- Length of time to wait before triggering the plugin
vim.opt.wrap = true -- Disable wrapping of lines longer than the width of window
vim.opt.writebackup = false -- Disable making a backup before overwriting a file
-- vim.opt.guicursor = "" -- Keeps the cursor fat in insert mode
vim.opt.cc = "100" -- color column
vim.opt.foldmethod = "manual" -- for folds to work properly

vim.opt.termguicolors = true -- set termguicolors to enable highlight groups

