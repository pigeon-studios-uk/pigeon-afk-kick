fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-afk-kick'
author 'Pigeon Studios'
description 'Warns, then kicks, players who stand still too long, checked on the server, with staff left alone.'
version '0.1.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-afk-kick'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-afk-kick'

shared_scripts {
    'configuration/config.lua',
    'locales/*.lua',
}

client_script 'client/main.lua'

server_scripts {
    'server/main.lua',
    'server/version_check.lua',
}
