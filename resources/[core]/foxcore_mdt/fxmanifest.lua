fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development'
description 'FoxCore MDT - Realistic Law Enforcement Database'
version '2.0'

-- Dependencies (Ensuring Compatibility with Core Systems)
dependencies {
    'foxcore_framework',
    'foxcore_mdt',
    'foxcore_target',
    'foxcore_phone',
    'foxcore_banking',
    'foxcore_inventory',
    'foxcore_radio'
}

-- Server Scripts
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/charges.lua',
    'server/warrants.lua',
    'server/court.lua'
}

-- Client Scripts
client_scripts {
    'client/main.lua',
    'client/fingerprint.lua',
    'client/evidence.lua',
    'client/camera.lua'
}

-- UI & NUI Configuration
ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js',
    'nui/images/*.png',
    'nui/layouts/*.json'
}

-- Shared Configurations
shared_scripts {
    'config.lua',
    'charges/charges.lua'
}

lua54 'yes'
