fx_version 'cerulean'
game 'gta5'

author 'FoxCore Development Team'
description 'FoxCore Bridge - QBCore Compatibility'
version '1.0.0'

shared_scripts { 'shared/main.lua', 'shared/functions.lua' }
client_scripts { 'client/main.lua' }
server_scripts { 'server/main.lua' }

dependencies {
    'foxcore_framework',
    'qb-core' -- Optional: Only if QBCore is installed
}

lua54 'yes'
