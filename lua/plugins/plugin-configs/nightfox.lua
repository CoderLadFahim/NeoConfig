local nightfox_status_ok, nightfox = pcall(require, 'nightfox')
if not nightfox_status_ok then
	return
end

nightfox.setup({
    groups = {
        all = {
            WinBar = {
                bg = '#131a24',
            }
        }
    }
});

