fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development Team'
description 'FoxCore - Modular RP Framework'
version '1.0.0'

-- 📌 Shared Scripts
shared_scripts {
    'shared/config.lua',
    'shared/framework.lua'
}

-- 📌 Client Scripts
client_scripts {
    'client/main.lua',
    'client/utils.lua',
    'client/player.lua'
}

-- 📌 Server Scripts
server_scripts {
    '@oxmysql/lib/MySQL.lua', -- Database support
    'server/main.lua',
    'server/database.lua',
    'server/commands.lua'
}

-- 🔄 Bridge Support - Auto-Detect & Load `foxcore/bridge/qb`
if GetResourceState("foxcore_bridge") == "started" and GetResourceState("foxcore_bridge/qb") == "started" then
    print("[🔥 FoxCore] QBCore Bridge detected! Loading `foxcore_bridge/qb`...")
    
    -- ✅ Load Bridge Scripts
    shared_scripts { 'bridge/qb/shared/main.lua', 'bridge/qb/shared/functions.lua' }
    client_scripts { 'bridge/qb/client/main.lua' }
    server_scripts { 'bridge/qb/server/main.lua' }
else
    print("[⚠️ FoxCore] WARNING: No `foxcore_bridge/qb` detected! If using QBCore scripts, install it.")
end


lua54 'yes'
