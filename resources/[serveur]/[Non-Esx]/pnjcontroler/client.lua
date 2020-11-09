local iPlayerID = GetPlayerServerId()

Citizen.CreateThread(function()
	DisablePlayerVehicleRewards(iPlayerID)
	while true do
    Citizen.Wait(5)
        
		SetPedDensityMultiplierThisFrame(0.1)
		SetRandomVehicleDensityMultiplierThisFrame(0.1)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
		SetGarbageTrucks(false)
		SetRandomBoats(false)
		SetCreateRandomCops(false)
		SetCreateRandomCopsNotOnScenarios(false)
		SetCreateRandomCopsOnScenarios(false)
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);

        if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then

            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),false),-1) == GetPlayerPed(-1) then
                SetVehicleDensityMultiplierThisFrame(0.1)
                SetParkedVehicleDensityMultiplierThisFrame(0.0)
            else
                SetVehicleDensityMultiplierThisFrame(0.0)
                SetParkedVehicleDensityMultiplierThisFrame(0.1)
            end
        else
          SetParkedVehicleDensityMultiplierThisFrame(0.0)
          SetVehicleDensityMultiplierThisFrame(0.1)
        end
	end
end)

--Désactive le Dispatch
Citizen.CreateThread(function()
	for i = 1, 15 do
		Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
	end
end)

--Désactive le Player Wanted
Citizen.CreateThread(function()
	for _, player in ipairs(GetActivePlayers()) do
		Citizen.InvokeNative(0xDC0F817884CDD856, player, false)
	end
	while true do
		Citizen.Wait(0)
		if GetPlayerWantedLevel(PlayerId()) ~= 0 then
			ClearPlayerWantedLevel(PlayerId())
		end
    end
end)

--ANTICARKILL
--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        for _,player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(-1)
            local everyone = GetPlayerPed(player)
            local everyoneveh = GetVehiclePedIsUsing(everyone)
            if IsPedInAnyVehicle(everyone, false) then
                SetEntityNoCollisionEntity(ped, everyoneveh, false)
                SetEntityNoCollisionEntity(everyoneveh, ped, false)
            else
                SetEntityNoCollisionEntity(ped, everyone, false)
            end
        end
    end
end)
--]]
---------------------------------
--------- ikNox#6088 ------------
---------------------------------