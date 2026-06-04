local better_digraphs_status_ok, better_digraphs = pcall(require, 'better-digraphs')
if not better_digraphs_status_ok then
	return
end

vim.g.BetterDigraphsAdditions = {
    {
        digraph = "l1",
        symbol = "●",
        name = "list item 1"
    }
}
