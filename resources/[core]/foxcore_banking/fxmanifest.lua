fx_version 'cerulean'
game 'gta5'

author 'FoxCore Dev Team'
description 'FoxCore Advanced Banking System with Targeting Support'
version '1.1.0'

dependencies {
    'foxcore_target'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js',
    'nui/media/cards/*.png',
    'nui/media/atm/*.png',
    'nui/media/sounds/*.mp3'
}

client_scripts {
    'client/banking.lua',
    'client/atm.lua',
    'client/cash.lua',
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

lua54 'yes'
