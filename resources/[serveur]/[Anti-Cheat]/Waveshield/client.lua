Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		if ConfigACC.WeaponProtection then
			local blacklistedWeapons = ConfigACC.BlacklistedWeapons or {}
			local playerPed = GetPlayerPed(-1)

			for blacklistedWeaponName, blacklistedWeaponHash in pairs(blacklistedWeapons) do
				Citizen.Wait(10)

				if (HasPedGotWeapon(playerPed, blacklistedWeaponHash, false)) then
					RemoveAllPedWeapons(playerPed)
					Citizen.Wait(250)
					TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "blacklisted_weapon", blacklistedWeaponHash)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	local ressource = GetNumResources()
	local nBlips = 0

	Citizen.Wait(5000)

	while true do
		Citizen.Wait(2500)

		if ConfigACC.GlobalCheat then
			SetPedInfiniteAmmoClip(PlayerPedId(), false)
			SetPlayerInvincible(PlayerId(), false)
			SetEntityInvincible(PlayerPedId(), false)
			SetEntityCanBeDamaged(PlayerPedId(), true)
			ResetEntityAlpha(PlayerPedId())
			SetPlayerWeaponDamageModifier(PlayerId(), 1)
			SetPlayerMeleeWeaponDamageModifier(PlayerId(), 1)
		end

		if ConfigACC.ExplosionProtection then
			SetEntityProofs(GetPlayerPed(-1), false, true, true, false, false, false, false, false)
		end

		if ConfigACC.AntiBlips then
			nBlips = GetNumberOfActiveBlips()

			if nBlips == #GetActivePlayers() then
				TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "antiblip", "^^")
			end
		end

		if ConfigACC.AntiSpectate then
			if NetworkIsInSpectatorMode() then
				--if group == 'user' then
					TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "spec", "^^")
				--end
			end
		end

		if ConfigACC.ResourceCount then
			if ressource ~= GetNumResources() then
				TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "resourcecounter", "^^")
			end
		end

		if ConfigACC.AntiInjection then
			for k, v in ipairs(GetRegisteredCommands()) do
				for k2, v2 in ipairs(ConfigACC.BlacklistedCommands) do
					if v.name == v2 then
						TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "injection", v.name)
					end
				end
			end

			getcomands = #GetRegisteredCommands()

			if nbcmds ~= nil then
				if getcomands ~= nbcmds then
					TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "injection", "je sais pas")
				end
			end
		end
	end
end)

if ConfigACC.AntiESX then
	AddEventHandler("esx:getSharedObject", function(cb)
		TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "esx", "^^")
	end)
end

local firstSpawnAC = true

AddEventHandler("playerSpawned", function()
	nbcmds = #GetRegisteredCommands()
	nbres = GetNumResources()

	if firstSpawnAC then
		firstSpawnAC = false

		--[[
		if ConfigACCAC == nil then
			TriggerServerEvent('AC:Sanction', "BAN", "Blocker Lua", "MOD", GetCurrentResourceName(), "Blocker")
		end

		if ConfigACCCheckerAC == nil then
			TriggerServerEvent('AC:Sanction', "BAN", "Blocker Lua", "MOD", GetCurrentResourceName(), "Blocker")
		end
		]]
	end
end)

if ConfigACC.AntiResourceStart then
	AddEventHandler("onClientResourceStart", function(resourceName)
		if not firstSpawnAC then
			TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "resourcestart", resourceName)
		end
	end)
end

if ConfigACC.AntiResourceStop then
	AddEventHandler("onClientResourceStop", function(resourceName)
		if not firstSpawnAC then
			TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "resourcestop", resourceName)
		end
	end)
end

if ConfigACC.AntiResourceRestart then
	AddEventHandler("onClientResourceStart", function(resourceName)
		local lenn = string.len(resourceName)
		local subb = string.sub(resourceName, 1, 1)

		if lenn >= 18 and subb == "_" then
			TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "resourcestart", resourceName)
		end
	end)
end

if ConfigACC.TriggersProtection then
	for k, event in pairs(ConfigACC.BlacklistedEvents) do
		RegisterNetEvent(event)
		AddEventHandler(event, function()
			CancelEvent()
			TriggerServerEvent("ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf", "event", event)
		end)
	end
end