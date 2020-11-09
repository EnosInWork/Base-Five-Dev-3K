fx_version 'adamant'
games { 'gta5' };

server_script "@mysql-async/lib/MySQL.lua"
client_scripts {
	'@es_extended/locale.lua',

	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'locales/tr.lua',
	'locales/cs.lua',
	'config.lua',
	'dependencies/menu.lua',

	'cl_autres.lua'
}

server_scripts {
      'sv_deco.lua',
}

   

-- Creator Neo