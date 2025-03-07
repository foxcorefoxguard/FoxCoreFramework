fx_version 'cerulean'
game 'gta5'

author 'FoxCore Dev Team'
description 'FoxCore Police System with Evidence System, Vehicles, Dispatch & DOJ Integration'
version '1.0.0'

dependencies {
    'foxcore_framework',
    'foxcore_mdt',
    'foxcore_target'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js',
    'nui/media/icons/*.png'
}

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/police.lua',
    'client/radio.lua',
    'client/evidence.lua',
    'client/vehicles.lua',
    'client/fingerprint.lua',
    'client/dna.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/evidence.lua'
}

lua54 'yes'
