fx_version 'cerulean'
game 'gta5'

author 'FoxCore Dev Team'
description 'FoxCore Advanced Targeting System'
version '1.0.0'

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js',
    'nui/media/icons/*.png'
}

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/target.lua',
    'client/interactions.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

lua54 'yes'
