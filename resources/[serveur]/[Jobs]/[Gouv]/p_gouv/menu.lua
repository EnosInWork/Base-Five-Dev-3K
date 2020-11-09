local PlayerData, CurrentActionData, HandcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
ESX = nil

---------------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

function OpenIdentityCardMenu(player)
	ESX.TriggerServerCallback('esx_gouvjob:getOtherPlayerData', function(data)
		local elements = {}
		local nameLabel = _U('name', data.name)
		local jobLabel, sexLabel, dobLabel, heightLabel, idLabel

		if data.job.grade_label and  data.job.grade_label ~= '' then
			jobLabel = _U('job', data.job.label .. ' - ' .. data.job.grade_label)
		else
			jobLabel = _U('job', data.job.label)
		end

		if Config.EnableESXIdentity then
			nameLabel = _U('name', data.firstname .. ' ' .. data.lastname)

			if data.sex then
				if string.lower(data.sex) == 'm' then
					sexLabel = _U('sex', _U('male'))
				else
					sexLabel = _U('sex', _U('female'))
				end
			else
				sexLabel = _U('sex', _U('unknown'))
			end

			if data.dob then
				dobLabel = _U('dob', data.dob)
			else
				dobLabel = _U('dob', _U('unknown'))
			end

			if data.height then
				heightLabel = _U('height', data.height)
			else
				heightLabel = _U('height', _U('unknown'))
			end

			if data.name then
				idLabel = _U('id', data.name)
			else
				idLabel = _U('id', _U('unknown'))
			end
		end

		local elements = {
			{label = nameLabel},
			{label = jobLabel}
		}

		if Config.EnableESXIdentity then
			table.insert(elements, {label = sexLabel})
			table.insert(elements, {label = dobLabel})
			table.insert(elements, {label = heightLabel})
			table.insert(elements, {label = idLabel})
		end

		if data.drunk then
			table.insert(elements, {label = _U('bac', data.drunk)})
		end

		if data.licenses then
			table.insert(elements, {label = _U('license_label')})

			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
			css      = 'gouv',
			title    = _U('citizen_interaction'),
			align    = 'top-left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

----------------------------------------------------------------------------------------------------------------------

function OpenBodySearchMenu(player)

	ESX.TriggerServerCallback('esx_gouvjob:getOtherPlayerData', function(data)

		local elements = {}
		
		local blackMoney = 0

		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' then
				blackMoney = data.accounts[i].money
			end
		end

		table.insert(elements, {
			label          = _U('confiscate_dirty') .. blackMoney,
			value          = 'black_money',
			itemType       = 'item_account',
			amount         = blackMoney
		})

		table.insert(elements, {label = '--- Armes ---', value = nil})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label          = _U('confiscate') .. ESX.GetWeaponLabel(data.weapons[i].name),
				value          = data.weapons[i].name,
				itemType       = 'item_weapon',
				amount         = data.ammo,
			})
		end

		table.insert(elements, {label = _U('inventory_label'), value = nil})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label          = _U('confiscate_inv') .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
					value          = data.inventory[i].name,
					itemType       = 'item_standard',
					amount         = data.inventory[i].count,
				})
			end
		end
		
		
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'body_search',
			{
				title    = _U('search'),
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)

				local itemType = data.current.itemType
				local itemName = data.current.value
				local amount   = data.current.amount

				if data.current.value ~= nil then

					TriggerServerEvent('esx_gouvjob:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)

					OpenBodySearchMenu(player)

				end

			end,
			function(data, menu)
				menu.close()
			end
		)

	end, GetPlayerServerId(player))

end

-----------------------------------------------------------------------------------------------------------------------------------------------------

function OpenFineMenu(player)

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'fine',
		{
			title    = _U('fine'),
			align    = 'top-left',
			elements = {
		  	{label = _U('traffic_offense'),   value = 0},
		  	{label = _U('minor_offense'),     value = 1},
		  	{label = _U('average_offense'),   value = 2},
		  	{label = _U('major_offense'),     value = 3}
			},
		},
		function(data, menu)
			
			OpenFineCategoryMenu(player, data.current.value)

		end,
		function(data, menu)
			menu.close()
		end
	)

