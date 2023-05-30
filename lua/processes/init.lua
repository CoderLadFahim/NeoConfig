local process_modules= {
    'statusline',
}

for _, value in ipairs(process_modules) do
    local path = 'processes.' .. value;
    require(path);
end
