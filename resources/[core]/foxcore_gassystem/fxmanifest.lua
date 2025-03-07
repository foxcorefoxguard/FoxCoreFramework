fx_version 'cerulean'
game 'gta5'

author 'FoxCore Dev Team'
description 'FoxCore Advanced Gas System with Config Support'
version '1.1.0'

dependencies {
    'foxcore_framework',
    'foxcore_target',
    'foxcore_phone',
    'foxcore_banking'
}

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
    'client/gas.lua',
    'client/target.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

lua54 'yes'
