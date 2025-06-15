local tree_sitter_status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not tree_sitter_status_ok then
	return
end

treesitter.setup({
  	-- A list of parser names, or "all"
  	ensure_installed = { 
  	    "lua",
  	    "typescript",
  	    "python",
  	    "php",
  	    "javascript",
  	    "tsx",
  	    "scss",
  	    "css",
  	    "html",
  	    "vue",
  	    "markdown",
  	    "markdown_inline",
  	},

  	-- Install parsers synchronously (only applied to `ensure_installed`)
  	sync_install = false,

  	-- Automatically install missing parsers when entering buffer
  	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  	auto_install = false,

  	-- List of parsers to ignore installing (for "all")
  	-- ignore_install = { "javascript", "cmake" },

  	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  	indent ={
    	enable = true,
  	},

  	highlight = {
    	-- `false` will disable the whole extension
    	enable = true,

    	-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    	-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    	-- the name of the parser)
    	-- list of language that will be disabled
    	disable = { "c", "rust" },
    	-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    	disable = function(lang, buf)
        	local max_filesize = 100 * 1024 -- 100 KB
        	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        	if ok and stats and stats.size > max_filesize then
                return true
        	end
    	end,

    	-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    	-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    	-- Using this option may slow down your editor, and you may see some duplicate highlights.
    	-- Instead of true it can also be a list of languages
    	additional_vim_regex_highlighting = false,
  	},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["ii"] = "@conditional.inner",
                ["ai"] = "@conditional.outer",
                ["il"] = "@loop.inner",
                ["al"] = "@loop.outer",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = false,
        },
        move = {
            enable = true, 
            goto_next_start = {
                ["]f"] = "@function.outer"
            },
            goto_previous_start = {
                ["[f"] = "@function.outer"
            }
        }
    }
})

local ts_utils_status_ok, ts_utils = pcall(require, 'nvim-treesitter.ts_utils')
if not ts_utils_status_ok then
	return
end

function MyCursorMoved()
 	local node = ts_utils.get_node_at_cursor()
 	local nodes_to_check = {'<node start_tag>', '<node tag_name>', '<node self_closing_tag>'}
 	local node_under_cursor = tostring(node)

	set_keymap('i', '=', '=')

 	if (table.concat(nodes_to_check, ','):find(node_under_cursor)) then
		set_keymap('i', '=', '=""<LEFT>')
	end
end

vim.api.nvim_create_autocmd({ 'CursorMoved', 'InsertEnter', 'InsertLeave' }, {
    pattern = '*',
    callback = MyCursorMoved
})


local treesitter_context_ok, treesitter_context = pcall(require, 'treesitter-context')
if not treesitter_context_ok then
	return
end

treesitter_context.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    multiwindow = false, -- Enable multiwindow support.
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

