local file_types = {'jpg', 'jpeg', 'png', 'webp', 'svg', 'pdf', 'doc', 'docx'}

function get_extensions()
    local extensions = {}
    for i, file_type  in pairs(file_types) do
        local pattern = '*.' .. file_type
        table.insert(extensions, pattern)
    end
    return extensions
end

function split_string(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

vim.api.nvim_create_autocmd('BufRead', {
    pattern = get_extensions(),
    callback = function()
        local file_path = vim.fn.expand("%:p")
        local file_dir = (function()
            local file_path_split = split_string(file_path, '/')
            table.remove(file_path_split, #file_path_split) -- removing the file name to form a path to the dir

            local stringified = ''
            for i, char in pairs(file_path_split) do
                stringified = stringified .. char .. '/'
            end
            return stringified
        end)()

        vim.cmd('!open ' .. file_path)
        vim.cmd('b#|bd#')
        vim.cmd('brev')
        -- vim.cmd('Oil ' .. file_dir)
    end
})
