ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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