ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

local blips = {
    {title="Location", colour=0, id=280, x = -491.8803, y = -688.4857, z = 32.426},

}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, 3)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

function DrawMissionText(msg, time)
    ClearPrints()
    SetTextEntry_2('STRING')
    AddTextComponentString(msg)
    DrawSubtitleTimed(time, 1)
  end

local oLoc = {

        Base = {  Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {228, 233, 228}, Title = "Location",  Blocked = false },
        Data = { currentMenu = "Location de véhicule", "" },
        Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
              if btn.name == "Blista" then
                    TriggerServerEvent('oLoc:buy', 200, "blista", "Blista")
                    ESX.ShowNotification('Vous venez de sortir un vehicule ~r~sans-permis ~w~!')
                    Citizen.Wait(1)
                    spawnCar("blista")
                elseif btn.name == "Panto" then
                    TriggerServerEvent('oLoc:buy', 200, "panto", "panto")
                    ESX.ShowNotification('Vous venez de sortir un vehicule ~r~sans-permis ~w~!')
					Citizen.Wait(1)
                    spawnCar("panto")
                elseif btn.name == "Manchez" then
                    TriggerServerEvent('oLoc:buy', 200, "manchez", "Manchez")
                    ESX.ShowNotification('Vous venez de louer une ~g~moto ~w~!')
					Citizen.Wait(1)
                    spawnCar("manchez")
                elseif btn.name == "Faggio" then
                    TriggerServerEvent('oLoc:buy', 100, "faggio3", "Faggio")
                    ESX.ShowNotification('Vous venez de louer un ~g~scooteur ~w~!')
					Citizen.Wait(1)
                    spawnCar("faggio3")
                elseif btn.name == "Bmx" then
                    TriggerServerEvent('oLoc:buy', 50, "bmx", "Bmx")
                    ESX.ShowNotification('Vous venez de louer un ~g~bmx ~w~!')
					Citizen.Wait(1)
                    spawnCar("bmx")
                elseif btn.name == "Fixter" then
                    TriggerServerEvent('oLoc:buy', 50, "fixter", "Fixter")
                    ESX.ShowNotification('Vous venez de louer un ~g~Fixter ~w~!')
					Citizen.Wait(1)
                    spawnCar("fixter")




              end
        end,
    },
 
    Menu = {
        ["Location de véhicule"] = {
            b = {
                {name = "Véhicule sans-permis", ask = "→", askX = true},
                {name = "Moto sans-permis", ask = "→", askX = true},
            }
        },

        ["véhicule sans-permis"] = {
            b = {
                {name = "Blista", ask = "~g~", askX = true},
                {name = "Panto", ask = "~g~", askX = true},
            }
        },

        ["moto sans-permis"] = {
            b = {
                {name = "Faggio", ask = "~g~", askX = true},
            }
        },

    }
}
spawnCar = function(car)
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end
     Vehicle = CreateVehicle(car, -499.141, -667.30, 32.94, 269.0, true, false)
    SetEntityAsMissionEntity(Vehicle, true, true)
    SetVehicleNumberPlateText(Vehicle, "Location")
end

local NehcoLoc = {
    { x = -490.73, y = -689.18, z = 33.05}
}



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k, v in pairs(NehcoLoc) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, NehcoLoc[k].x, NehcoLoc[k].y, NehcoLoc[k].z)
            DrawMarker(29, v.x, v.y, 44.28, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 66, 238, 13,  155, false, true, 2, true, nil, nil, false)
            if dist <= 1.5 then
				ESX.ShowHelpNotification("~g~Appuyez ~w~sur ~g~~INPUT_CONTEXT~~w~ pour ~b~parler ~w~avec la ~r~Location")
                if IsControlJustPressed(1,51) then
                    Citizen.Wait(500) 
                    DrawMissionText("~g~[Location]~s~ Bonjour !", 1200)
                    Citizen.Wait(1050)
                    DrawMissionText("~b~[Vous]~s~ Bonjour, Monsieur ", 1400)
                    Citizen.Wait(1050)
                DrawMissionText("~g~[Location]~s~ Comment puis-je vous aider ?", 2000)
                Citizen.Wait(1500)
                    DrawMissionText("~b~[Vous]~s~ Je suis nouveau en ville, j'aimerais louer un Véhicule", 2000)
                    Citizen.Wait(2050)
                    DrawMissionText("~g~[Location]~s~ Pas de probleme ! J'ai ce qu'il vous faut", 2500)
                    Citizen.Wait(1050)
                    DrawMissionText("~g~[Location]~s~ Voici les Véhicules que je vous propose", 2600)
                    CreateMenu(oLoc)
                    Citizen.Wait(20000)
				end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_f_y_business_02")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_f_y_business_02", -490.63, -687.74, 32.21, 189.09, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
end)