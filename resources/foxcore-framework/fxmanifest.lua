fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development Team'
description 'FoxCore - Modular RP Framework'
version '1.0.0'

shared_scripts {
    'shared/config.lua',
    'shared/framework.lua'
}

client_scripts {
    'client/main.lua',
    'client/utils.lua',
    'client/player.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua', -- Database support
    'server/main.lua',
    'server/database.lua',
    'server/commands.lua'
}

lua54 'yes'