end

function OpenFineCategoryMenu(player, category)

	ESX.TriggerServerCallback('esx_gouvjob:getFineList', function(fines)

		local elements = {}
		
		for i=1, #fines, 1 do
			table.insert(elements, {
				label     = fines[i].label .. ' $' .. fines[i].amount,
				value     = fines[i].id,
				amount    = fines[i].amount,
				fineLabel = fines[i].label
			})
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'fine_category',
			{
				title    = _U('fine'),
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)

				local label  = data.current.fineLabel
				local amount = data.current.amount

				menu.close()

				if Config.EnablePlayerManagement then
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_gouv', _U('fine_total') .. label, amount)
				else
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total') .. label, amount)
				end

				ESX.SetTimeout(300, function()
					OpenFineCategoryMenu(player, category)
				end)

			end,
			function(data, menu)
				menu.close()
			end
		)

	end, category)

end

----------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer 
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)

	local specialContact = {
		name       = 'gouv',
		number     = 'gouv',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)

end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('esx_gouvjob:handcuff')
AddEventHandler('esx_gouvjob:handcuff', function()

	IsHandcuffed    = not IsHandcuffed;
	local playerPed = GetPlayerPed(-1)

	Citizen.CreateThread(function()

		if IsHandcuffed then
			
			RequestAnimDict('mp_arresting')
			
			while not HasAnimDictLoaded('mp_arresting') do
				Wait(100)
			end
			
			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			SetEnableHandcuffs(playerPed, true)
			SetPedCanPlayGestureAnims(playerPed, false)
			FreezeEntityPosition(playerPed,  true)
		
		else
			
			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed,  true)
			FreezeEntityPosition(playerPed, false)
		
		end

	end)
end)

RegisterNetEvent('esx_gouvjob:putInVehicle')
AddEventHandler('esx_gouvjob:putInVehicle', function()

	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

		local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  5.0,  0,  71)
    
    if DoesEntityExist(vehicle) then

    	local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
    	local freeSeat = nil

    	for i=maxSeats - 1, 0, -1 do
    		if IsVehicleSeatFree(vehicle,  i) then
    			freeSeat = i
    			break
    		end
    	end

    	if freeSeat ~= nil then
    		TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
    	end

    end

  end	

end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsHandcuffed then
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
		end
	end
end)

------------------------------------------------------------------------------------------------------------

RegisterNetEvent('esx_gouvjob:drag')
AddEventHandler('esx_gouvjob:drag', function(copId)
	if isHandcuffed then
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.CopId = copId
	end
end)

Citizen.CreateThread(function()
	local wasDragged

	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed and dragStatus.isDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true
				else
					Citizen.Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(playerPed, true, false)
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(playerPed, true, false)
		else
			Citizen.Wait(500)
		end
	end
end)

----------------------------------------------------------------------

RegisterNetEvent('esx_gouvjob:OutVehicle')
AddEventHandler('esx_gouvjob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 64)
	end
end)

-----------------------------------------------------------------------------------------------------------

function ImpoundVehicle(vehicle)
	--local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	ESX.Game.DeleteVehicle(vehicle)
	ESX.ShowNotification(_U('impound_successful'))
	currentTask.busy = false
end




---------- MENU Garage-----

