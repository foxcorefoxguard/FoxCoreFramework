fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development'
description 'FoxCore Civilian Jobs System'
version '1.0.0'

-- Shared Scripts
shared_scripts {
    '@ox_lib/init.lua',  -- Optional: Remove if not using ox_lib
    'shared/config.lua'
}

-- Client Scripts
client_scripts {
    'client/main.lua'
}

-- Server Scripts
server_scripts {
    '@oxmysql/lib/MySQL.lua', -- Required if using oxmysql for payouts or data saving
    'server/main.lua'
}

-- Dependencies
dependencies {
    'foxcore_framework',    -- Ensure FoxCore is loaded first
    'ox_lib'      -- Optional: Remove if not using ox_lib for notifications or UI
}

-- Files (Add any additional files like images or UI later)
files {}

-- Lua Version
lua54 'yes'
