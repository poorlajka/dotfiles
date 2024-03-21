
local options = {
	-- Use relative linenumbers
	number = true,
	relativenumber = true,

	-- Make splits open either below or right
	splitbelow = true,
	splitright = true,

	-- Disable linewrapping
	wrap = false,

	-- Set tab as 4 spaces
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,

	smartindent = true,

	-- Set right side window padding
	numberwidth = 5,

	-- Show highlight for current line
	cursorline = true,

	showmode = false,

	-- Sync OS and Neovim clipboard.
	clipboard = "unnamedplus",

	-- Ignore case in search unless uppercase is present
	ignorecase = true,
	smartcase = true,

	-- Disable search highlighting 
	hlsearch = false,

	-- Enable selecting empty cells with visual block 
	virtualedit = "block",

	-- Enable true colors 
	termguicolors = true,

	-- Enable mouse mode
	mouse = 'a',

	-- Keep signcolumn on by default
	signcolumn = 'yes',

	-- Save undo history between closing/opening file
	undofile = true,

	-- Set completeopt to have a better completion experience
	completeopt = 'menuone,noselect',

	-- Always display statusline 
	laststatus = 2,

	-- Decrease update time
	updatetime = 20,

	-- Don't echo normal mode commands
	showcmd = false,

    --colorcolumn = "80"
}

for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.cmd("setlocal spell spelllang=en_us")

