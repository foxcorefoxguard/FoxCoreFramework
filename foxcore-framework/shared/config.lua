Config = {}

-- MySQL connection
Config.Database = {
    host = "127.0.0.1",
    user = "root",
    password = "",
    database = "foxcore"
}

-- Basic framework settings
Config.Framework = {
    debug = true, -- Enable debug mode for developers
    defaultSpawn = vector3(-269.4, -955.1, 31.2), -- Default spawn point
    characterSystem = true -- Enable character selection system
}