local GarageGouvMenu = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Garage Gouv" },
	Data = { currentMenu = "Garage Gouv", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			if btn == "gouv Cruiser" then
				SetVehicleWindowTint(vehicle, 5)
				ESX.ShowNotification('Vous avez sorti un vehicule de gouv')
				Citizen.Wait(1)
				spawnCar("gouv")
			elseif btn == "Engin Gouv" then
				ESX.ShowNotification('Vous avez sorti un vehicule')
				Citizen.Wait(1)
				spawnCar("sspres")
			elseif btn == "Limousine" then
				ESX.ShowNotification('Vous avez sorti un vehicule')
				Citizen.Wait(1)
				spawnCar("stretch")
		end
	end,
},
	Menu = {
		["Garage Gouv"] = {
			b = {
				{name = "Limousine", ask = ">", askX = true},
				{name = "Engin Gouv", ask = ">", askX = true}
			}
		}
	}
}

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function spawnCar(car)
	local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, -508.299, -260.896, 35.48, 293.11, true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    
    SetEntityAsNoLongerNeeded(vehicle)
	SetModelAsNoLongerNeeded(vehicleName)
	SetVehicleWindowTint(vehicle, 3)
	SetVehicleNumberPlateText(vehicle, "Gouv")
        
end

--------------- GARAGE garbage FINI-------------

--------------- MENU F6 ----------

function LoadingPrompt(loadingText, spinnerType)

    if IsLoadingPromptBeingDisplayed() then
        RemoveLoadingPrompt()
    end

    if (loadingText == nil) then
        BeginTextCommandBusyString(nil)
    else
        BeginTextCommandBusyString("STRING");
        AddTextComponentSubstringPlayerName(loadingText);
    end

    EndTextCommandBusyString(spinnerType)
end


local mobgarbageMenu = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Interaction Gouvernement" },
	Data = { currentMenu = "Interaction Gouv", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			
			if btn == "Interaction Citoyens" then
				OpenMenu('interaction_citoyens')

			elseif btn == "Interaction Menottes" then
				OpenMenu('interaction_menottes')

			elseif btn == "Interaction Vehicules" then
				OpenMenu('interaction_vehicules')

------------------------------------------------------------------------------------------

elseif btn == "Mettre le véhicule en fourrière" then
	if currentTask.busy then
		return
	end

	ESX.ShowHelpNotification(_U('impound_prompt'))
	TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

	currentTask.busy = true
	currentTask.task = ESX.SetTimeout(10000, function()
		ClearPedTasks(playerPed)
		ImpoundVehicle(vehicle)
		Citizen.Wait(100) -- sleep the entire script to let stuff sink back to reality
	end)

elseif btn == "Amendes" then
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		CloseMenu()
	TriggerServerEvent('esx_gouvjob:message', GetPlayerServerId(closestPlayer), ('being_searched'))
	OpenFineMenu(closestPlayer)
	end

elseif btn == "Fouiller" then
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		CloseMenu()
	TriggerServerEvent('esx_gouvjob:message', GetPlayerServerId(closestPlayer), ('being_searched'))
	OpenBodySearchMenu(closestPlayer)
	end

elseif btn == "Info sur la personne" then
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		CloseMenu()
		TriggerServerEvent('esx_gouvjob:message', GetPlayerServerId(closestPlayer), ('being_searched'))
	OpenIdentityCardMenu(closestPlayer)
	end

elseif btn == "Menotter l'individu" then
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		SetMenuVisible(false)
		TriggerServerEvent('esx_gouvjob:handcuff', GetPlayerServerId(closestPlayer))
	end
elseif btn == "Déplacer l'individu" then 
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		SetMenuVisible(false)
		TriggerServerEvent('esx_gouvjob:drag', GetPlayerServerId(closestPlayer))
	end

elseif btn == "Mettre l'individu dans le véhicule" then
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		SetMenuVisible(false)
		TriggerServerEvent('esx_gouvjob:putInVehicle', GetPlayerServerId(closestPlayer))
	end
elseif btn == "Sortir l'individu du véhicule" then
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('esx_gouvjob:OutVehicle', GetPlayerServerId(closestPlayer))
	end

elseif btn == "Crocheter le véhicule" then
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
		TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
		Citizen.Wait(20000)
		ClearPedTasksImmediately(playerPed)

		SetVehicleDoorsLocked(vehicle, 1)
		SetVehicleDoorsLockedForAllPlayers(vehicle, false)
		ESX.ShowNotification(_U('vehicle_unlocked'))


--------------------------------------------------------------------------------

	end
			
		end
	end,

	
},
	Menu = {
		["Interaction Gouv"] = {
			b = {
				{name = "Interaction Citoyens", ask = ">", askX = true},
				{name = "Interaction Menottes", ask = ">", askX = true},
				{name = "Interaction Vehicules", ask = ">", askX = true}

			}
		},
		["interaction_citoyens"] = {
			b = {
				{name = "Amendes", ask = ">", askX = true},
				{name = "Fouiller", ask = ">", askX = true},
				{name = "Info sur la personne", ask = ">", askX = true},
			}
		},
		["interaction_menottes"] = {
			b = {
				{name = "Menotter l'individu", ask = ">", askX = true},
				{name = "Déplacer l'individu", ask = ">", askX = true},
				{name = "Mettre l'individu dans le véhicule", ask = ">", askX = true},
				{name = "Sortir l'individu du véhicule", ask = ">", askX = true},
			}
		},
		["interaction_vehicules"] = {
			b = {
				{name = "Mettre le véhicule en fourrière", ask = ">", askX = true},
				{name = "Crocheter le véhicule", ask = ">", askX = true},
			}
		}
	}
}


