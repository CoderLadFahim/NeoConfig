local vscode_status_ok, vscode = pcall(require, 'vscode')
if not vscode_status_ok then
	return
end

vscode.setup({
  -- Underline `@markup.link.*` variants
  underline_links = true,
  -- Override highlight groups (see ./lua/vscode/theme.lua)
  group_overrides = {
    -- this supports the same val table as vim.api.nvim_set_hl
    -- use colors from this colorscheme by requiring vscode.colors!
    Winbar = { fg='#d4d4d4', bg='#373737', bold=false },
    ColorColumn = { bg='#373737' },
  }
})
