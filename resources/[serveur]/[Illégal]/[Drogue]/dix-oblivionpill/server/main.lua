ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('piluleoubli', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('dix-oblivionpill:piluleoubli', source)
	xPlayer.removeInventoryItem('piluleoubli', 1)
	TriggerClientEvent('esx:showNotification', source, _U('oblivionpill_used'))
	Citizen.Wait(180000)
	TriggerClientEvent('dix-oblivionpill:stoppill', source)
end)