---------------- FIN MENU F6 garbage ---------------
local ArmeMenu = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Armes Gouv" },
	Data = { currentMenu = "Armes de services", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			if btn == "Déposer ces armes de services" then
				RemoveAllPedWeapons(GetPlayerPed(-1), true)
			elseif btn == "Tazer Volts x26 - Gouv" then	
				TriggerServerEvent('esx_gouvjob:AddTazer') 
			elseif btn == "Beretta 92 - Gouv" then	
				TriggerServerEvent('esx_gouvjob:AddPistol')
			elseif btn == "Glock 17 - Gouv" then
				TriggerServerEvent('esx_gouvjob:AddComPistol')
			elseif btn == "Fusil à pompe - Gouv" then
				TriggerServerEvent('esx_gouvjob:AddPump')
			elseif btn == "9mm - Gouv" then
				ESX.ShowNotification("~r~Error 401: Veuillez contacter un supérieur")

		end
	end,
},
	Menu = {
		["Armes de services"] = {
			b = {
				{name = "Déposer ces armes de services", ask = ">", askX = true},
				{name = "Tazer Volts x26 - Gouv", ask = ">", askX = true},
				{name = "Beretta 92 - Gouv", ask = ">", askX = true},
				{name = "Glock 17 - Gouv", ask = ">", askX = true},
				{name = "Fusil à pompe - Gouv", ask = ">", askX = true}
			}
		}
	}
}

local MyMenus = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Vestiaire" },
	Data = { currentMenu = "Vos tenues", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			if btn == "Reprendre vos affaires" then
				TriggerServerEvent("player:serviceOff", "gouv")
				TriggerEvent('esx_gouvjob:offDuty')
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
				end)
				SetPedArmour(playerPed, 0)			
			elseif btn == "Tenue Gouvernement" then
				TriggerServerEvent("player:serviceOn", "gouv")
				TriggerEvent('esx_gouvjob:onDuty')
				if PlayerData.job.grade_name == 'recruit' then
					TriggerEvent('skinchanger:getSkin', function(skin)
						if skin.sex == 0 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.recruit_wear.male)
						elseif skin.sex == 1 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.recruit_wear.female)
						end
					end)
				elseif PlayerData.job.grade_name == 'officer' then 
					TriggerEvent('skinchanger:getSkin', function(skin)
						if skin.sex == 0 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.officer_wear.male)
						elseif skin.sex == 1 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.officer_wear.female)
						end
					end)
				elseif PlayerData.job.grade_name == 'sergeant' then
					TriggerEvent('skinchanger:getSkin', function(skin)
						if skin.sex == 0 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.sergeant_wear.male)
						elseif skin.sex == 1 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.sergeant_wear.female)
						end
				end)
				elseif PlayerData.job.grade_name == 'lieutenant' then
					TriggerEvent('skinchanger:getSkin', function(skin)
						if skin.sex == 0 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.lieutenant_wear.male)
						elseif skin.sex == 1 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.lieutenant_wear.female)
						end
					end)
				elseif PlayerData.job.grade_name == 'boss' then
					TriggerEvent('skinchanger:getSkin', function(skin)
						if skin.sex == 0 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.boss_wear.male)
						elseif skin.sex == 1 then
								TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.boss_wear.female)
						end
					end)
				end	
			elseif btn == "Gilet Par Balle" then
				TriggerEvent('skinchanger:getSkin', function(skin)
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.bullet_wear.male)
					elseif skin.sex == 1 then
						TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.bullet_wear.female)
					end
				end)
		end
	end,
},
	Menu = {
		["Vos tenues"] = {
			b = {
				{name = "Reprendre vos affaires", ask = ">", askX = true},
				{name = "----------------------------------------"},
				{name = "Tenue Gouvernement", ask = ">", askX = true},
				{name = "Gilet Par Balle", ask = ">", askX = true}
			}
		}
	}
}

