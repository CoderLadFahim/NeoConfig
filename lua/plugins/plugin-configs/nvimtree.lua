local nvim_tree_status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_status_ok then
	return
end

-- OR setup with some options
nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    side = 'right',
    width = 40,
    relativenumber = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

