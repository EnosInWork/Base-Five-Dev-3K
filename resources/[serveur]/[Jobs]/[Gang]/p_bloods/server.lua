ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--[[if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'bloods', Config.MaxInService)
end]]

TriggerEvent('esx_society:registerSociety', 'bloods', 'bloods', 'society_bloods', 'society_bloods', 'society_bloods', {type = 'private'})

RegisterServerEvent('bloods:PriseEtFinservice')
AddEventHandler('bloods:PriseEtFinservice', function(PriseOuFin)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'bloods' then
			TriggerClientEvent('bloods:InfoService', xPlayers[i], _raison, name)
		end
	end
end)


RegisterServerEvent('esx_bloodsjob:AddPistol')
AddEventHandler('esx_bloodsjob:AddPistol', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_PISTOL', 999)
end)

RegisterServerEvent('esx_bloodsjob:AddComPistol')
AddEventHandler('esx_bloodsjob:AddComPistol', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_KNIFE', 1)
end)

RegisterServerEvent('esx_bloodsjob:AddPump')
AddEventHandler('esx_bloodsjob:AddPump', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_GOLFCLUB', 1) 
end)



RegisterServerEvent('esx_bloodsjob:giveWeapon')
AddEventHandler('esx_bloodsjob:giveWeapon', function(weapon, ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_bloodsjob:confiscatePlayerItem')
AddEventHandler('esx_bloodsjob:confiscatePlayerItem', function(target, itemType, itemName, amount)
	
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then

		local label = sourceXPlayer.getInventoryItem(itemName).label

		targetXPlayer.removeInventoryItem(itemName, amount)
		sourceXPlayer.addInventoryItem(itemName, amount)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confinv') .. amount .. ' ' .. label .. _U('from') .. targetXPlayer.name)
		TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confinv') .. amount .. ' ' .. label )

	end

	if itemType == 'item_account' then

		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney(itemName, amount)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confdm') .. amount .. _U('from') .. targetXPlayer.name)
		TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confdm') .. amount)

	end

	if itemType == 'item_weapon' then

		targetXPlayer.removeWeapon(itemName)
		sourceXPlayer.addWeapon(itemName, amount)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confweapon') .. ESX.GetWeaponLabel(itemName) .. _U('from') .. targetXPlayer.name)
		TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confweapon') .. ESX.GetWeaponLabel(itemName))

	end

end)

RegisterServerEvent('esx_bloodsjob:handcuff')
AddEventHandler('esx_bloodsjob:handcuff', function(target)
	TriggerClientEvent('esx_bloodsjob:handcuff', target)
end)

RegisterServerEvent('esx_bloodsjob:putInVehicle')
AddEventHandler('esx_bloodsjob:putInVehicle', function(target)
	TriggerClientEvent('esx_bloodsjob:putInVehicle', target)
end)

ESX.RegisterServerCallback('esx_bloodsjob:getOtherPlayerData', function(source, cb, target)

		local xPlayer = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', _source, 'drunk', function(status)

			if status ~= nil then
				data.drunk = status.getPercent()
			end
			
		end)

		TriggerEvent('esx_license:getLicenses', _source, function(licenses)
			data.licenses = licenses
		end)

		cb(data)

end)

ESX.RegisterServerCallback('esx_bloodsjob:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles',
		{},
		function(result)
			
			local foundIdentifier = nil

			for i=1, #result, 1 do
				
				local vehicleData = json.decode(result[i].vehicle)

				if vehicleData.plate == plate then
					foundIdentifier = result[i].owner
					break
				end

			end

			if foundIdentifier ~= nil then

				MySQL.Async.fetchAll(
					'SELECT * FROM users WHERE identifier = @identifier',
					{
						['@identifier'] = foundIdentifier
					},
					function(result)

						local infos = {
							plate = plate,
							owner = result[1].name
						}

						cb(infos)

					end
				)
			
			else

				local infos = {
					plate = plate
				}

				cb(infos)

			end

		end
	)

end)

ESX.RegisterServerCallback('esx_bloodsjob:getArmoryWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_bloods', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)

	end)

end)

ESX.RegisterServerCallback('esx_bloodsjob:addArmoryWeapon', function(source, cb, weaponName)
	
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeWeapon(weaponName)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_bloods', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		 store.set('weapons', weapons)

		 cb()

	end)

end)

ESX.RegisterServerCallback('esx_bloodsjob:removeArmoryWeapon', function(source, cb, weaponName)
	
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addWeapon(weaponName, 1000)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_bloods', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 0
			})
		end

		 store.set('weapons', weapons)

		 cb()

	end)

end)


ESX.RegisterServerCallback('esx_bloodsjob:buy', function(source, cb, amount)
	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_bloods', function(account)

		if account.money >= amount then
			account.removeMoney(amount)
			cb(true)
		else
			cb(false)
		end

	end)

end)

TriggerEvent('esx_phone:registerCallback', function(source, phoneNumber, message, anon)

	local xPlayer  = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()

	if phoneNumber == 'bloods' then
		 for i=1, #xPlayers, 1 do
		 	local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer2.job.name == 'bloods' then
				TriggerEvent('esx_phone:getDistpatchRequestId', function(requestId)
					TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, xPlayer.get('phoneNumber'), message, xPlayer.get('coords'), anon, _('alert_bloods'), requestId)
				end)
			end
		end
	end
	
end)