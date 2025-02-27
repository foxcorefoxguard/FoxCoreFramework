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

    -- 📌 Backgrounds
    'nui/media/backgrounds/beach.jpg',
    'nui/media/backgrounds/default.jpg',
    'nui/media/backgrounds/minimal.jpg',
    'nui/media/backgrounds/npwd2020.png',
    'nui/media/backgrounds/surf.jpg',
    'nui/media/backgrounds/waves.jpg',

    -- 📌 Frames
    'nui/media/frames/blue.png',
    'nui/media/frames/default.png',
    'nui/media/frames/gold.png',
    'nui/media/frames/kawaii.png',
    'nui/media/frames/legacy.png',
    'nui/media/frames/minimal.png',
    'nui/media/frames/pink.png',
    'nui/media/frames/white.png',

    -- 📌 Sounds
    'nui/media/sounds/2ofUsAlone.mp3',

}

shared_scripts {
    'shared/config.lua'
}

client_scripts {
    'client/phone.lua',
    'client/calls.lua',
    'client/sms.lua',
    'client/banking.lua',
    'client/darkweb.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/phone.lua',
    'server/calls.lua',
    'server/sms.lua',
    'server/banking.lua',
    'server/darkweb.lua'
}

lua54 'yes'
