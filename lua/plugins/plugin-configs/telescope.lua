local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
	return
end

telescope.setup(
    -- {
    --     defaults = {
    --         file_ignore_patterns = {'package', 'public/vendor', 'public/install', 'package/installer', 'composer.lock', 'package-lock.json', 'yarn.lock', }
    --     }
    -- }
)

