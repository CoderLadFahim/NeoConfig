local fzf_status_ok, fzf = pcall(require,"fzf-lua")
if not fzf_status_ok then
	return
end

fzf.setup({
    -- 'telescope',
    winopts = {
        preview = {
            layout = 'vertical',
            scrollbar = false,
            vertical = 'up:60%',
        },
    },
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
})

