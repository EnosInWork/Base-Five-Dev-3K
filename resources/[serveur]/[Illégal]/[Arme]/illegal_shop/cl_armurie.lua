ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(80000)
  end
end)

local arme = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 0}, Title = "Armurerie illégal" },
	Data = { currentMenu = "Choisissez votre catégorie !", "Armurerie" },
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
            elseif btn.name == "Vintage Pistol" then
                TriggerServerEvent("buyVintageArme")
                self:CloseMenu(true)
            elseif btn.name == "Pistolet de combat" then
                TriggerServerEvent("buyPCombatArme")
                self:CloseMenu(true)
            elseif btn.name == "Pistolet automatique" then
                TriggerServerEvent("buyPautoArme")
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
            elseif btn.name == "Club de Golf" then
                TriggerServerEvent("buyGolf")
                self:CloseMenu(true)
            elseif btn.name == "Pied de biche" then
                TriggerServerEvent("buyPBiche")
                self:CloseMenu(true)
            elseif btn.name == "Coktail Molotov" then
                TriggerServerEvent("buyCoktail")
                self:CloseMenu(true)
                -- Armes Lourdes
            elseif btn.name == "Mini SMG" then
                TriggerServerEvent("buyMiniSMG")
                self:CloseMenu(true)
            elseif btn.name == "SMG" then
                TriggerServerEvent("buySMG")
                self:CloseMenu(true)
            elseif btn.name == "Tech-9" then
                TriggerServerEvent("buyTec9")
                self:CloseMenu(true)
            elseif btn.name == "Fusil à pompe" then
                TriggerServerEvent("buyFPompe")
                self:CloseMenu(true)
            elseif btn.name == "AK-47" then
                TriggerServerEvent("buyAK47")
                self:CloseMenu(true)
            elseif btn.name == "Carabine d'assault" then
                TriggerServerEvent("buyCRifle")
                self:CloseMenu(true)
            elseif btn.name == "Sniper" then
                TriggerServerEvent("buySnipe")
                self:CloseMenu(true)
            elseif btn.name == "Grenade" then
                TriggerServerEvent("buyGrenade")
                self:CloseMenu(true)
            elseif btn.name == "Bombe collante" then
                TriggerServerEvent("buySTBomb")
                self:CloseMenu(true)
            end
        end,
	},
	
	Menu = {
		["Choisissez votre catégorie !"] = {
			b = {
                {name = "Armes létal", ask = "→", askX = true},
                {name = "Armes blanche", ask = "→", askX = true},
                {name = "Armes lourde", ask = "→", askX = true},
			}
		},

        ["armes létal"] = {
			b = {
                {name = "Pistolet", ask = "~r~$1,500", askX = true},
                {name = "Pistolet Calibre 50", ask = "~r~$2,500", askX = true},
                {name = "Revolvert", ask = "~r~$3,000", askX = true},
                {name = "Vintage Pistol", ask = "~r~$3,450", askX = true},
                {name = "Pistolet de combat", ask = "~r~$3,500", askX = true},
                {name = "Pistolet automatique", ask = "~r~$4,000", askX = true},
			}
		},

        ["armes blanche"] = {
			b = {
                {name = "Couteau", ask = "~r~$10", askX = true},
                {name = "Bat de baseball", ask = "~r~$20", askX = true},
                {name = "Poing Américain", ask = "~r~$20", askX = true},
                {name = "Club de Golf", ask = "~r~$15", askX = true},
                {name = "Pied de biche", ask = "~r~$10", askX = true},
                {name = "Coktail Molotov", ask = "~r~$25,000", askX = true},
			}
        },
        
        ["armes lourde"] = {
            b = {
                {name = "Mini SMG", ask = "~r~$6,000", askX = true},
                {name = "SMG", ask = "~r~$6,500", askX = true},
                {name = "Tech-9", ask = "~r~$6,500", askX = true},
                {name = "Fusil à pompe", ask = "~r~$6,000", askX = true},
                {name = "AK-47", ask = "~r~$15,000", askX = true},
                {name = "Carabine d'assault", ask = "~r~$15,000", askX = true},
                {name = "Sniper", ask = "~r~$350,000", askX = true},
                {name = "Grenade", ask = "~r~$1,000,000", askX = true},
                {name = "Bombe collante", ask = "~r~$2,000,000", askX = true},
            }
	    }
	}
}

--- Parler au ped

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, 555.428, 2795.996, 38.00)

        if dist <= 0.5 then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec ~r~Sémir")
                if IsControlJustPressed(1,51) then 
	                CreateMenu(arme)
             end
        end
    end
end)


-- Blips

local blips = {
--    {title="Magasin d'armes", colour=2, id=1, x = 22.83, y = -1106.94, z = 29.79}
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
    ped = CreatePed("PED_TYPE_CIVMALE", "s_m_m_marine_01", 555.336, 2797.631, 37.20, 181.32, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", 0, true)
end)
