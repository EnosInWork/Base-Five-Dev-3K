fx_version 'adamant'
games { 'gta5' };

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'server.lua',
    'config.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	"menu_main.lua",
    "menu.lua",
    'config.lua'
}

dependencies {
	'es_extended',
	'esx_billing'
}