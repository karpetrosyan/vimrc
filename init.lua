require("core.init")

all_modes = { "n", "v", "s", "x", "o", "i", "l", "c", "t" }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4

vim.cmd.colorscheme('gruvbox')


vim.keymap.set(
	all_modes,
	"<c-t>",
	function()
		vim.cmd.e('.')
	end
)

vim.keymap.set(
	all_modes,
	"<c-h>",
	function()
		vim.cmd.bprevious()
	end
)

vim.keymap.set(
	all_modes,
	"<c-l>",
	function()
		vim.cmd.bnext()
	end
)

vim.keymap.set(
	all_modes,
	"<c-s>",
	function()
		vim.cmd.w()
	end
)

vim.keymap.set(
	all_modes,
	"<Space>r",
	function()
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

vim.keymap.set(
	all_modes,
	"<c-\\>",
	vim.cmd.ToggleTerm
)

vim.keymap.set(
	{"n", "i"},
	"<c-a>",
	function ()
	    vim.cmd("normal! ggVG")
    end
    )
