fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development Team'
description 'FoxCore - Advanced Criminal Activities'
version '1.0.0'

shared_scripts { 'shared/config.lua' }
client_scripts { 
    'client/main.lua', 
    'client/robbery.lua',
    'client/drugs.lua',
    'client/kidnapping.lua',
    'client/car_theft.lua'
}
server_scripts { 
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua', 
    'server/police_alerts.lua'
}

dependencies { 
    'foxcore_framework', 
    'foxcore_mdt', 
    'foxcore_police', 
    'foxcore_inventory', 
    'foxcore_jail' 
}

lua54 'yes'
