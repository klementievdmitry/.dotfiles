-- Keybindings
local silent = { silent = true, noremap = true }

-- Quit, close buffers, etc.
vim.keymap.set('n', '<leader>q', '<cmd>qa<cr>', silent)
vim.keymap.set('n', '<leader>x', '<cmd>x!<cr>', silent)
vim.keymap.set('n', '<leader>d', '<cmd>BufDel<cr>', { silent = true, nowait = true, noremap = true })

-- Save buffer
vim.keymap.set('i', '<c-s>', '<esc><cmd>w<cr>a', silent)
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', silent)

-- Version control
vim.keymap.set('n', 'gs', '<cmd>Neogit<cr>', silent)

-- Yank to clipboard
vim.keymap.set('n', 'y+', '<cmd>set opfunc=util#clipboard_yank<cr>g@', silent)
vim.keymap.set('v', 'y+', '<cmd>set opfunc=util#clipboard_yank<cr>g@', silent)

-- Window movement
-- IMPORTANT:
-- <c-w> is binded in wezterm for current tab closing.
-- Change this in `~/.dotfiles/.config/wezterm/wezterm.lua`
-- if you don't need this
vim.keymap.set('n', '<c-h>', '<c-w>h', silent)
vim.keymap.set('n', '<c-j>', '<c-w>j', silent)
vim.keymap.set('n', '<c-k>', '<c-w>k', silent)
vim.keymap.set('n', '<c-l>', '<c-w>l', silent)

-- Tab movement
vim.keymap.set('n', '<c-Left>', '<cmd>tabpre<cr>', silent)
vim.keymap.set('n', '<c-Right>', '<cmd>tabnext<cr>', silent)
