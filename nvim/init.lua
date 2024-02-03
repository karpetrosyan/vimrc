require("core.init")

vim.cmd[[
    autocmd FocusLost * :wa
]]

-- Enable relative line numbers without absolute line numbers
vim.o.number = true
vim.o.relativenumber = true
