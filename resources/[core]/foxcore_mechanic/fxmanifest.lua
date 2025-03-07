fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development'
description 'FoxCore Mechanic - Advanced Repair, Tuning, & Impound System'
version '1.0.0'

shared_scripts { 'config.lua' }

client_scripts {
    'client/main.lua',
    'client/repairs.lua',
    'client/tuning.lua',
    'client/tow.lua',
    'client/animations.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/billing.lua',
    'server/inventory.lua',
    'server/impound.lua'
}

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js'
}

ui_page 'nui/index.html'

dependencies {
    'foxcore_framework',
    'foxcore_banking',
    'foxcore_inventory',
    'foxcore_tow',
    'oxmysql'
}

lua54 'yes'
