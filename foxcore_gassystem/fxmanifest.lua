fx_version 'cerulean'
game 'gta5'

author 'OutlawFoxTV'
description 'Standalone Gas System with Framework Integration (FoxCore, QB-Core, ESX)'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua', -- Remove this if you don't use MySQL
    'server.lua'
}

ui_page 'html/index.html' -- If you're adding a UI for the fuel gauge

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

dependencies {
    'oxmysql' -- Only needed if you plan to save fuel levels to a database
}
