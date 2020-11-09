ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(80000)
  end
end)

local accessoire = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 255, 0}, Title = "Accessoires" },
	Data = { currentMenu = "Choisissez vos choix | By L'ancien Kadir#1204", "Accessoires" },
    Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result)
        if btn.name == "Skin de Luxe" then 
            TriggerServerEvent("Skin")
        elseif btn.name == "Poignée" then 
            TriggerServerEvent("Poigne")
        elseif btn.name == "Chargeur" then  
            TriggerServerEvent("Chargeur")
        elseif btn.name == "Silencieux" then  
            TriggerServerEvent("Silencieux")
        elseif btn.name == "Lampe" then   
            TriggerServerEvent("Lampe")
        elseif btn.name == "Viseur" then
            TriggerServerEvent("Viseur")
            end
        end,
	},
	
	Menu = {
		["Choisissez vos choix | By L'ancien Kadir#1204"] = {
			b = {
                {name = "Skin de Luxe", ask = "~g~$950", askX = true},
                {name = "Poignée", ask = "~g~$150", askX = true},
                {name = "Chargeur", ask = "~g~$500", askX = true},
                {name = "Silencieux", ask = "~g~$500", askX = true},
                {name = "Lampe", ask = "~g~$250", askX = true},
                {name = "Viseur", ask = "~g~$800", askX = true},
			}
		}
	}
}

--- Parler au ped

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, 18.02, -1111.02, 29.8)

        if dist <= 0.5 then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec ~b~Jackline")
                if IsControlJustPressed(1,51) then 
	                CreateMenu(accessoire)
                end
            end
        end
    end)
    

--- Peds 

Citizen.CreateThread(function()
    local hash = GetHashKey("s_f_y_hooker_03")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_f_y_hooker_03", 16.79, -1110.59, 28.8, 236.03, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    TaskStartScenarioInPlace(ped, "CODE_HUMAN_CROSS_ROAD_WAIT", 0, true)
end)

