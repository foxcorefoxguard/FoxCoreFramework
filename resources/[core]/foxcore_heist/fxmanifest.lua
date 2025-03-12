fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development'
description 'FoxCore Heist System'
version '1.0.0'

dependencies {
    'foxcore_framework',
    'foxcore_target',
    'foxcore_inventory'
}

shared_scripts {
    'shared/config.lua',
    'shared/utils.lua'
}

client_scripts {
    'client/tablet.lua',
    'client/main.lua',
    'client/boosting.lua',
    'client/bank.lua',
    'client/house.lua',
    'client/package.lua',
    'client/mailbox.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/heist_logic.lua'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js'
}

lua54 'yes'
