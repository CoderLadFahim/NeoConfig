local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
	return
end

telescope.setup(
    {
        defaults = {
            file_ignore_patterns = {
                'package',
                'vendor',
                'public/vendor',
                'node_modules',
                'public',
                'composer.lock',
                'package-lock.json',
                'yarn.lock',
            }
        }
    }
)

