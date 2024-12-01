local fzf_status_ok, fzf = pcall(require,"fzf-lua")
if not fzf_status_ok then
	return
end

fzf.setup({
    prompt = '=>',
    winopts = {
        fzf_opts = {
            layout = 'reverse-list'
        },
        preview = {
            layout = 'horizontal'
        },
        split = "botright new"
    },
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
})

