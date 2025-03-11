fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development'
description 'FoxCore Loading Screen'
version '1.0.0'

-- UI Page
ui_page 'nui/index.html'

-- Files
files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js'
}

-- Client & Server Scripts
client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

lua54 'yes'
