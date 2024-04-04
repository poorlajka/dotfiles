
local nnoremap = vim.keymap.set
local silent = { silent = true }

-- Make ctrl-c behave like esc
nnoremap("!", "<C-c>", "<Esc>", silent)
nnoremap("n", "<C-c>", "<silent> <C-c>")

-- Run macro q
nnoremap({ 'n', 'v' }, "<C-q>", ":normal @q <CR>", silent)

-- Remap carrot keybinds cause I hate reaching for it
nnoremap('n', "<C-p>", "<C-^>")
nnoremap('n', '0', '^')

-- Make global marks resume to prev line in buffer
nnoremap('n', "'M", "'M'\"zz")
nnoremap('n', "'N", "'N'\"zz")
nnoremap('n', "'J", "'J'\"zz")
nnoremap('n', "'K", "'K'\"zz")
nnoremap('n', "'L", "'L'\"zz")
nnoremap('n', "'H", "'H'\"zz")

-- Set scrolling to 15 lines 
nnoremap("n", "<C-u>", "15<C-u>", silent)
nnoremap("n", "<C-d>", "15<C-d>", silent)

-- resizing splits
local splits = require("smart-splits")
nnoremap('n', '<S-h>', splits.resize_left)
nnoremap('n', '<S-j>', splits.resize_down)
nnoremap('n', '<S-k>', splits.resize_up)
nnoremap('n', '<S-l>', splits.resize_right)

-- moving between splits
nnoremap('n', '<C-h>', splits.move_cursor_left)
nnoremap('n', '<C-j>', splits.move_cursor_down)
nnoremap('n', '<C-k>', splits.move_cursor_up)
nnoremap('n', '<C-l>', splits.move_cursor_right)

-- swapping buffers between windows
nnoremap('n', '<A-h>', splits.swap_buf_left)
nnoremap('n', '<A-j>', splits.swap_buf_down)
nnoremap('n', '<A-k>', splits.swap_buf_up)
nnoremap('n', '<A-l>', splits.swap_buf_right)

-- Fuzzy finding
local telescope = require('telescope.builtin')
nnoremap('n', '<C-e>', telescope.find_files)
nnoremap('n', '<C-g>', telescope.live_grep)
nnoremap('n', '<C-f>', telescope.buffers)

-- Open file explorer
nnoremap("n", "<C-b>", ":Neotree toggle <CR>", silent)

--[[
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
]]--

