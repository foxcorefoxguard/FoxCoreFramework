fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development Team'
description 'FoxCore Multi-Character System'
version '1.0.0'

shared_scripts { 'shared/config.lua' }
client_scripts { 
    'client/main.lua', 
    'client/cutscene.lua'
}
server_scripts { 
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js'
}

dependencies { 
    'foxcore_framework'
}

lua54 'yes'
