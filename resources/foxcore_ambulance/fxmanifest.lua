fx_version 'cerulean'
game 'gta5'

author 'FoxCore Dev Team'
description 'FoxCore Advanced EMS System'
version '1.0.0'

dependencies {
    'foxcore_target',
    'foxcore_mdt',
    'foxcore_phone',
    'foxcore_banking',
    'foxcore_framework',
    'foxcore_inventory',
    'foxcore_hud'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js'
}

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/ambulance.lua',
    'client/revive.lua',
    'client/medical.lua',
    'client/billing.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/medical.lua'
}

lua54 'yes'
