fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development'
description 'FoxCore Paycheck System with Multi-Bank Support'
version '1.0.0'

shared_scripts {
    '@foxcore_framework/shared.lua',
    'shared/config.lua',
}

client_scripts {
    '@foxcore_target/client.lua',
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

dependencies {
    'foxcore_framework',
    'foxcore_banking',
    'foxcore_target'
}

lua54 'yes'
