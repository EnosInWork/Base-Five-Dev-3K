ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- if Config.EnableESXService then
-- 	TriggerEvent('esx_service:activateService', 'armurier', Config.MaxInService)
-- end


TriggerEvent('esx_society:registerSociety', 'armurier', 'armurier', 'society_armurier', 'society_armurier', 'society_armurier', {type = 'private'})



AddEventHandler('chatMessage', function(source, n, msg)
	local msg = string.lower(msg)
	if msg == "/repair" then 
		TriggerClientEvent('RepairVehicle', source) 
	end
end)



RegisterServerEvent('esx_armurier:getStockItem')
AddEventHandler('esx_armurier:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_armurier', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end
	end)
end)

RegisterServerEvent('esx_armurier:putStockItems')
AddEventHandler('esx_armurier:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_armurier', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_armurier:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_armurier', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_armurier:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)


RegisterNetEvent('BuyDoubleaction')
AddEventHandler('BuyDoubleaction', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 9000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_doubleaction")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x 357 Double Action ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyClip')
AddEventHandler('BuyClip', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 500
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('clip', 1)
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Chargeur ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyMm')
AddEventHandler('BuyMm', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 10000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_heavypistol")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x 9MM ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyPcombat')
AddEventHandler('BuyPcombat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 11000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_combatpistol")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Pistolet de Combat ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyPauto')
AddEventHandler('BuyPauto', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_appistol")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Pistolet Automatique ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyMicrosmg')
AddEventHandler('BuyMicrosmg', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 20000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_microsmg")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Micro-SMG ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyMinismg')
AddEventHandler('BuyMinismg', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 23000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_minismg")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Mini-SMG ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuySmg')
AddEventHandler('BuySmg', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 25000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_smg")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x SMG ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyMiniak')
AddEventHandler('BuyMiniak', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 40000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_compactrifle")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Mini-AK ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyM4')
AddEventHandler('BuyM4', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 50000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_carbinerifle")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x M4 ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyAK47')
AddEventHandler('BuyAK47', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 50000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_assaultrifle")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x AK-47 ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyGunsenberg')
AddEventHandler('BuyGunsenberg', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 51000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_gusenberg")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Gusenberg ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyPompe')
AddEventHandler('BuyPompe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 60000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_pumpshotgun")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Fusil à pompe ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyPompec')
AddEventHandler('BuyPompec', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 64000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_sawnoffshotgun")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Fusil à canon cié ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuyPompedc')
AddEventHandler('BuyPompedc', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 67000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_dbshotgun")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Pompe Double action ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('BuySniper')
AddEventHandler('BuySniper', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 100000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
	xPlayer.addWeapon("weapon_sniperrifle")
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Sniper ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)


