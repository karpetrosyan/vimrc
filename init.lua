require("core.init")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4 

vim.cmd.colorscheme('gruvbox')


vim.keymap.set(
    "n",
    "<c-t>",
    function()
	vim.cmd.e('.')
    end
)

vim.keymap.set(
    "n",
    "<c-h>",
    function()
	vim.cmd.bprevious()
    end
)

vim.keymap.set(
    "n",
    "<c-l>",
    function()
	vim.cmd.bnext()
    end
)

vim.keymap.set(
    {"n", "i"},
    "<c-s>",
    function()
	vim.cmd.w()
    end
)

vim.keymap.set(
    {"n"},
    "<Space>r",
    function ()
	local filetype = vim.bo.filetype
	    
	start = os.clock()

	while os.clock() - start <= 0.5 do end

	vim.cmd.w()

	if filetype == "lua" then
	    vim.cmd [[ so ]]
	elseif filetype == "python" then
	    vim.cmd [[ !python % ]]	
	elseif filetype == "rust" then
	    vim.cmd [[ !cargo run ]]
	end
    end
)

