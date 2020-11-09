ESX = nil



Citizen.CreateThread(function()

	while ESX == nil do

		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

		Citizen.Wait(100)

	end

end)



------------ Création du Menu / Sous Menu -----------



RMenu.Add('example', 'main', RageUI.CreateMenu("Magasin", "Magasin"))

RMenu.Add('example', 'téléphone', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Téléphone", "Menu Téléphone"))

RMenu.Add('example', 'carte sim', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Carte Sim", "Menu Carte Sim"))



Citizen.CreateThread(function()

    while true do

        RageUI.IsVisible(RMenu:Get('example', 'main'), true, true, true, function()



            RageUI.Button("Carte Sim", "Choisi ta Carte Sim !", {RightLabel = "→→→"},true, function()

            end, RMenu:Get('example', 'carte sim'))



            RageUI.Button("Téléphone", "Choisi ton téléphone !", {RightLabel = "→→→"},true, function()

            end, RMenu:Get('example', 'téléphone'))

        end, function()

        end)



        RageUI.IsVisible(RMenu:Get('example', 'carte sim'), true, true, true, function()



            RageUI.Button("Carte Sim", "Achetez une Carte Sim !", {RightLabel = "~g~150$"}, true, function(Hovered, Active, Selected)

                if (Selected) then

                    TriggerServerEvent('powx_tuto:Buysim')

                end

            end)

        end, function()

        end)



            RageUI.IsVisible(RMenu:Get('example', 'téléphone'), true, true, true, function()



                RageUI.Button("Téléphone", "Achetez un Téléphone !", {RightLabel = "~g~300$"}, true, function(Hovered, Active, Selected)

                    if (Selected) then

                        TriggerServerEvent('powx_tuto:Buytel')

                    end

                end)

                        

            end, function()

                ---Panels

            end, 1)

    

            Citizen.Wait(0)

        end

    end)







    ---------------------------------------- Position du Menu --------------------------------------------



    local position = {

        {x = -656.67 , y = -857.37, z = 24.49, }

    }    

    

    

    Citizen.CreateThread(function()

        while true do

            Citizen.Wait(0)

    

            for k in pairs(position) do

    

                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

    

                if dist <= 1.0 then



                   RageUI.Text({

                        message = "Appuyez sur [~b~E~w~] pour acceder au ~b~Magasin",

                        time_display = 1

                    })

                   -- ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour acceder au ~b~Shop")

                    if IsControlJustPressed(1,51) then

                        RageUI.Visible(RMenu:Get('example', 'main'), not RageUI.Visible(RMenu:Get('example', 'main')))

                    end

                end

            end

        end

    end)

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_solomon")
    
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end

    ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_solomon", -656.77, -858.75, 23.454, 4.46, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)

local blips = {
        {title="DigitalDen", colour=0, id=459, x = -657.00, y = -856.00, z = 24.00}
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


---- |-| By Nehco |-| ----
