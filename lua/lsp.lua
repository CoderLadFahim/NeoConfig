local lsp_status_ok, neovim_lsp = pcall(require, 'lspconfig');
if not lsp_status_ok then
	return
end

function directoryExists(path)
    local ok, err, code = os.rename(path, path)
    if not ok then
        if code == 13 then
            return true
        end
        return false
    end
    return true
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
    vim.diagnostic.config({ virtual_text = true })	
  	local bufopts = { noremap=true, silent=true, buffer=bufnr }
  	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  	vim.keymap.set('n', 'gp', function() 
  	    vim.cmd('vs')
        vim.lsp.buf.definition()
  	end, bufopts)
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

  	print('lsp attached');
end

local lsp_flags = { debounce_text_changes = 150 }
local lsp_options = { on_attach = on_attach, flags = lsp_flags }

local macos_ts_tsdk_location = '/usr/local/lib/node_modules/typescript/lib'
local linux_ts_tsdk_location = '/mnt/c/Users/Fahim al Emroz/AppData/Roaming/npm/node_modules/typescript/lib'
local linux_ts_tsdk_location2 = '/home/fahim/.nvm/versions/node/v20.10.0/lib/node_modules/typescript/lib'

local tsdk_to_use = nil

if (directoryExists(linux_ts_tsdk_location2)) then
	tsdk_to_use = linux_ts_tsdk_location2 
elseif (directoryExists(linux_ts_tsdk_location)) then
	tsdk_to_use = linux_ts_tsdk_location 
else
	tsdk_to_use = macos_ts_tsdk_location 
end

local tsserver_options = {
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = "/home/fahim/.config/nvm/versions/node/v20.11.1/lib/node_modules/@vue/typescript-plugin",
                languages = {"javascript", "typescript", "vue"},
            },
        },
    },
  	filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  	on_attach = on_attach,
  	flags = lsp_flags
}

neovim_lsp['phpactor'].setup(lsp_options)
neovim_lsp['pyright'].setup(lsp_options)
-- neovim_lsp['tsserver'].setup(lsp_options)
neovim_lsp['tsserver'].setup(tsserver_options)

neovim_lsp['tailwindcss'].setup({});
neovim_lsp['emmet_ls'].setup({
	filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'javascript', 'typescript', 'php', 'vue' }
})


local lspsaga_status_ok, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status_ok then
	return
end

lspsaga.setup({
    symbol_in_winbar = {
        enable = false,
    },
    lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = false,
        keys = {
            -- string | table type
            quit = "q",
            exec = "<CR>",
        },
    },
})

