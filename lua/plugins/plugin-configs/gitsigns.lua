local gitsigns_status_ok, gitsigns = pcall(require, 'gitsigns')
if not gitsigns_status_ok then
	return
end

gitsigns.setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', ']]', gs.next_hunk)
    map('n', '[[', gs.prev_hunk)
    map('n', '<leader>hb', gs.blame_line)
    map('n', '<leader>hv', gs.preview_hunk)
    map('n', '<leader>hr', gs.reset_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>htb', gs.toggle_current_line_blame)
  end
})

