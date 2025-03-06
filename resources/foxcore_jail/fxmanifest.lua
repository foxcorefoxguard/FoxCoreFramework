fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development'
description 'FoxCore Jail - Fully integrated jail system'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/jail.lua',
    'client/escape.lua',
    'client/crafting.lua',
    'client/prison_shop.lua'
}

server_scripts {
    'server/jail_system.lua',
    'server/escape_system.lua',
    'server/prison_jobs.lua',
    'server/contraband.lua'
}

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js'
}

dependencies {
    'foxcore_framework',
    'foxcore_mdt',
    'foxcore_hud',
    'foxcore_target'
}

lua54 'yes'
