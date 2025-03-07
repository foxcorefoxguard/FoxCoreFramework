fx_version 'cerulean'
game 'gta5'

author 'FoxCore Dev Team'
description 'FoxCore Black Market & Money Laundering System'
version '1.1.0'

dependencies {
    'foxcore_inventory',
    'foxcore_banking'
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
    'client/blackmarket.lua',
    'client/moneylaunder.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/moneylaunder.lua'
}

lua54 'yes'
