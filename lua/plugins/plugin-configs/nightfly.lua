local nightfly_status_ok, nightfly = pcall(require, 'nightfly')
if not nightfly_status_ok then
	return
end

local custom_highlight = vim.api.nvim_create_augroup("HarpoonActive", {})
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "nightfly",
    callback = function()
        vim.api.nvim_set_hl(0, "HarpoonActive", { bg = "#82aaff" })
        vim.api.nvim_set_hl(0, "HarpoonNumberActive", { bg = "#82aaff" })
    end,
    group = custom_highlight,
})

-- Lua initialization file
vim.g.nightflyItalics = false
