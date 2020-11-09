local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


ESX					= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	-- Update the door list
	ESX.TriggerServerCallback('esx_doorlock:getDoorInfo', function(doorInfo, count)
		for localID = 1, count, 1 do
			if doorInfo[localID] ~= nil then
				Config.DoorList[doorInfo[localID].doorID].locked = doorInfo[localID].state
			end
		end
	end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())

		for i=1, #Config.DoorList do
			local doorID   = Config.DoorList[i]
			local distance = GetDistanceBetweenCoords(playerCoords, doorID.objCoords.x, doorID.objCoords.y, doorID.objCoords.z, true)
			local isAuthorized = IsAuthorized(doorID)

			local maxDistance = 1.25
			if doorID.distance then
				maxDistance = doorID.distance
			end

			if distance < maxDistance then
				ApplyDoorState(doorID)

				local size = 1
				if doorID.size then
					size = doorID.size
				end

				local displayText = _U('unlocked')
				if doorID.locked then
					displayText = _U('locked')
				end

				if isAuthorized then
					displayText = _U('press_button', displayText)
				end

				--ESX.Game.Utils.DrawText3D(doorID.textCoords, displayText, size)

				DrawText3D(doorID.textCoords, displayText, size)
				
				if IsControlJustReleased(0, Keys['E']) then
					if isAuthorized then
						doorID.locked = not doorID.locked

						TriggerServerEvent('esx_doorlock:updateState', i, doorID.locked) -- Broadcast new state of the door to everyone
					end
				end
			end
		end
	end
end)

function ApplyDoorState(doorID)
	local closeDoor = GetClosestObjectOfType(doorID.objCoords.x, doorID.objCoords.y, doorID.objCoords.z, 1.0, GetHashKey(doorID.objName), false, false, false)
	FreezeEntityPosition(closeDoor, doorID.locked)
end

function IsAuthorized(doorID)
	if ESX.PlayerData.job == nil then
		return false
	end

	for i=1, #doorID.authorizedJobs, 1 do
		if doorID.authorizedJobs[i] == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end

-- Set state for a door
RegisterNetEvent('esx_doorlock:setState')
AddEventHandler('esx_doorlock:setState', function(doorID, state)
	Config.DoorList[doorID].locked = state
end)

function DrawText3D(coords, text, size)
	local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
	local camCoords      = GetGameplayCamCoords()
	local dist           = GetDistanceBetweenCoords(camCoords, coords.x, coords.y, coords.z, true)


	if size == nil then
		size = 1
	end

	local scale = (size / dist) * 2
	local fov   = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov

	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(x,y)
		local factor = (string.len(text)) / 370
		DrawRect(x,y+0.0125, 0.015+ factor, 0.03, 1, 1, 1, 68)
	end
end























  
RegisterNetEvent('esx_doorlock:test')
AddEventHandler('esx_doorlock:test', function(keycards)

	local ped = PlayerPedId()
	local dict = "mp_common_miss"

	if keycards > 0 or ESX.PlayerData.job.name == "police" then

		RequestAnimDict(dict)
		while not HasAnimDictLoaded(dict) do
			Wait(100)
		end
	
		exports['progressBars']:startUI(5000, "Jamming Circuits")
		
		TaskPlayAnim(ped, dict, "hack_loop", 8.0, -8.0, -1, 0, 0, false, false, false)

		Wait(5000)
		ClearPedTasks(ped)
	
		for i=1, #Config.DoorList do
			local doorID   = Config.DoorList[i]
			doorID.locked = not doorID.locked
	
			TriggerServerEvent('esx_doorlock:updateState', i, doorID.locked) -- Broadcast new state of the door to everyone
		end
		TriggerServerEvent('esx_doorlock:davetest69')

	else
		exports['mythic_notify']:SendAlert('error', 'You Dont Have The Required Tools')
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local ped = PlayerPedId()
		local distance = GetDistanceBetweenCoords(playerCoords, Config.PowerDownCoords.x,Config.PowerDownCoords.y,Config.PowerDownCoords.z, true)
		
		if distance <= 2.0 then
			
			DrawText3D(Config.PowerDownCoords, "Press [~r~E~w~] to power down the grid", 2.0)
			
			if IsControlJustReleased(0, Keys['E']) then
				
				TriggerServerEvent('esx_doorlock:davetest')
			end
		end
	end
end)