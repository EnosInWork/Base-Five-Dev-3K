local IsDead = false
local IsAnimated = false
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    PlayerData = ESX.GetPlayerData()
end)

function Drunk(level, start)
  Citizen.CreateThread(function()
    local playerPed = GetPlayerPed(-1)

    if start then
      DoScreenFadeOut(800)
      Citizen.Wait(15)
    end

    if level == 0 then
      RequestAnimSet("move_m@drunk@slightlydrunk")
      while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Citizen.Wait(1)
      end
      SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
    elseif level == 1 then
      RequestAnimSet("move_m@drunk@moderatedrunk")
      while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
        Citizen.Wait(1)
      end
      SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
    elseif level == 2 then
      RequestAnimSet("move_m@drunk@verydrunk")
      while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
        Citizen.Wait(1)
      end
      SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)
    end

    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedIsDrunk(playerPed, true)

    if start then
      DoScreenFadeIn(800)
    end

  end)
end

function Reality()
  Citizen.CreateThread(function()
		local playerPed = GetPlayerPed(-1)
		
    DoScreenFadeOut(800)
    Citizen.Wait(15)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
    DoScreenFadeIn(800)
  end)
end

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('playerSpawned', function()

	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)


AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#5d9e55', function(status)
		return true
	end, function(status)
		status.remove(75)
	end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#4f88ad', function(status)
		return true
	end, function(status)
		status.remove(75)
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1000)

			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						ESX.ShowNotification("~r~Vous avez mal au ventre.")
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						ESX.ShowNotification("~r~Vous avez mal au ventre.")
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			if health ~= prevHealth then
				SetEntityHealth(playerPed, health)
			end
		end
	end)
end)

--[[ Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)

		if IsEntityDead(playerPed) and not IsDead then
				IsDead = true
			end
		end
	end)
end) ]]

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
  if not IsAnimated then
		local prop_name = prop_name or 'prop_sandwich_01'
    IsAnimated = true
	  local playerPed = GetPlayerPed(-1)
	  Citizen.CreateThread(function()
	   	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	   	prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
	   	AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
	   	RequestAnimDict('mp_player_inteat@pnq')
	   	while not HasAnimDictLoaded('mp_player_inteat@pnq') do
	   		Citizen.Wait(1)
	   	end
	   	TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
	   	Wait(4000)
	   	IsAnimated = false
	   	ClearPedSecondaryTask(playerPed)
	   	DeleteObject(prop)
	  end)
	end
end)

RegisterNetEvent('esx_basicneeds:onEatHamburger')
AddEventHandler('esx_basicneeds:onEatHamburger', function(prop_name)
  if not IsAnimated then
		local prop_name = prop_name or 'prop_cs_burger_01'
    IsAnimated = true
	  local playerPed = GetPlayerPed(-1)
	  Citizen.CreateThread(function()
	   	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	   	prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
	   	AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
	   	RequestAnimDict('mp_player_inteat@pnq')
	   	while not HasAnimDictLoaded('mp_player_inteat@pnq') do
	   		Citizen.Wait(1)
	   	end
	   	TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 3.5, -8, -1, 49, 0, 0, 0, 0)
	   	Wait(4000)
	   	IsAnimated = false
	   	ClearPedSecondaryTask(playerPed)
	   	DeleteObject(prop)
	  end)
	end
end)

