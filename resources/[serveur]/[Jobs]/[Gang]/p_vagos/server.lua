ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--[[if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'vagos', Config.MaxInService)
end]]

TriggerEvent('esx_society:registerSociety', 'vagos', 'vagos', 'society_vagos', 'society_vagos', 'society_vagos', {type = 'private'})


RegisterServerEvent('vagos:PriseEtFinservice')
AddEventHandler('vagos:PriseEtFinservice', function(PriseOuFin)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'vagos' then
			TriggerClientEvent('vagos:InfoService', xPlayers[i], _raison, name)
		end
	end
end)


RegisterServerEvent('esx_vagosjob:AddTazer')
AddEventHandler('esx_vagosjob:AddTazer', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_STUNGUN', 999)
end)

RegisterServerEvent('esx_vagosjob:AddPistol')
AddEventHandler('esx_vagosjob:AddPistol', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_PISTOL', 999)
end)

RegisterServerEvent('esx_vagosjob:AddComPistol')
AddEventHandler('esx_vagosjob:AddComPistol', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_KNIFE', 1)
end)

RegisterServerEvent('esx_vagosjob:AddSmg')
AddEventHandler('esx_vagosjob:AddSmg', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_ASSAULTSMG', 999)
end)

RegisterServerEvent('esx_vagosjob:AddRifle')
AddEventHandler('esx_vagosjob:AddRifle', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_CARBINERIFLE', 999)
end)

RegisterServerEvent('esx_vagosjob:AddSniperRifle')
AddEventHandler('esx_vagosjob:AddSniperRifle', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_SNIPERRIFLE', 999)
end)

RegisterServerEvent('esx_vagosjob:AddPump')
AddEventHandler('esx_vagosjob:AddPump', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_GOLFCLUB', 1) 
end)



RegisterServerEvent('esx_vagosjob:giveWeapon')
AddEventHandler('esx_vagosjob:giveWeapon', function(weapon, ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_vagosjob:confiscatePlayerItem')
AddEventHandler('esx_vagosjob:confiscatePlayerItem', function(target, itemType, itemName, amount)
	
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

RegisterServerEvent('esx_vagosjob:handcuff')
AddEventHandler('esx_vagosjob:handcuff', function(target)
	TriggerClientEvent('esx_vagosjob:handcuff', target)
end)

RegisterServerEvent('esx_vagosjob:putInVehicle')
AddEventHandler('esx_vagosjob:putInVehicle', function(target)
	TriggerClientEvent('esx_vagosjob:putInVehicle', target)
end)

ESX.RegisterServerCallback('esx_vagosjob:getOtherPlayerData', function(source, cb, target)

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

ESX.RegisterServerCallback('esx_vagosjob:getFineList', function(source, cb, category)

	MySQL.Async.fetchAll(
		'SELECT * FROM fine_types WHERE category = @category',
		{
			['@category'] = category
		},
		function(fines)
			cb(fines)
		end
	)

end)

ESX.RegisterServerCallback('esx_vagosjob:getVehicleInfos', function(source, cb, plate)

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

ESX.RegisterServerCallback('esx_vagosjob:getArmoryWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_vagos', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)

	end)

end)

ESX.RegisterServerCallback('esx_vagosjob:addArmoryWeapon', function(source, cb, weaponName)
	
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeWeapon(weaponName)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_vagos', function(store)

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

ESX.RegisterServerCallback('esx_vagosjob:removeArmoryWeapon', function(source, cb, weaponName)
	
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addWeapon(weaponName, 1000)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_vagos', function(store)

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


ESX.RegisterServerCallback('esx_vagosjob:buy', function(source, cb, amount)
	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vagos', function(account)

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

	if phoneNumber == 'vagos' then
		 for i=1, #xPlayers, 1 do
		 	local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer2.job.name == 'vagos' then
				TriggerEvent('esx_phone:getDistpatchRequestId', function(requestId)
					TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, xPlayer.get('phoneNumber'), message, xPlayer.get('coords'), anon, _('alert_vagos'), requestId)
				end)
			end
		end
	end
	
end)