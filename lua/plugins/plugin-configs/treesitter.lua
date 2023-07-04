local tree_sitter_status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not tree_sitter_status_ok then
	return
end

treesitter.setup({
  	-- A list of parser names, or "all"
  	ensure_installed = { "lua", "typescript", "python", "php", "javascript", "scss", "css", "html", "vue", "markdown", "markdown_inline" },

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
  	-- rainbow = {
    --  	enable = true,
    --  	extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    --  	max_file_lines = 1000, -- Do not enable for files with more than n lines, int
  	-- },
  	context_commentstring = {
    	enable = true,
    	enable_autocmd = false,
  	},
	playground = {
    	enable = true,
    	disable = {},
    	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    	persist_queries = false, -- Whether the query persists across vim sessions
    	keybindings = {
      		toggle_query_editor = 'o',
      		toggle_hl_groups = 'i',
      		toggle_injected_languages = 't',
      		toggle_anonymous_nodes = 'a',
      		toggle_language_display = 'I',
      		focus_language = 'f',
      		unfocus_language = 'F',
      		update = 'R',
      		goto_node = '<cr>',
      		show_help = '?',
    	},
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