RegisterNetEvent('esx_basicneeds:onEatHotDog')
AddEventHandler('esx_basicneeds:onEatHotDog', function(prop_name)
  if not IsAnimated then
		--local prop_name = prop_name or 'prop_cs_hotdog_01'
    IsAnimated = true
	  local playerPed = GetPlayerPed(-1)
	  Citizen.CreateThread(function()
	   	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	   	--prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
	   	--AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
	   	RequestAnimDict('mp_player_inteat@pnq')
	   	while not HasAnimDictLoaded('mp_player_inteat@pnq') do
	   		Citizen.Wait(1)
	   	end
	   	TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 3.5, -8, -1, 49, 0, 0, 0, 0)
	   	Wait(4000)
	   	IsAnimated = false
	   	ClearPedSecondaryTask(playerPed)
	   	--DeleteObject(prop)
	  end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.05, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkCoca')
AddEventHandler('esx_basicneeds:onDrinkCoca', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_ecola_can'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.05, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkPepsi')
AddEventHandler('esx_basicneeds:onDrinkPepsi', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_ecola_can'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.05, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkSprunk')
AddEventHandler('esx_basicneeds:onDrinkSprunk', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_ld_can_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.05, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkCocktail')
AddEventHandler('esx_basicneeds:onDrinkCocktail', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_cocktail'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, -0.06, -0.05, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkSoda')
AddEventHandler('esx_basicneeds:onDrinkSoda', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_orang_can_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.05, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkWhisky')
AddEventHandler('esx_basicneeds:onDrinkWhisky', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_drink_whisky'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.15, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:BoireVin')
AddEventHandler('esx_basicneeds:BoireVin', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_sh_wine_glass'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.15, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkTequila')
AddEventHandler('esx_basicneeds:onDrinkTequila', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_cs_shot_glass'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.15, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkMojito')
AddEventHandler('esx_basicneeds:onDrinkMojito', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_cocktail'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.15, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkRhum')
AddEventHandler('esx_basicneeds:onDrinkRhum', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_drink_whisky'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.15, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkVodka')
AddEventHandler('esx_basicneeds:onDrinkVodka', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_shots_glass_cs'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.15, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:BoireBiere')
AddEventHandler('esx_basicneeds:BoireBiere', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_amb_beer_bottle'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.15, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:BoireJusRaisin')
AddEventHandler('esx_basicneeds:BoireJusRaisin', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    --AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.15, -85.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@pnq')
			while not HasAnimDictLoaded('mp_player_inteat@pnq') do
				Citizen.Wait(1)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(4000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onSmoke')
AddEventHandler('esx_basicneeds:onSmoke', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'ng_proc_cigarette01a'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    	--AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 58868), 0.01, 0.025, 0.019, 10.0, 190.0, 50.0, true, true, false, true, 1, true)
			RequestAnimDict('amb@world_human_aa_smoke@male@idle_a')
			while not HasAnimDictLoaded('amb@world_human_aa_smoke@male@idle_a') do
				Wait(1)
			end
			TaskPlayAnim(playerPed, 'amb@world_human_aa_smoke@male@idle_a', 'idle_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(40000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onSmokeCigar')
AddEventHandler('esx_basicneeds:onSmokeCigar', function(prop_name)
	if not IsAnimated then
		--local prop_name = prop_name or 'prop_cigar_03'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			--prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)
	    	--AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 58868), 0.01, -0.075, 0.019, 10.0, 190.0, 103.75, true, true, false, true, 1, true)
			RequestAnimDict('amb@code_human_wander_smoking@male@idle_a')
			while not HasAnimDictLoaded('amb@code_human_wander_smoking@male@idle_a') do
				Wait(1)
			end
			TaskPlayAnim(playerPed, 'amb@code_human_wander_smoking@male@idle_a', 'idle_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Wait(60000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			--DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onBacterium1')
AddEventHandler('esx_basicneeds:onBacterium1', function()
	local playerPed = GetPlayerPed(-1)
	local health = GetEntityHealth(playerPed) - 25
	SetEntityHealth(playerPed,  health)
end)

RegisterNetEvent('esx_basicneeds:onBacterium2')
AddEventHandler('esx_basicneeds:onBacterium2', function()
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(GetPlayerPed(-1), true)
	DoScreenFadeIn(1000)
	Citizen.Wait(300000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetPedIsDrunk(GetPlayerPed(-1), false)
	SetPedMotionBlur(GetPlayerPed(-1), false)
end)

RegisterNetEvent('esx_basicneeds:offBacterium')
AddEventHandler('esx_basicneeds:offBacterium', function()
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetPedIsDrunk(GetPlayerPed(-1), false)
	SetPedMotionBlur(GetPlayerPed(-1), false)
end)

RegisterNetEvent('esx_basicneeds:onPot')
AddEventHandler('esx_basicneeds:onPot', function()
	RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
		Citizen.Wait(1)
	end
	TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
	Citizen.Wait(5000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(GetPlayerPed(-1), true)
	DoScreenFadeIn(1000)
	Citizen.Wait(600000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetPedIsDrunk(GetPlayerPed(-1), false)
	SetPedMotionBlur(GetPlayerPed(-1), false)
end)

RegisterNetEvent('esx_basicneeds:onEatCoke')
AddEventHandler('esx_basicneeds:onEatCoke', function()
	local time = 5 * 60

	Citizen.CreateThread( function()

		while true do
		  Citizen.Wait(1000)
		  if(time > 0) then

		  	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@BRAVE@A", true)
		    ResetPlayerStamina(PlayerId())
			SetPedAccuracy(GetPlayerPed(-1), 100)
			SetPedArmour(GetPlayerPed(-1), 25)
			SetPedCombatAttributes(GetPlayerPed(-1), 52, true)
			SetPedCombatAbility(GetPlayerPed(-1), 2)
		    SetPlayerHealthRechargeMultiplier(GetPlayerPed(-1), 2.5)

		    time =  time - 1
		  end
		end
	end)
end)

RegisterNetEvent('esx_basicneeds:onEatAcid')
AddEventHandler('esx_basicneeds:onEatAcid', function()
	exports["acidtrip"]:DoAcid(60000)

	Citizen.CreateThread( function()
		local time = 5 * 60
		while true do
		  Citizen.Wait(1000)
		  if(time > 0) then
		  	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@BRAVE@A", true)
		    ResetPlayerStamina(PlayerId())
			SetPedAccuracy(GetPlayerPed(-1), 100)
			SetPedArmour(GetPlayerPed(-1), 25)
			SetPedCombatAttributes(GetPlayerPed(-1), 52, true)
			SetPedCombatAbility(GetPlayerPed(-1), 2)
		    SetPlayerHealthRechargeMultiplier(GetPlayerPed(-1), 2.5)

		    time =  time - 1
		  end
		end
	end)
end)

RegisterNetEvent('esx_basicneeds:onEatGhb')
AddEventHandler('esx_basicneeds:onEatGhb', function()
	RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
		Citizen.Wait(1)
	end
	exports["acidtrip"]:DoAcid(120000)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(GetPlayerPed(-1), true)
	DoScreenFadeIn(1000)
	Citizen.Wait(120000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetPedIsDrunk(GetPlayerPed(-1), false)
	SetPedMotionBlur(GetPlayerPed(-1), false)
end)

RegisterNetEvent('esx_basicneeds:traceur')
AddEventHandler('esx_basicneeds:traceur', function()
	local playerPed = GetPlayerPed(-1)
	local coords = GetEntityCoords(GetPlayerPed(-1))
	local veh, distance = ESX.Game.GetClosestVehicle({x = coords.x, y = coords.y, z = coords.z})

	if distance < 2 then
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(GetPlayerPed(-1), "world_human_vehicle_mechanic", 0, false)
			Wait(10000)
			ClearPedTasksImmediately(playerPed)
		end)

		Wait(10000)
		local vehicle, distance = ESX.Game.GetClosestVehicle({x = coords.x, y = coords.y, z = coords.z})

		if veh == vehicle and distance < 2 then
			vehBlip = AddBlipForEntity(veh)
			SetBlipColour(vehBlip, 1)
			timer = math.random(60, 220)
			ontrace = true
			TriggerEvent('esx:showNotification', 'Vous venez de poser un ~y~traceur~s~.' )
		else
			TriggerEvent('esx:showNotification', 'Il semblerais que la voiture soit partie' )
		end
	else
		TriggerEvent('esx:showNotification', 'Vous êtes trop loin du vehicule.')
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if ontrace then
			Citizen.Wait(1000)

			if(timer > 0)then
				if (timer == 30 ) then
					TriggerEvent('esx:showNotification', 'Votre ~y~traceur~s~ semble devenir defectueux.')
				end
				timer = timer - 1
			else
				TriggerEvent('esx:showNotification', 'Votre ~y~traceur~s~ ne donne plus aucun signal .')
				RemoveBlip(vehBlip)
			end
		end
	end
end)

RegisterNetEvent('esx_basicneeds:onEatSteroids')
AddEventHandler('esx_basicneeds:onEatSteroids', function()
	local time = 5 * 60
	Citizen.CreateThread( function()
		while true do
		  Citizen.Wait(1000)
		  if(time > 0) then
		    ResetPlayerStamina(PlayerId())
		    time =  time - 1
		  end
		end
	end)
end)

RegisterNetEvent('esx_basicneeds:onMoussaStuff')
AddEventHandler('esx_basicneeds:onMoussaStuff', function(itemname)
	local pid = PlayerPedId()
	local i = 0

	if itemname == 'hair_oil' then
		local notifs = {
		'L\'~y~huile~s~ fait effet ...',
		'Vos cheveux sont toujours un peu ~y~gras~s~.',
		'Je vous promet que l\'~y~huile~s~ fait toujours effet ...',
		'Au moins l\'~y~huile~s~ sent bon ...',
		'Ça sent tout de même un peu fort votre ~y~huile~s~.' }

		Citizen.CreateThread(function()
			while (i < 5) do
				Citizen.Wait(math.random(30000,60000))
				TriggerEvent('esx:showNotification', notifs[math.random(#notifs)])
				i = i + 1
			end
			Citizen.Wait(math.random(30000,60000))
			TriggerEvent('esx:showNotification', 'L\'~y~huile~s~ a bien pénétré. Vos cheveux vont être si soyeux.')
		end)
	elseif itemname == 'champagne' then
		local notifs = {
			'Le ~b~champagne~s~ fait effet ...',
			'Le ~b~champagne~s~ fait effet ...', --increase random
			'Des ~b~bulles~s~, des ~b~bulles~s~, encore des ~b~bulles~s~...',
			'Vous vous sentez légèrement ... ~b~euphorique~s~.',
			'Le ~b~champagne~s~ vous va si bien ... une nouvelle coupe ?',
			'Vous avez des ~b~bulles~s~ plein la tête.',
			'Le ~b~champagne~s~ est excellent. Dites merci à Moussa.'
		}

		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_DRINKING", 0, true)
			Citizen.Wait(5000)
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)
			ClearPedTasks(GetPlayerPed(-1))
			SetTimecycleModifier("spectator5")
			SetPedMotionBlur(GetPlayerPed(-1), true)
			SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@MODERATEDRUNK", -1)
			SetPedIsDrunk(GetPlayerPed(-1), true)
			DoScreenFadeIn(1000)
			SetPedConfigFlag(GetPlayerPed(-1), 100, true)
			ShakeGameplayCam("DRUNK_SHAKE", true)

			while (i < 6) do
				Citizen.Wait(math.random(30000,90000))
				TriggerEvent('esx:showNotification', notifs[math.random(#notifs)])
				i = i + 1
			end

			Citizen.Wait(math.random(30000,90000))
			ShakeGameplayCam("STOP_CAM_SHAKING", true)
			SetPedConfigFlag(GetPlayerPed(-1), 100, false)
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)
			DoScreenFadeIn(1000)
			ClearTimecycleModifier()
			ResetScenarioTypesEnabled()
			SetPedIsDrunk(GetPlayerPed(-1), false)
			ResetPedMovementClipset(GetPlayerPed(-1), 0)
			SetPedMotionBlur(GetPlayerPed(-1), false)
			TriggerEvent('esx:showNotification', 'L\'effet du ~y~champagne~s~ commence à s\'estomper. Attention à la migraine.')
		end)
	elseif itemname == 'moussa_card' then
		TriggerEvent('esx:showNotification', 'Numéro de ~p~Moussa~s~ : 87302')
	elseif itemname == 'dark_case' then

		local notifs = {
			'L\'épicier critique le téqui la la' ,
			'Des choses paranormal ont eu lieu chez les mécanos',
			'Un pêcheur s\'est fait bouffer les couilles par un poisson',
			'Un patron fricotte énormément avec des putes!',
			'Quelle est la femelle du hamster ? ...... L\'Amsterdam!',
			'C\'est l\'histoire d\'un poil avant il etait bien maintenant il est pubien',
			'C\'est Paf le chien qui traverse la route et paf le chien!',
			'C\'est l\'histoire vrai d\'un zoophile qui rentre dans un bar',
			'Quelle mamie fait peur aux voleurs ? ....... Mamie Traillette'
		}

		Citizen.CreateThread(function()

			while (i < 9) do
				Citizen.Wait(math.random(30000,60000))
				TriggerEvent('esx:showNotification', notifs[math.random(#notifs)])
				i = i + 1
			end

			Citizen.Wait(math.random(30000,60000))
			TriggerEvent('esx:showNotification', 'L\'~y~huile~s~ a bien pénétré. Vos cheveux vont être si soyeux.')
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onCape')
AddEventHandler('esx_basicneeds:onCape', function(duration)

  local pid = PlayerPedId()
	onCape()
end)

RegisterNetEvent('esx_basicneeds:leurre')
AddEventHandler('esx_basicneeds:leurre', function(duration)

  local pid = PlayerPedId()
  TriggerServerEvent("EffectForAll1", PlayerId())
  onLeurre()
end)

RegisterNetEvent('esx_basicneeds:vision')
AddEventHandler('esx_basicneeds:vision', function(duration)

	local model = GetHashKey("a_c_pigeon")
	local playerPed = GetPlayerPed(-1)
	local ped = ClonePed(playerPed, GetEntityHeading(playerPed), 1, 1)
	local LastPosition = GetEntityCoords(GetPlayerPed(-1))
	ESX.ShowNotification(("La maitrise de cet objet est très difficile, si l'oiseau meurt, vous tomberez dans le coma."))

	RequestModel(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		Citizen.Wait(1)
	end

	SetPlayerModel(PlayerId(), model)
	SetModelAsNoLongerNeeded(model)

	SetTimeout(50000, function()

		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			local model2 = nil

			if skin.sex == 0 then
				model2 = GetHashKey("mp_m_freemode_01")
			else
				model2 = GetHashKey("mp_f_freemode_01")
			end

			RequestModel(model2)
			while not HasModelLoaded(model2) do
				RequestModel(model2)
				Citizen.Wait(1)
			end

			SetPlayerModel(PlayerId(), model2)
			SetModelAsNoLongerNeeded(model2)
			DeleteEntity(ped)
			SetEntityCoords(playerPed, LastPosition.x, LastPosition.y, LastPosition.z)
			TriggerEvent('skinchanger:loadSkin', skin)
			TriggerEvent('esx:restoreLoadout')
		end)
	end)
end)

function onCape()
	local ped = GetPlayerPed(-1)

	SetEntityVisible(ped, false, false)
	ESX.ShowNotification(("Faites attention votre cape a l\'air plûtot fragile."))

	SetTimeout(math.random(45000, 120000), function()

		SetEntityVisible(ped, true, false)
		ESX.ShowNotification(('Votre cape d\'invisibilité ne semble plus faire effet.'))
	end)
end

function onLeurre()
	local ped = GetPlayerPed(-1)
	SetEntityVisible(ped, false, false)

	SetTimeout(2000, function()
		SetEntityVisible(ped, true, false)
	end)
end

AddEventHandler("Effect1", function(EffectPlayer) --Start The Teleport Effect For Everyone Around The Player
  local Entity
  local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
  local EffectPlayerPedPos = GetEntityCoords(GetPlayerPed(EffectPlayer), true)
  local playerDist = Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, EffectPlayerPedPos.x, EffectPlayerPedPos.y, EffectPlayerPedPos.z)

  if playerDist < 50 then
    if IsPedInAnyVehicle(GetPlayerPed(EffectPlayer), 0) then
      Entity = GetVehiclePedIsIn(GetPlayerPed(EffectPlayer), 0)
      scale = 15.0
    else
      Entity = GetPlayerPed(EffectPlayer)
      scale = 4.0
    end

    if not HasNamedPtfxAssetLoaded("core") then
      RequestNamedPtfxAsset("core")
      while not HasNamedPtfxAssetLoaded("core") do
        Citizen.Wait(1)
      end
      if HasNamedPtfxAssetLoaded("core") then
      end
    end

    SetPtfxAssetNextCall("core")
    StartParticleFxLoopedAtCoord("exp_air_molotov", EffectPlayerPedPos.x, EffectPlayerPedPos.y, EffectPlayerPedPos.z, 0.0, 0.0, 0.0, scale, false, false, false, false)
    RemoveNamedPtfxAsset("core")
  end
end)

RegisterNetEvent("Effect1")
