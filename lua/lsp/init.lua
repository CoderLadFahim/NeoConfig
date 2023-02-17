local lsp_status_ok, neovim_lsp = pcall(require, 'lspconfig');
if not lsp_status_ok then
	return
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  	-- Mappings.
  	-- See `:help vim.lsp.*` for documentation on any of the below functions
  	local bufopts = { noremap=true, silent=true, buffer=bufnr }
  	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  	-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  	-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  	-- vim.keymap.set('n', '<space>wl', function()
  	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  	-- end, bufopts)
  	vim.keymap.set('n', '<space>td', vim.lsp.buf.type_definition, bufopts)
  	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = { debounce_text_changes = 150 }
local lsp_options = { on_attach = on_attach, flags = lsp_flags }
local volar_options = {
  	init_options = {
    	typescript = {
      		tsdk = '/mnt/c/Users/Fahim al Emroz/AppData/Roaming/npm/node_modules/typescript/lib'
    	}
  	},
  	filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  	on_attach = on_attach,
  	flags = lsp_flags
}

neovim_lsp['intelephense'].setup(lsp_options)
-- neovim_lsp['tsserver'].setup(lsp_options)
neovim_lsp['volar'].setup(volar_options)

neovim_lsp['tailwindcss'].setup({});
neovim_lsp['emmet_ls'].setup({
	filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'javascript', 'typescript' }
})

neovim_lsp['lua_ls'].setup({
  	settings = {
    	Lua = {
      	runtime = {
        		-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        		version = 'LuaJIT',
      	},
      	diagnostics = {
        		-- Get the language server to recognize the `vim` global
        		globals = {'vim'},
      	},
      	workspace = {
        		-- Make the server aware of Neovim runtime files
        		library = vim.api.nvim_get_runtime_file("", true),
      	},
      	-- Do not send telemetry data containing a randomized but unique identifier
      	telemetry = {
        		enable = false,
      	},
    	},
  	},
})

