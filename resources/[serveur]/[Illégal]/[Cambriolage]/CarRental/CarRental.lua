rentalTimer = .5 --How often a player should be charged in Minutes

isBeingCharged = false

autoChargeAmount = 500 -- How much a player should be charged each time

ESX = nil

devMode = false

damageInsurance = false

damageCharge = false

canBeCharged = false

--handCuffed = false

arrestCheckAlreadyRan = false

isInPrison = false

isBlipCreated = true





Citizen.CreateThread(function()

	local items = { "Item 1", "Item 2", "Item 3", "Item 4", "Item 5" }

	local currentItemIndex = 1

	local selectedItemIndex = 1

	local checkBox = false



	pickupStation = { --Set the car rental locaitons here

		{x = -57.95, y = -2244.89, z = 8.45},		--Airport car rental place

		

	}

	dropoffStation = { --Set the car dropoff locations here

	{x = 192.76, y = -1846.0, z = 26.21}, --Airport car rental place

	{x = 600.72, y = -1872.03, z = 24.72}, -- PV At Legion SQ

	}



    while ESX == nil do

		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

		Citizen.Wait(0)

    end



	WarMenu.CreateMenu('carRental', 'John Transport')

	WarMenu.CreateSubMenu('closeMenu', 'carRental', 'Tu es en securite ?')

	WarMenu.CreateSubMenu('carPicker', 'carRental', '')

	WarMenu.CreateSubMenu('carInsurance', 'carRental', 'Vous voulez acheter une assurance automobile?')

	WarMenu.CreateMenu('carReturn', 'John Transport')

	WarMenu.SetSubTitle('carReturn', 'Contactez John.')

	WarMenu.CreateMenu('arrestCheck', 'Location Camion')

	WarMenu.SetSubTitle('arrestCheck', 'etes-vous actuellement arrete?')



	while true do

		--Main menu

		if WarMenu.IsMenuOpened('carRental') then

			if WarMenu.MenuButton('Frapper a la porte', 'carPicker') then

			elseif WarMenu.MenuButton('Salir') then

				--elseif WarMenu.Button('DEV: Return car') then

			--	returnVehicle()

			--elseif WarMenu.Button('DEV: Delete car') then

			--	local currentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

			--	SetEntityAsMissionEntity(currentVehicle, true, true)

			--	DeleteVehicle(currentVehicle)

			--elseif WarMenu.Button('DEV: Add 200k') then

			--	TriggerServerEvent("devAddPlayer", 200000)

            --elseif WarMenu.CheckBox('DEV: Dev Mode', checkbox, function(checked)

            --        checkbox = checked

			--		devMode = checked

            --end) then

			--elseif WarMenu.Button('DEV: Spawn intruder') then

			--	SpawnVehicle("intruder")

			--	Citizen.Wait(100)

			--	canBeCharged = false

            --elseif WarMenu.CheckBox('DEV: Handcuffed', checkbox2, function(checked2)

            --        checkbox2 = checked2

			--		handCuffed = not checked2

            --end) then

			--elseif WarMenu.Button('DEV: TP Prison') then

			--	SetEntityCoords(GetPlayerPed(-1), 1677.233, 2658.618, 45.216)

			--elseif WarMenu.Button('DEV: TP Rental') then

			--	SetEntityCoords(GetPlayerPed(-1), -902.26593017578, -2327.3703613281, 5.7090311050415)

			--elseif WarMenu.MenuButton('Exit', 'closeMenu') then

			end

			WarMenu.SetSubTitle('carRental', 'Porte')



			WarMenu.Display()



		--Close menu

		elseif WarMenu.IsMenuOpened('closeMenu') then

			if WarMenu.Button('Oui') then

				WarMenu.CloseMenu()

			elseif WarMenu.MenuButton('Non', 'carRental') then

			end



			WarMenu.Display()





		elseif WarMenu.IsMenuOpened('carPicker') then

			if WarMenu.Button('Commandez Camion') then

				SpawnVehicle("Boxville2")

				TriggerServerEvent("chargePlayer", 500)

				ESX.ShowNotification("Avoir les clés, ce sera 500$ pour aujourd'hui, je veux la premiere chose le matin!")

				autoChargeAmount = 0

				isBeingCharged = true

				WarMenu.CloseMenu()



			end



			WarMenu.Display()



		--Return car menu

		elseif WarMenu.IsMenuOpened('carReturn') then

			if WarMenu.Button('Retourner le Camion') then

				returnVehicle()

				WarMenu.CloseMenu() 

			--elseif WarMenu.Button('No') then

				--WarMenu.CloseMenu()

			end



			WarMenu.Display()



		--Car insurance menu

		--elseif WarMenu.IsMenuOpened('carInsurance') then

			--if WarMenu.Button('Yes | $200') then

				--TriggerServerEvent("chargePlayer", 200)

				--damageInsurance = true

				--ESX.ShowNotification("Ahora puedes conducir como idiota!")

				--WarMenu.CloseMenu()

			--elseif WarMenu.MenuButton('No', 'carRental') then

			--end



			WarMenu.Display()



		--Arrest check menu

		elseif WarMenu.IsMenuOpened('arrestCheck') then

			if WarMenu.Button('Oui') then

				isBeingCharged = false

				damageInsurance = false

				damageCharge = false

				arrestCheckAlreadyRan = true

				ESX.ShowNotification('L�assurance automobile a été annulee')

				WarMenu.CloseMenu()

			elseif WarMenu.Button('Non') then

				WarMenu.CloseMenu()

				arrestCheckAlreadyRan = true

			end



			WarMenu.Display()



		--elseif IsControlJustReleased(0, 48) then

		--	WarMenu.OpenMenu('carRental')

		--end

		end









		Citizen.Wait(0)

	end





end)

