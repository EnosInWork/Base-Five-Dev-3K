fx_version 'adamant'



game 'gta5'


------------ ValUI ( vMenu ) ------------

server_script {
    'src/server/update.lua',
}


client_scripts {
    "src/vMenu.lua",
    "src/menu/ValUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}


client_scripts {

    'v_client.lua',
    'config.lua',
    'v_pacific.lua'

}


server_scripts {
    'v_server.lua'
}

dependencies {
    'es_extended',
}

