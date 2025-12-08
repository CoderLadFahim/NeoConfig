local env = {
    vue_plugin_path = '',
    
    -- Database configurations for vim-dadbod
    -- Format for each database:
    -- {
    --   name = 'database_name',        -- Identifier used in dadbod
    --   type = 'postgresql',           -- Database type: postgresql, mysql, sqlite, etc.
    --   user = 'username',             -- Database username
    --   password = 'password',         -- Database password
    --   host = 'localhost',            -- Database host (use 'localhost' for local databases)
    --   database = 'database_name'     -- The actual database name
    -- }
    databases = {
        {
            name = 'educare',
            type = 'postgresql',
            user = 'educare',
            password = 'secret',
            host = 'database',
            database = 'educare'
        },
    }
}

return env
