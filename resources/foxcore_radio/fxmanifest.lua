fx_version 'cerulean'
game 'gta5'

author 'FoxCore Dev Team'
description 'FoxCore Motorola Radio System with Multiple Radio Models'
version '1.6.0'

dependencies {
    'foxcore_framework'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/script.js',
    'nui/style.css',
    'nui/sounds/radio_on.ogg',
    'nui/sounds/radio_off.ogg',
    
    -- Radio Model UI Files
    'nui/layouts/XTS5000/index.html',
    'nui/layouts/XTS5000/style.css',
    'nui/layouts/XPR7550/index.html',
    'nui/layouts/XPR7550/style.css',
    'nui/layouts/APX8000/index.html',
    'nui/layouts/APX8000/style.css',
    'nui/layouts/Motorola-O9/index.html',
    'nui/layouts/Motorola-O9/style.css',

    -- Radio Fonts 
    'html/fonts/digital_counter_7_italic.ttf',
	'html/fonts/ImperfectaRegular.ttf',
	'html/fonts/EFJFont.ttf'
}

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/radio.lua',
    'client/ui.lua',
    'client/mic.lua',
    'client/dispatcher.lua',
    'client/keybinds.lua'
}

server_scripts {
    'server/server.lua',
    'server/dispatcher.lua'
}

lua54 'yes'
