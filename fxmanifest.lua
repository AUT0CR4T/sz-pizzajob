fx_version 'cerulean'
game 'gta5'

author 'StunZ'
description 'Created for DreamLand RP'
version = '0.0.1'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'qb-target',
    'qb-menu',
    'jim-payments'
}

shared_scripts {
    'shared/config.lua'
}

lua54 'yes'
