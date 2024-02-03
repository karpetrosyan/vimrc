local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls", "pyright", "ruff_lsp"},
	handlers = {
		lsp_zero.default_setup,
	},
})

require('lspconfig').lua_ls.setup({ handlers = { ['textDocument/publishDiagnostics'] = function(...) end } })

require('lspconfig').pyright.setup{}

require('lspconfig').ruff_lsp.setup {
	init_options = {
		settings = {
		}
	}
}
