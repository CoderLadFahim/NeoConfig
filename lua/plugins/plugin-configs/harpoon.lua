local harpoon_status_ok, harpoon = pcall(require, 'harpoon')
if not harpoon_status_ok then
	return
end

harpoon.setup({
    menu = {
        width = math.floor((70 / 100) * vim.api.nvim_get_option("columns")),
    }
})