--Draw map blips

Citizen.CreateThread(function()

	while true do

		Citizen.Wait(0)

		if not isBlipCreated then

			for _, v in pairs(pickupStation) do

				pickupBlip = AddBlipForCoord(v.x, v.y, v.z)

      			SetBlipSprite(pickupBlip, 85)

      			SetBlipDisplay(pickupBlip, 4)

      			SetBlipScale(pickupBlip, 1.0)

      			SetBlipColour(pickupBlip, 2)

      			SetBlipAsShortRange(pickupBlip, true)

	  			BeginTextCommandSetBlipName("STRING")

      			AddTextComponentString("Car Rental")

      			EndTextCommandSetBlipName(pickupBlip)

			end

			for _, v in pairs(dropoffStation) do

				pickupBlip = AddBlipForCoord(v.x, v.y, v.z)

      			SetBlipSprite(pickupBlip, 85)

      			SetBlipDisplay(pickupBlip, 4)

      			SetBlipScale(pickupBlip, 0.60)

      			SetBlipColour(pickupBlip, 1)

      			SetBlipAsShortRange(pickupBlip, true)

	  			BeginTextCommandSetBlipName("STRING")

      			AddTextComponentString("Car Dropoff")

      			EndTextCommandSetBlipName(pickupBlip)

			end

			isBlipCreated = true

		else

		end

	end

end)



--Draw markers

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		for _, v in pairs(pickupStation) do

			DrawMarker(39, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.50, 0.50, 0.50, 0, 204, 0, 50, false, true, 2, false, false, false, false)

			--{title="Car Rental", colour=2, id=85, x=v.x, y=v.y, z=v.z, scale=0.75}

		end

		for _, v in pairs(dropoffStation) do

			DrawMarker(1, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.50, 0.50, 0.50, 200, 0, 0, 50, false, true, 2, false, false, false, false)

		end

	end

end)



--Check to see if player is in marker

Citizen.CreateThread(function()

	while true do

		local HasAlreadyEnteredMarker = false

		Citizen.Wait(0)



		local coords = GetEntityCoords(GetPlayerPed(-1))

		local isInMarker = false

		local isInReturnMarker = false



		for _, v in pairs(pickupStation) do

			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.0) then

				isInMarker = true

			end

		end



		for _, v in pairs(dropoffStation) do

			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 2.75) then

				isInReturnMarker = true

			end

		end



		if (isInReturnMarker and not WarMenu.IsMenuOpened('carReturn')) then

			local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))

			if plate == " RENTAL " then

				WarMenu.OpenMenu('carReturn')

			end

		end



		if (not isInReturnMarker and not devMode and not isInMarker) then

			Citizen.Wait(100)

			WarMenu.CloseMenu()

		end



		if (isInMarker and not WarMenu.IsMenuOpened('carRental') and not WarMenu.IsMenuOpened('carPicker') and not WarMenu.IsMenuOpened('closeMenu') and not WarMenu.IsMenuOpened('carInsurance') and not WarMenu.IsMenuOpened('arrestCheck')) then

			WarMenu.OpenMenu('carRental')

		end



		if (not isInMarker and not devMode and not isInReturnMarker) then

			Citizen.Wait(100)

			WarMenu.CloseMenu()

		end

	end

end)





--Auto charge player every 5 minutes

Citizen.CreateThread(function()

	while true do

		Citizen.Wait(rentalTimer*60*1000)

		if isBeingCharged == true then

			TriggerServerEvent("chargePlayer", autoChargeAmount)

			ESX.ShowNotification("Attention a la police et aussi ! je veux récuperer mon camion ! Ne oublie pas de ma le ramenez ! ")

		end

	end

end)



--Spawn vehicle function

function SpawnVehicle(request)

			local hash = GetHashKey(request)



			RequestModel(hash)



			while not HasModelLoaded(hash) do

				RequestModel(hash)

				Citizen.Wait(0)

			end



			local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))

			local vehicle = CreateVehicle(hash, x + 2, y + 9, z + 1, 0.0, true, false)

			SetVehicleDoorsLocked(vehicle, 1)

			SetVehicleNumberPlateText(vehicle, "RENTAL")

			canBeCharged = true

			arrestCheckAlreadyRan = false

			isInPrison = false

			TaskWarpPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)

end



--Return vehicle script

function returnVehicle()

			isBeingCharged = false

			damageInsurance = false

			damageCharge = false

			ESX.ShowNotification("Au fil du temps, un travailleur de John's aurait continué � chercher le vehicule.")

			local currentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

			SetEntityAsMissionEntity(currentVehicle, true, true)

			local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))

			SetEntityCoords(GetPlayerPed(-1), x - 2, y, z)

			DeleteVehicle(currentVehicle)

end



