fx_version 'bodacious'
game 'gta5'


server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "bans.lua",
    "configs/config_sv.lua",
    "server.lua",
}

client_scripts {
    "client.lua",
}

shared_scripts {
    "configs/config_cl.lua",
}