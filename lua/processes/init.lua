function GET_CURRENT_DIRECTORY()
    local path = vim.loop.cwd()
    return vim.fn.fnamemodify(path, ':t')
end

local process_modules= {
    'statusline',
    'winbar',
}

for _, value in ipairs(process_modules) do
    local path = 'processes.' .. value;
    require(path);
end
