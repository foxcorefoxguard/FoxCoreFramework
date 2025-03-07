fx_version 'cerulean'
game 'gta5'

author 'FoxCore Dev Team'
description 'FoxCore Advanced HUD'
version '1.0.0'

dependencies {
    'foxcore_framework',
    'foxcore_gassystem',
    'foxcore_banking'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js'
}

client_scripts {
    'client/hud.lua',
    'client/config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

lua54 'yes'
