function GET_CURRENT_DIRECTORY()
    local path = vim.loop.cwd()
    return vim.fn.fnamemodify(path, ':t')
end

local process_modules= {
    'statusline',
    'winbar',
    'non_text_file_previews',
    'hightlight_overrides',
}

for _, value in ipairs(process_modules) do
    local path = 'processes.' .. value;
    require(path);
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 200, visual = true })
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("dotenv_ft", { clear = true }),
	pattern = { ".env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dosini"
	end,
})
