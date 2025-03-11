fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development Team'
description 'FoxCore Job Center UI'
version '1.0.0'

shared_scripts {
    'shared/config.lua'
}

client_scripts {
    'client/main.lua',
    'client/ui.lua'
}

server_scripts {
    'server/main.lua'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js'
}

lua54 'yes'
