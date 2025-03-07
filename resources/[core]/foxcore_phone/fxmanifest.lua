fx_version 'cerulean'
game 'gta5'

author 'FoxCore Dev Team'
description 'FoxCore Phone System'
version '1.0.0'

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js',
    'nui/media/backgrounds/*.jpg',
    'nui/media/frames/*.png',
    'nui/media/sounds/*.mp3',
    'nui/media/ringtones/*.mp3'
}

shared_scripts {
    'shared/config.lua'
}

client_scripts {
    'client/phone.lua',
    'client/calls.lua',
    'client/sms.lua',
    'client/banking.lua',
    'client/marketplace.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/calls.lua',
    'server/sms.lua',
    'server/banking.lua',
    'server/marketplace.lua'
}

lua54 'yes'
