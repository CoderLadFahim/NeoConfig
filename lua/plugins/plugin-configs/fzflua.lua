local fzf_status_ok, fzf = pcall(require,"fzf-lua")
if not fzf_status_ok then
	return
end

fzf.setup({
    "telescope",
    winopts = {
        preview = {
            layout = 'vertical',
            scrollbar = false,
            vertical = 'up:60%',
            hidden = true,
        },
    },
    keymap = {
        builtin = {
            ["<C-d>"] = "preview-page-down",
            ["<C-u>"] = "preview-page-up",
        },
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
    grep = {
        winopts = {
            preview = {
                hidden = false,
            },
        },
    },
    grep_string = {
        winopts = {
            preview = {
                hidden = false,
            },
        },
    },
    blines = {
        winopts = {
            preview = {
                hidden = false,
            },
        },
    },
})