-- Create blips
Citizen.CreateThread(function()

	for k,v in pairs(Config.GouvStations) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(_U('map_blip'))
		EndTextCommandSetBlipName(blip)
	end

end)



local cloak = {
    {x = -541.297, y = -192.832, z = 47.42},
}

local garage = {
    {x = -508.825, y = -258.42, z = 35.59}
}

local arm = {
    {x = -551.071, y = -199.420, z = 47.41},
}

local boss = {
    {x = -546.71, y = -202.776, z = 47.41}
}

local del = {
    {x = -498.27, y = -256.708, z = 35.58}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlJustPressed(1,167) and PlayerData.job and PlayerData.job.name == 'gouv' then
			CreateMenu(mobgarbageMenu)
		end

		for k in pairs(arm) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, arm[k].x, arm[k].y, arm[k].z)

            if dist <= 2.2 and PlayerData.job and  PlayerData.job.name == 'gouv' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder à ~b~l'armurie~s~")
				if IsControlJustPressed(1,38) then 
					CreateMenu(ArmeMenu)
				end
            end
		end

		for k in pairs(cloak) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, cloak[k].x, cloak[k].y, cloak[k].z)

            if dist <= 2.2 and PlayerData.job and PlayerData.job.name == 'gouv' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder à votre ~b~casier~s~")
				if IsControlJustPressed(1,38) then 
					CreateMenu(MyMenus)
				end
            end
		end
		for k in pairs(garage) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, garage[k].x, garage[k].y, garage[k].z)

            if dist <= 2.2 and PlayerData.job and PlayerData.job.name == 'gouv' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~b~garage~s~")
				if IsControlJustPressed(1,38) then 
					CreateMenu(GarageGouvMenu)
				end
            end
		end
		for k in pairs(del) do
			
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, del[k].x, del[k].y, del[k].z)

            if dist <= 2.2 and PlayerData.job and PlayerData.job.name == 'gouv' and IsPedInAnyVehicle(PlayerPedId(-1), false) then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour rentrer votre à ~b~vehicule~s~ dans le ~b~garage~s~")
				if IsControlJustPressed(1,38) then 			
					TriggerEvent('esx:deleteVehicle')
				end
            end
		end
		for k in pairs(boss) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, boss[k].x, boss[k].y, boss[k].z)

            if dist <= 2.2 and PlayerData.job and PlayerData.job.name == 'gouv' and PlayerData.job.grade_name == 'boss' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder à l'ordinateur de ~b~l'entreprise~s~")
				if IsControlJustPressed(1,38) then 
					TriggerEvent('esx_society:openBossMenu', 'gouv', function(data, menu)
						menu.close()
					end, {wash = false})
				end
            end
        end
    end
end)



Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_armymech_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_armymech_01", -509.20, -257.65, 34.59, 206.76, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)