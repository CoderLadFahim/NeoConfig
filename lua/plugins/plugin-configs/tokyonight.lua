local tokyonight_status_ok, tokyonight = pcall(require, 'tokyonight')
if not tokyonight_status_ok then
	return
end

tokyonight.setup({ 
    style = 'night', -- 'storm', 'day', 'night', 'moon'
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
        sidebars = 'transparent',
        floats = 'transparent',
    },
    on_highlights = function(hl, c)

        -- ["LineNr"] = { fg = '#7f8c8d' },
        -- ["CursorLineNr"] = { fg = '$blue', fmt = 'bold' },
        -- Override specific highlight groups
        hl.LineNr = {
            fg = c.green,
        }
  end,
})

-- vim.cmd('colo tokyonight')
