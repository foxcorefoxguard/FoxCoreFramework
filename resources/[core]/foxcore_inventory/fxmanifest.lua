fx_version 'cerulean'
game 'gta5'

author 'FoxCore Dev Team'
description 'FoxCore Advanced Inventory & Banking System'
version '3.0.0'

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js'
}

shared_scripts {
    'shared/config.lua',
    'shared/items.lua',
    'shared/weights.lua',
    'shared/weapons.lua'
}

client_scripts {
    'client/inventory.lua',
    'client/stash.lua',
    'client/trunk.lua',
    'client/banking.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/inventory.lua',
    'server/stash.lua',
    'server/trunk.lua',
    'server/banking.lua'
}

lua54 'yes'
