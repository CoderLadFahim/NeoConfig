local prettier_status_ok, prettier = pcall(require, 'prettier')
if not prettier_status_ok then
	return
end

prettier.setup({
  	bin = 'prettier', -- or `'prettierd'` (v0.22+)
  	filetypes = {
    	"css",
    	"graphql",
    	"html",
    	"javascript",
    	"javascriptreact",
    	"json",
    	"less",
    	"markdown",
    	"scss",
    	"typescript",
    	"typescriptreact",
    	"yaml",
    	"vue",
    	-- "php",
  	},
  	cli_options = {
     	arrow_parens = "always",
     	bracket_spacing = false,
     	bracket_same_line = false,
     	bracket_line = false,
     	embedded_language_formatting = "auto",
     	end_of_line = "lf",
     	html_whitespace_sensitivity = "css",
     	-- jsx_bracket_same_line = false,
     	jsx_single_quote = false,
     	print_width = 80,
     	prose_wrap = "preserve",
     	quote_props = "as-needed",
     	semi = false,
     	single_attribute_per_line = true,
     	single_quote = true,
     	trailing_comma = "es5",
     	config_precedence = "file-override",
     	-- use_tabs = false,
     	-- tab_width = 4,
     	--
     	use_tabs = true,
     	tab_width = 5,
     	vue_indent_script_and_style = false,
  	},
})

