require("plugins")

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd [[ set relativenumber ]] 
vim.cmd [[ colorscheme gruvbox ]]

vim.keymap.set('n', '<c-t>', function() vim.cmd [[ e . ]] end)

vim.keymap.set('n', '<c-h>', function() vim.cmd [[ bprevious ]] end)
vim.keymap.set('n', '<c-l>', function() vim.cmd [[ bnext ]] end)

