ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(80000)
  end
end)

local arme = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 255, 0}, Title = "Armurerie" },
	Data = { currentMenu = "Armurerie Automatique", "Armurerie" },
    Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result)

                -- Armes Létal

            if btn.name == "Pistolet" then
                TriggerServerEvent("buyPistoletArme")
                self:CloseMenu(true)
            elseif btn.name == "Pistolet Calibre 50" then
                TriggerServerEvent("buyPistolet50Arme")
                self:CloseMenu(true)
            elseif btn.name == "Revolvert" then
                TriggerServerEvent("buyRevolvertArme")
                self:CloseMenu(true)
                -- Armes de poing
            elseif btn.name == "Couteau" then
                TriggerServerEvent("buyCut")
                self:CloseMenu(true)
            elseif btn.name == "Bat de baseball" then
                TriggerServerEvent("buyBat")
                self:CloseMenu(true)
            elseif btn.name == "Poing Américain" then
                TriggerServerEvent("buyPoing")
                self:CloseMenu(true)
            elseif btn.name == "Chargeur" then
                TriggerServerEvent("BuyClip")
            end
        end,
	},
	
	Menu = {
		["Armurerie Automatique"] = {
			b = {
                {name = "Armes de poing", ask = "→", askX = true},
                {name = "Chargeur", ask = "~g~$500", askX = true},
			}
		},

        ["armes de poing"] = {
			b = {
                {name = "Couteau", ask = "~g~$100", askX = true},
                {name = "Bat de baseball", ask = "~g~$200", askX = true},
                {name = "Poing Américain", ask = "~g~$225", askX = true},
			}
	    }
	}
}

--- Parler au ped

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, 21.24, -1106.36, 29.79)

        if dist <= 0.5 then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec ~b~L'Armurier")
                if IsControlJustPressed(1,51) then 
	                CreateMenu(arme)
             end
        end
    end
end)


-- Blips

local blips = {
    {title="Armurier Automatique", colour=2, id=1, x = 22.83, y = -1106.94, z = 29.79}
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

--- Peds 

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_marine_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "s_m_m_marine_01", 21.62, -1104.5, 28.8,154.62, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)
end)
