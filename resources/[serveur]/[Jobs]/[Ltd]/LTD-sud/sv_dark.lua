ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('KrXDarkShop:buy')
AddEventHandler('KrXDarkShop:buy', function(price, item, label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= price then
	xPlayer.removeMoney(price)
    	xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Merci de votre ~g~Achats !", "", 1)
     else
          TriggerClientEvent('esx:showNotification', source, "Pas assez ~r~d'argent sur vous")    end
end)



RegisterServerEvent('Announceltdsudo')
AddEventHandler('Announceltdsudo', function()   
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD SUD', '~b~Shop', 'Ltd Sud Ouvert venez chercher de qu\'est ce que vous avez besoin', 'CHAR_AMANDA')
	end
end)


RegisterServerEvent('Announceltdsudofermer')
AddEventHandler('Announceltdsudofermer', function()    
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD SUD', '~b~Shop', 'Ltd Sud fermer', 'CHAR_AMANDA')
	end
end)

