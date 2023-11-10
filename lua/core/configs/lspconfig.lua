local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls" },
	handlers = {
		lsp_zero.default_setup,
	},
})

require('lspconfig').lua_ls.setup({ handlers = { ['textDocument/publishDiagnostics'] = function(...) end } })

require('lspconfig').ruff_lsp.setup {
	on_attach = function()
	end,
	init_options = {
		settings = {
			args = { "--config=" .. vim.env.HOME .. "/.config/nvim/lua/core/configs/pyproject.toml" },
		}
	}
}
