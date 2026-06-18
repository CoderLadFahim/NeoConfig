local nightowl_status_ok, nightowl = pcall(require, 'nightowl')
if not nightowl_status_ok then
	return
end

nightowl.setup({
    bold = true,
    italics = false,
    underline = true,
    undercurl = true,
    transparent_background = false,
});

