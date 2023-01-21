local nvim_comment_status_ok, nvim_comment = pcall(require, 'nvim_comment')
if not nvim_comment_status_ok then
	return
end

nvim_comment.setup({
	hook = function()
  	  if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
    	 require("ts_context_commentstring.internal").update_commentstring()
  	  end
	end
})
require('nvim_comment').setup()
