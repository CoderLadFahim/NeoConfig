local status_ok, none_ls = pcall(require, "none-ls")
if not status_ok then return end
-- null_ls.setup(astronvim.user_plugin_opts "plugins.none-ls")

-- local null_ls = require("none-ls")

none_ls.setup({
  	on_attach = function(client, bufnr)
    	if client.server_capabilities.documentFormattingProvider then
      	    vim.cmd("nnoremap <silent><buffer> <Leader>$$ :lua vim.lsp.buf.format()<CR>")
    		--   --
    		--   -- format on save
    		-- vim.cmd("autocmd BufWritePost <buffer> Prettier")
    	end
    	--
    	if client.server_capabilities.documentRangeFormattingProvider then
      	    vim.cmd("xnoremap <silent><buffer> <Leader>$$ :lua vim.lsp.buf.format()<CR>")
    	end
  	end,
  	sources = {
    	null_ls.builtins.formatting.prettier,
    	null_ls.builtins.formatting.autopep8
  	}
})
