-- Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.linebreak = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true
vim.opt.cursorline = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Fillchars
vim.opt.fillchars = {
    vert = "│",
    fold = " ",
    eob = " ", -- suppress ~ at EndOfBuffer
    --diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

-- Other
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.termguicolors = true
