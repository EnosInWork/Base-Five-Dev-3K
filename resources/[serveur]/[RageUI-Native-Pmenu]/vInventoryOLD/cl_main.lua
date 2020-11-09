ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    ESX.PlayerData = ESX.GetPlayerData()

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(0)
    end

    RefreshMoney()

    VM.WeaponData = ESX.GetWeaponList()

	for i = 1, #VM.WeaponData, 1 do
		if VM.WeaponData[i].name == 'WEAPON_UNARMED' then
			VM.WeaponData[i] = nil
		else
			VM.WeaponData[i].hash = GetHashKey(VM.WeaponData[i].name)
		end
    end

    RMenu.Add('inventory', 'main', RageUI.CreateMenu("Inventaire", "", 0,0))
    RMenu.Add('inventory', 'inventory', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Choix", "~g~Type"))
    RMenu.Add('inventory', 'weapon', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Inventaire", "~g~Inventaire du joueur"))
    RMenu.Add('inventory', 'admin', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Admin", "Admin"))
    RMenu.Add('inventory', 'inventaire', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Inventaire", "~g~Inventaire du joueur"))
    RMenu.Add('inventory', 'inventaire_use', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Inventaire", "~g~Inventaire du joueur"))
    RMenu.Add('inventory', 'weapon_use', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Inventaire", "~g~Inventaire du joueur"))
    RMenu.Add('inventory', 'portefeuille', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Portefeuille", "~g~Portefeuille"))
    RMenu.Add('inventory', 'portefeuille_use', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Portefeuille", "~g~Portefeuille"))
    RMenu.Add('inventory', 'portefeuille_money', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Portefeuille", "~g~Actions sur votre portefeuille"))
    RMenu.Add('inventory', 'portefeuille_work', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Emplois", "~g~Gestions de votre emplois"))
    RMenu.Add('inventory', 'portefeuille_billing', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Factures", "~g~Gestions de vos factures"))
    RMenu.Add('inventory', 'menu', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Menu", "~g~Modifier la couleur de votre menu"))
    RMenu.Add('inventory', 'sante', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Santé", "~g~Infos disponibles"))
    RMenu.Add('inventory', 'divers', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Divers", "~g~Divers"))
    RMenu.Add('inventory', 'visual', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Visuel", "~p~Menu visuel"))
    RMenu.Add('inventory', 'utils', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "utils", "~r~Serveur"))
    RMenu.Add('inventory', 'clothesbase', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Tenue", "Vêtements / Accessoire"))
    RMenu.Add('inventory', 'clothes', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Vêtements", "Vêtements"))
    RMenu.Add('inventory', 'accessories', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Accessoire", "Accessoire"))
    RMenu.Add('inventory', 'tserv', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Touche Serveur", "~r~Serveur"))
    RMenu.Add('inventory', 'boos', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Gestion d'entreprise", "~r~Gestion d'entreprise"))
    RMenu.Add('inventory', 'voiture', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Gestion Véhicule", "~r~Gestions Véhicule"))
    RMenu.Add('inventory', 'voiture_auto', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "AutoPilote", "~r~AutoPilote"))
    RMenu.Add('inventory', 'voiture_porte', RageUI.CreateSubMenu(RMenu:Get('inventory', 'main'), "Véhicule", "~g~Porte de votre véhicule"))
    RMenu:Get('inventory', 'main'):SetSubtitle("Connecté en tant que : ~g~".. GetPlayerName(PlayerId()) .. '')
    RMenu:Get('inventory', 'main').EnableMouse = false
    RMenu:Get('inventory', 'main').Closed = function()

        VM.Menu = false
    end
end)

function RefreshMoney()
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			societymoney = ESX.Math.GroupDigits(money)
		end, ESX.PlayerData.job.name)
	end
end

RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job.name == society then
		societymoney = ESX.Math.GroupDigits(money)
	end
end)

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
VM = {
    ItemSelected = {},
    ItemSelected2 = {},
    WeaponData = {},
    Menu = false,
    Ped = PlayerPedId(),
    bank = nil,
    sale = nil,
    AdemoFaim = 0,
    AdemoSoif= 0,
    map = true,
    billing = {},
    visual = false,
    visual2 = false,
    visual3 = false,
    visual4 = false,
    visual5 = false,
    visual6 = false,
    visual7 = false,
    visual8 = false,
    visual9 = false,
    visual10 = false,
    list2 = 1,
    Accessories = {'oreille', 'lunette', 'casque', 'masque'},
    Clothes = {'torso', 'pants', 'shoes', 'bag', 'bproof', 'watches'},
    Filtres = {'normal', 'améliorees', 'amplifiees', 'noir/blanc'},
}


VM.V = {
    VehPed = GetVehiclePedIsIn(VM.Ped, false),
    Get = GetVehiclePedIsUsing(VM.Ped),
    agauche = false,
    argauche = false,
    adroite = false,
    ardroite = false,
    capot = false,
    test = false
}


local menuColor = {66, 173, 245}
Citizen.CreateThread(function()
    Wait(1000)
    menuColor[1] = GetResourceKvpInt("menuR")
    menuColor[2] = GetResourceKvpInt("menuG")
    menuColor[3] = GetResourceKvpInt("menuB")
    ReloadColor()
end)

local AllMenuToChange = nil
function ReloadColor()
    Citizen.CreateThread(function()
        if AllMenuToChange == nil then
            AllMenuToChange = {}
            for Name, Menu in pairs(RMenu['inventory']) do
                if Menu.Menu.Sprite.Dictionary == "commonmenu" then
                    table.insert(AllMenuToChange, Name)
                end
            end
        end
        for k,v in pairs(AllMenuToChange) do
            RMenu:Get('inventory', v):SetRectangleBanner(menuColor[1], menuColor[2], menuColor[3], 255)
        end
    end)
end

Citizen.CreateThread(function()
	
	while true do
		Citizen.Wait(4000)
		
		TriggerEvent('esx_status:getStatus', 'hunger', function(status)
			VM.AdemoFaim = status.val/1000000*100

		end)
		TriggerEvent('esx_status:getStatus', 'thirst', function(status)
			VM.AdemoSoif = status.val/1000000*100

		end)
		
	end

end)


function openMenu()
    if VM.Menu then
        VM.Menu = false
    else
        VM.Menu = true
        RageUI.Visible(RMenu:Get('inventory', 'main'), true)

        Citizen.CreateThread(function()
            while VM.Menu do

                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'main'), true, true, true, function() 

                    RageUI.ButtonWithStyle("Inventaire", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                        if Selected then
                            end
                        end, RMenu:Get('inventory', 'inventory'))

                    RageUI.ButtonWithStyle("Portefeuille", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                        if Selected then
                            end
                        end, RMenu:Get('inventory', 'portefeuille'))

                    RageUI.ButtonWithStyle("Serveur", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                        if Selected then
                            end
                        end, RMenu:Get('inventory', 'utils'))

                  --      RageUI.ButtonWithStyle("Vétements", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                    --        if Selected then
                      --          end
                        --    end, RMenu:Get('inventory', 'clothesbase'))

                            RageUI.ButtonWithStyle("Divers", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                                if Selected then
                                    end
                                end, RMenu:Get('inventory', 'divers'))

                    if IsPedSittingInAnyVehicle(VM.Ped) then
                        RageUI.ButtonWithStyle("Gestion Véhicule", "Menu de votre véhicule", {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                            if Selected then
                                end
                            end, RMenu:Get('inventory', 'voiture'))                       
                        else
                            RageUI.ButtonWithStyle('Gestion Véhicule', description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                                if (Selected) then
                                    end 
                                end)
                            end

                            if playerGroup ~= 'user' then
                                RageUI.ButtonWithStyle("Administration", "Menu d'Administration", {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                                ESX.TriggerServerCallback('Nehco:getUsergroup', function(group)
                                playerGroup = group
                         end)
      
                       if Selected then
                       TriggerEvent('openmenustaff')
                       RageUI.CloseAll()
                       end
                     end)
                  end

                        end, function()
                    end)
                ----------------------------------------------------------------------------------
                RageUI.IsVisible(RMenu:Get('inventory', 'voiture'), true, true, true, function()

                    Ped = GetPlayerPed(-1)
                    GetSourcevehicle = GetVehiclePedIsIn(Ped, false)
                    Vengine = GetVehicleEngineHealth(GetSourcevehicle)/10
                    local Vengine = math.floor(Vengine)

                    if IsPedSittingInAnyVehicle(VM.Ped) then
                        RageUI.Separator("Plaque d'immatriculation = ~b~"..GetVehicleNumberPlateText(VM.V.VehPed).."")
                    else
                        RageUI.GoBack()
                    end
                    
                    RageUI.Separator("Etat du moteur~s~ =~b~ "..Vengine.."%")

                    RageUI.ButtonWithStyle("~g~Allumer~s~/~r~Eteindre~s~ votre moteur", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered,Active,Selected) 
                        if Selected then
                            if GetIsVehicleEngineRunning(VM.V.VehPed) then
                                    SetVehicleEngineOn(VM.V.VehPed, false, false, true)
                                    SetVehicleUndriveable(VM.V.VehPed, true)
                            elseif not GetIsVehicleEngineRunning(VM.V.VehPed) then
                                    SetVehicleEngineOn(VM.V.VehPed, true, false, true)
                                    SetVehicleUndriveable(VM.V.VehPed, false)
                                end
                            end
                        end)
         
                    RageUI.ButtonWithStyle("Gestion des portes", nil, {RightLabel = "→→"}, true, function(Hovered,Active,Selected) 
                        if Selected then
                            end
                        end, RMenu:Get('inventory', 'voiture_porte'))                            
                    end,function()
                end)
                ----------------------------------------------------------------------------------
                RageUI.IsVisible(RMenu:Get('inventory', 'voiture_porte'), true, true, true, function()
                    RageUI.ButtonWithStyle("Ouvrir/Fermer Avant ~r~Gauche", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                        if Selected then
                                SetVehicleDoorOpen(VM.V.VehPed, 0, VM.V.agauche)
                                    VM.V.agauche = not VM.V.agauche
                                end
                            end)

                    RageUI.ButtonWithStyle("Ouvrir/Fermer Avant ~g~Droite", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                        if Selected then
                            if not VM.V.adroite then
                                VM.V.adroite = true
                                SetVehicleDoorOpen(VM.V.VehPed, 1, false, false)
                            elseif VM.V.adroite then
                                VM.V.adroite = false
                                SetVehicleDoorShut(VM.V.VehPed, 1, false, false)
                                end
                            end
                        end)

                    RageUI.ButtonWithStyle("Ouvrir/Fermer Ariére ~r~Gauche", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                        if Selected then
                            if not VM.V.argauche then
                                VM.V.argauche = true
                                SetVehicleDoorOpen(VM.V.VehPed, 2, false, false)
                            elseif VM.V.argauche then
                                VM.V.argauche = false
                                SetVehicleDoorShut(VM.V.VehPed, 2, false, false)
                                end
                            end
                        end)

                    RageUI.ButtonWithStyle("Ouvrir/Fermer Ariére ~g~Droite", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                        if Selected then
                            if not VM.V.ardroite then
                                VM.V.ardroite = true
                                SetVehicleDoorOpen(VM.V.VehPed, 3, false, false)
                            elseif VM.V.ardroite then
                                VM.V.ardroite = false
                                SetVehicleDoorShut(VM.V.VehPed, 3, false, false)
                                end
                            end
                        end)

                        RageUI.ButtonWithStyle("Ouvrir/Fermer ~g~Capot", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected) 
                            if Selected then
                                if not VM.V.capot then
                                    VM.V.capot = true
                                    SetVehicleDoorOpen(VM.V.VehPed, 4, false, false)
                                elseif VM.V.capot then
                                    VM.V.capot = false
                                    SetVehicleDoorShut(VM.V.VehPed, 4, false, false)
                                    end
                                end
                            end)
                    end,function()
                end)

                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'inventory'), true, true, true, function() 

                    RageUI.ButtonWithStyle("Items", "Accédez à la partit item de votre inventaire", {RightLabel = "→"}, true, function(Hovered, Actice, Selected)
                        if (Selected) then
                            end
                        end, RMenu:Get('inventory', 'inventaire'))

                    RageUI.ButtonWithStyle("Armes", "Accédez à la partit arme de votre inventaire", {RightLabel = "→"}, true, function(Hovered, Actice, Selected)
                        if (Selected) then
                            end
                        end, RMenu:Get('inventory', 'weapon'))
                    end, function() 
                end)

                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'inventaire'), true, true, true, function()
                    ESX.PlayerData = ESX.GetPlayerData()
                    for i = 1, #ESX.PlayerData.inventory do
                        if ESX.PlayerData.inventory[i].count > 0 then
                            RageUI.ButtonWithStyle('[~r~' ..ESX.PlayerData.inventory[i].count.. '~s~] ~b~- ~s~' ..ESX.PlayerData.inventory[i].label, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
                                if (Selected) then 
                                    VM.ItemSelected = ESX.PlayerData.inventory[i]
                                    end 
                                end, RMenu:Get('inventory', 'inventaire_use'))
                            end
                        end
                    end)

                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'weapon'), true, true, true, function() 
                    ESX.PlayerData = ESX.GetPlayerData()
                    for i = 1, #VM.WeaponData, 1 do
                        if HasPedGotWeapon(VM.Ped, VM.WeaponData[i].hash, false) then
                            local ammo = GetAmmoInPedWeapon(VM.Ped, VM.WeaponData[i].hash)
            
                            RageUI.ButtonWithStyle('[~r~' ..ammo.. '~s~] ~b~- ~s~' ..VM.WeaponData[i].label, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    VM.ItemSelected = VM.WeaponData[i]
                                end
                            end,RMenu:Get('inventory', 'weapon_use'))
                        end
                    end
                end)

                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'weapon_use'), true, true, true, function() 
                    RageUI.ButtonWithStyle('Donner des ~r~munitions', nil, {RightBadge = RageUI.BadgeStyle.Ammo}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            local post, quantity = CheckQuantity(KeyboardInput('Nombre de munitions', '180'), '', 8)
    
                            if post then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                                if closestDistance ~= -1 and closestDistance <= 3 then
                                    local closestPed = GetPlayerPed(closestPlayer)
                                    local pPed = GetPlayerPed(-1)
                                    local coords = GetEntityCoords(pPed)
                                    local x,y,z = table.unpack(coords)
                                    DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
    
                                    if IsPedOnFoot(closestPed) then
                                        local ammo = GetAmmoInPedWeapon(VM.Ped, VM.ItemSelected.hash)
    
                                        if ammo > 0 then
                                            if quantity <= ammo and quantity >= 0 then
                                                local finalAmmo = math.floor(ammo - quantity)
                                                SetPedAmmo(VM.Ped, VM.ItemSelected.name, finalAmmo)
    
                                                TriggerServerEvent('VMLife:Weapon_addAmmoToPedS', GetPlayerServerId(closestPlayer), VM.ItemSelected.name, quantity)
                                                ShowAboveRadarMessage('Vous avez donné x%s munitions à %s', quantity, GetPlayerName(closestPlayer))
                                                --RageUI.CloseAll()
                                            else
                                                ShowAboveRadarMessage('Vous ne possédez pas autant de munitions')
                                            end
                                        else
                                            ShowAboveRadarMessage("Vous n'avez pas de munition")
                                        end
                                    else
                                        ShowAboveRadarMessage('Vous ne pouvez pas donner des munitions dans un ~~r~véhicule~s~', VM.ItemSelected.label)
                                    end
                                else
                                    ShowAboveRadarMessage('Aucun joueur ~r~proche~s~ !')
                                end
                            else
                                ShowAboveRadarMessage('Nombre de munition ~r~invalid')
                            end
                        end
                    end)
                    
                    RageUI.ButtonWithStyle("Jeter ~g~l'arme", nil, {RightBadge = RageUI.BadgeStyle.Gun}, true, function(Hovered, Active, Selected)
                        if Selected then
                            if IsPedOnFoot(VM.Ped) then
                                TriggerServerEvent('esx:removeInventoryItem', 'item_weapon', VM.ItemSelected.name)
                                --RageUI.CloseAll()
                            else
                                ShowAboveRadarMessage("~r~Impossible~s~ de jeter l'armes dans un véhicule", VM.ItemSelected.label)
                            end
                        end
                    end)

                    if HasPedGotWeapon(VM.Ped, VM.ItemSelected.hash, false) then
                        RageUI.ButtonWithStyle("Donner ~g~l'arme", nil, {RightBadge = RageUI.BadgeStyle.Gun}, true, function(Hovered, Active, Selected)
                            if Selected then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                            if closestDistance ~= -1 and closestDistance <= 3 then
                                local closestPed = GetPlayerPed(closestPlayer)
                                local pPed = GetPlayerPed(-1)
                                local coords = GetEntityCoords(pPed)
                                local x,y,z = table.unpack(coords)
                                DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
    
                                if IsPedOnFoot(closestPed) then
                                    local ammo = GetAmmoInPedWeapon(VM.Ped, VM.ItemSelected.hash)
                                    TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_weapon', VM.ItemSelected.name, ammo)
                                    --seAll()
                                else
                                    ShowAboveRadarMessage('~r~Impossible~s~ de donner une arme dans un véhicule', VM.ItemSelected.label)
                                end
                            else
                                ShowAboveRadarMessage('Aucun joueur ~r~proche !')
                            end
                        end
                    end)
                end

                    end,function()
                end)


                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'inventaire_use'), true, true, true, function()
                    
                    RageUI.ButtonWithStyle("Utiliser ~g~l'item", nil, {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                           -- local NumerItems = KeyboardInput("Combiens d'items voulez-vous utiliser ?", "", 3)
                         if VM.ItemSelected.usable then
                             TriggerServerEvent('esx:useItem', VM.ItemSelected.name)
                            else
                                ShowAboveRadarMessage('l\'items n\'est pas utilisable', VM.ItemSelected.label)
                                end
                            end
                        end) 

                        RageUI.ButtonWithStyle("Jeter ~r~l'item", nil, {RightBadge = RageUI.BadgeStyle.Alert}, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                if VM.ItemSelected.canRemove then
                                    local post,quantity = CheckQuantity(KeyboardInput("Nombres d'items que vous voulez jeter", '', '', 100))
                                    if post then
                                        if not IsPedSittingInAnyVehicle(PlayerPed) then
                                            TriggerServerEvent('esx:removeInventoryItem', 'item_standard', VM.ItemSelected.name, quantity)
                                            --RageUI.CloseAll()
                                        end
                                    end
                                end
                            end
                        end)

                        RageUI.ButtonWithStyle("Donner ~g~l'items", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                local sonner,quantity = CheckQuantity(KeyboardInput("Nombres d'items que vous voulez donner", '', '', 100))
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                local pPed = GetPlayerPed(-1)
                                local coords = GetEntityCoords(pPed)
                                local x,y,z = table.unpack(coords)
                                DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
            
                                if sonner then
                                    if closestDistance ~= -1 and closestDistance <= 3 then
                                        local closestPed = GetPlayerPed(closestPlayer)
            
                                        if IsPedOnFoot(closestPed) then
                                                TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_standard', VM.ItemSelected.name, quantity)
                                                --RageUI.CloseAll()
                                            else
                                                ShowAboveRadarMessage("~∑~ Nombres d'items invalid !")
                                            end
                                        --else
                                            --ShowAboveRadarMessage("~∑~ Tu ne peux pas donner d'items dans un véhicule !", VM.ItemSelected.label
                                    else
                                        ShowAboveRadarMessage("∑ Aucun joueur ~r~Proche~n~ !")
                                        end
                                    end
                                end
                            end)
                        end,function()
                    end)
                ----------------------------------------------------------------------------------
                RageUI.IsVisible(RMenu:Get('inventory', 'portefeuille_billing'), true, true, true, function()
                    ESX.TriggerServerCallback('VInventory:billing', function(bills) VM.billing = bills end)

                    if #VM.billing == 0 then
                        RageUI.ButtonWithStyle("Aucune facture", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                            end
                        end)
                    end
                        
                    for i = 1, #VM.billing, 1 do
                    RageUI.ButtonWithStyle(VM.billing[i].label, nil, {RightLabel = '[~b~$' .. ESX.Math.GroupDigits(VM.billing[i].amount.."~s~] →")}, true, function(Hovered,Active,Selected)
                        if Selected then
                                ESX.TriggerServerCallback('esx_billing:payBill', function()
                                ESX.TriggerServerCallback('VInventory:billing', function(bills) VM.billing = bills end)
                                        end)
                                    end
                                end)
                            end
                      --  end)
                end,function()
            end)
                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'portefeuille'), true, true, true, function()

                    RageUI.ButtonWithStyle("Emplois", nil, {RightLabel = "~b~"..ESX.PlayerData.job.label .."~s~ →"}, true, function(Hovered, Active, Selected)
                        if Selected then
                        end
                    end, RMenu:Get('inventory', 'portefeuille_work'))

                    RageUI.ButtonWithStyle('Liquide', description, {RightLabel = "~g~$"..ESX.Math.GroupDigits(ESX.PlayerData.money.."~s~ →")}, true, function(Hovered, Active, Selected) 
                        if (Selected) then 
                            end 
                        end, RMenu:Get('inventory', 'portefeuille_money'))

                    RageUI.ButtonWithStyle('Facture', description, {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
                        if (Selected) then 
                            end 
                        end, RMenu:Get('inventory', 'portefeuille_billing'))
            
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'bank'  then
                            VM.bank = RageUI.ButtonWithStyle('Banque', description, {RightLabel = "~b~$"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."~s~")}, true, function(Hovered, Active, Selected) 
                                if (Selected) then 
                                        end 
                                    end)

                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'black_money'  then
                            VM.sale = RageUI.ButtonWithStyle('Non déclaré', description, {RightLabel = "~r~$"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."~s~ →")}, true, function(Hovered, Active, Selected) 
                                if (Selected) then 
                                        end 
                                    end, RMenu:Get('inventory', 'portefeuille_use'))

                                    RageUI.ButtonWithStyle(('~b~Montrer ~s~ça carte d\'identité'), nil, {}, true, function(Hovered, Active, Selected)
                                        if (Selected) then
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        
                                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                                            else
                                                ESX.ShowNotification(('Aucun joueur à proximité'))
                                            end
                                        end
                                    end)
            
                                    RageUI.ButtonWithStyle(('~g~Regarder ~s~ça carte d\'identité'), nil, {}, true, function(Hovered, Active, Selected)
                                        if (Selected) then
                                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                                        end
                                    end)

                                    RageUI.ButtonWithStyle(('~b~Montrer ~s~son permis de conduire'), nil, {}, true, function(Hovered, Active, Selected)
                                        if (Selected) then
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        
                                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
                                            else
                                                ESX.ShowNotification(('Aucun joueur à proximité'))
                                            end
                                        end
                                    end)
                        
                                    RageUI.ButtonWithStyle(('~g~Regarder ~s~son permis de conduire'), nil, {}, true, function(Hovered, Active, Selected)
                                        if (Selected) then
                                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                                        end
                                    end)
                        
                                    RageUI.ButtonWithStyle(('~b~Montrer ~s~son PPA'), nil, {}, true, function(Hovered, Active, Selected)
                                        if (Selected) then
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        
                                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
                                            else
                                                ESX.ShowNotification(('Aucun joueur à proximité'))
                                            end
                                        end
                                    end)

                                    RageUI.ButtonWithStyle(('~g~Regarder ~s~son PPA'), nil, {}, true, function(Hovered, Active, Selected)
                                        if (Selected) then
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        
                                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                                            end
                                        end
                                    end)


                                end
                            end
                        end
                    end
                end)
                ----------------------------------------------------------------------------------


                RageUI.IsVisible(RMenu:Get('inventory', 'portefeuille_use'), true, true, true, function() 

                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'black_money' then
                            RageUI.ButtonWithStyle("~r~Donner~s~ de l'argent non-déclaré", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, function(Hovered,Active,Selected)
                                if Selected then
                                    local black, quantity = CheckQuantity(KeyboardInput("Somme d'argent que vous voulez donner", '', '', 1000))
                                        if black then
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                                    if closestDistance ~= -1 and closestDistance <= 3 then
                                        local closestPed = GetPlayerPed(closestPlayer)
    
                                        if not IsPedSittingInAnyVehicle(closestPed) then
                                            TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                            --RageUI.CloseAll()
                                        else
                                           ShowAboveRadarMessage(_U('Vous ne pouvez pas donner ', 'de l\'argent dans un véhicles'))
                                        end
                                    else
                                       ShowAboveRadarMessage('Aucun joueur proche !')
                                    end
                                else
                                   ShowAboveRadarMessage('Somme invalid')
                                end
                            end
                        end)
    
                        RageUI.ButtonWithStyle("~r~Jeter~s~ de l'argent non declaré", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered, Active, Selected)
                            if Selected then
                                local black, quantity = CheckQuantity(KeyboardInput("Somme d'argent que vous voulez jeter", '', '', 1000))
                                if black then
                                    if not IsPedSittingInAnyVehicle(PlayerPed) then
                                        TriggerServerEvent('esx:removeInventoryItem', 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                       -- RageUI.CloseAll()
                                            else
                                               ShowAboveRadarMessage('Vous pouvez pas jeter', 'de l\'argent')
                                                end
                                            else
                                               ShowAboveRadarMessage('Somme Invalid')
                                            end
                                        end
                                    end)
                                end
                            end
                        end)
                ----------------------------------------------------------------------------------


                    RageUI.IsVisible(RMenu:Get('inventory', 'portefeuille_work'), true, true, true, function()
                        RageUI.ButtonWithStyle("Grade", nil, {RightLabel = "~b~"..ESX.PlayerData.job.grade_label .."~s~"}, true, function(Hovered, Active, Selected)
                            if Selected then
                            end
                        end)
    
                        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ademo' then
    
                        RageUI.ButtonWithStyle("Démisionner", nil, {RightBadge = RageUI.BadgeStyle.Alert, Color = { BackgroundColor = { 154, 0, 0, 0 } } }, true, function(Hovered, Active, Selected)
                            if Selected then
                                TriggerServerEvent("job:set", "unemployed")
                            end
                        end)
                    end

                        if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then

                        RageUI.ButtonWithStyle("Gestion d'entreprise", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                        end
                    end, RMenu:Get('inventory', 'boos'))
                else
                    RageUI.ButtonWithStyle("Gestion d'entreprise", nil, {RightBadge = RageUI.BadgeStyle.Lock}, false, function(Hovered, Active, Selected)
                            if Selected then
                                end
                            end)
                        end 
                    end, function()
                end)

                

                -- ----------------------------------------------------------------------------------
                 RageUI.IsVisible(RMenu:Get('inventory', 'boos'), true, true, true, function()
                     if societymoney ~= nil then
                         RageUI.Separator("[~b~"..ESX.PlayerData.job.label.."~s~] - [~g~"..societymoney.."$~s~]")
                     end

                 RageUI.ButtonWithStyle('~r~Recruter~s~ une personne proche de vous', nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                     if (Selected) then
                         if ESX.PlayerData.job.grade_name == 'boss' then
                             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                             if closestPlayer == -1 or closestDistance > 3.0 then
                                 ShowAboveRadarMessage('Aucun joueur proche')
                             else
                                 TriggerServerEvent('vInventory:Boss_recruterplayer', GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name, 0)
                             end
                         else
                             ShowAboveRadarMessage('Vous n\'avez pas les ~r~droits~w~')
                         end
                     end
                 end)
        
                 RageUI.ButtonWithStyle('~g~Virer~s~ une personne proche de vous', nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                     if (Selected) then
                         if ESX.PlayerData.job.grade_name == 'boss' then
                             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                             if closestPlayer == -1 or closestDistance > 3.0 then
                                 ShowAboveRadarMessage('Aucun joueur proche')
                             else
                                 TriggerServerEvent('vInventory:Boss_virerplayer', GetPlayerServerId(closestPlayer))
                             end
                         else
                             ShowAboveRadarMessage('Vous n\'avez pas les ~r~droits~w~')
                         end
                     end
                 end)
        
                 RageUI.ButtonWithStyle('~p~Promouvoir~s~ une personne proche de vous', nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                         if ESX.PlayerData.job.grade_name == 'boss' then
                             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                             if closestPlayer == -1 or closestDistance > 3.0 then
                                 ShowAboveRadarMessage('Aucun joueur proche')
                             else
                                 TriggerServerEvent('vInventory:Boss_promouvoirplayer', GetPlayerServerId(closestPlayer))
                         end
                         else
                             ShowAboveRadarMessage('Vous n\'avez pas les ~r~droits~w~')
                         end
                     end
                 end)
        
                 RageUI.ButtonWithStyle('~g~Destituer~s~ une personne proche de vous', nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                     if (Selected) then
                         if ESX.PlayerData.job.grade_name == 'boss' then
                             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                             if closestPlayer == -1 or closestDistance > 3.0 then
                                     ShowAboveRadarMessage('Aucun joueur proche')
                                 else
                                TriggerServerEvent('vInventory:Boss_destituerplayer', GetPlayerServerId(closestPlayer))
                                     end
                                 else
                                     ShowAboveRadarMessage('Vous n\'avez pas les ~r~droits~w~')
                                 end
                             end
                         end)
                     end, function()
                 end)
                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'portefeuille_money'), true, true, true, function()

                    RageUI.ButtonWithStyle("~b~Donner~s~ de l'argent liquide", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, function(Hovered,Active,Selected)
                        if Selected then
                            local black, quantity = CheckQuantity(KeyboardInput("Somme d'argent que vous voulez donner", '', '', 1000))
                                if black then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                            if closestDistance ~= -1 and closestDistance <= 3 then
                                local closestPed = GetPlayerPed(closestPlayer)

                                if not IsPedSittingInAnyVehicle(closestPed) then
                                    TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_money', ESX.PlayerData.money, quantity)
                                    --RageUI.CloseAll()
                                else
                                   ShowAboveRadarMessage(_U('Vous ne pouvez pas donner ', 'de l\'argent dans un véhicles'))
                                end
                            else
                               ShowAboveRadarMessage('Aucun joueur proche !')
                            end
                        else
                           ShowAboveRadarMessage('Somme invalid')
                        end
                    end
                end)

                RageUI.ButtonWithStyle("~b~Jeter~s~ de l'argent liquide", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered, Active, Selected)
                    if Selected then
                        local black, quantity = CheckQuantity(KeyboardInput("Somme d'argent que vous voulez jeter", '', '', 1000))
                        if black then
                            if not IsPedSittingInAnyVehicle(PlayerPed) then
                                TriggerServerEvent('esx:removeInventoryItem', 'item_money', ESX.PlayerData.money, quantity)
                                --RageUI.CloseAll()
                                    else
                                       ShowAboveRadarMessage('Vous pouvez pas jeter', 'de l\'argent')
                                        end
                                    else
                                       ShowAboveRadarMessage('Somme Invalid')
                                    end
                                end
                            end)
                        end)

                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'menu'), true, true, true, function()
                    local self = RMenu:Get('inventory', 'menu')
                    self.EnableMouse = true

                    RageUI.Separator("~r~↓~g~↓~b~↓ ~s~Choisi ta couleur préférée ! ~r~↓~g~↓~b~↓", nil, {}, true, function(_, _, _)
                    end)
                
                    RageUI.Progress("Rouge", menuColor[1], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                        menuColor[1] = Color
                        ReloadColor()
                    end)
                
                    RageUI.Progress("Vert", menuColor[2], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                        menuColor[2] = Color
                        ReloadColor()
                    end)
                
                    RageUI.Progress("Bleu", menuColor[3], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                        menuColor[3] = Color
                        ReloadColor()
                    end)
                
                    RageUI.ButtonWithStyle("Sauvegarder la couleur", nil, { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                        if Selected then
                            SetResourceKvpInt("menuR", menuColor[1])
                            SetResourceKvpInt("menuG", menuColor[2])
                            SetResourceKvpInt("menuB", menuColor[3])
                            ReloadColor()
                            end
                        end)
                    end, function()
                end)
                ----------------------------------------------------------------------------------
                RageUI.IsVisible(RMenu:Get('inventory', 'sante'), true, true, true, function()
                    TriggerEvent("updateStatus",VM.AdemoFaim,VM.AdemoSoif)
                    RageUI.SliderProgress("Faim", VM.AdemoFaim, 100, nil, {ProgressColor = {R = 0, G = 255, B = 124, A = 200},ProgressBackgroundColor = {R = 255, G = 255, B = 255, A = 200} }, true, function(Hovered, Active, Selected, Index)
                    end)

                    RageUI.SliderProgress("Hydratation", VM.AdemoSoif, 100, nil, {ProgressColor = {R = 0, G = 212, B = 255, A = 200},ProgressBackgroundColor = {R = 255, G = 255, B = 255, A = 200} }, true, function(Hovered, Active, Selected, Index)
                    end)
                     if VM.AdemoFaim < 0 or VM.AdemoSoif < 0 then
                            SetEntityHealth(GetPlayerPed(-1),0)
                        end
                    end,function()
                end)

                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'divers'), true, true, true, function()

                    RageUI.Checkbox("Afficher / Désactiver la map", description, VM.map,{},function(Hovered,Ative,Selected,Checked)
                        if Selected then
                            VM.map = Checked
                            if Checked then
                                DisplayRadar(true)
                            else
                                DisplayRadar(false)
                            end
                        end
                    end)

                    local ragdolling = false
                    RageUI.ButtonWithStyle('Dormir / Se Reveiller', description, {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
                        if (Selected) then
                            ragdolling = not ragdolling
                            while ragdolling do
                             Wait(0)
                            local myPed = GetPlayerPed(-1)
                            SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                            ResetPedRagdollTimer(myPed)
                            AddTextEntry(GetCurrentResourceName(), ('Appuyez sur ~INPUT_JUMP~ pour vous ~b~Réveillé'))
                            DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
                            ResetPedRagdollTimer(myPed)
                            if IsControlJustPressed(0, 22) then 
                            break
                        end
                    end
                end
            end)

             RageUI.ButtonWithStyle("Menu ~g~visuel", "Pour modifier votre visuel", {RightLabel = "→"}, true, function(Hovered, Active,Selected)
                    if Selected then
                         end
                    end, RMenu:Get('inventory', 'visual'))
                end)


                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'visual'), true, true, true, function()

                    RageUI.Checkbox("Vue & lumières améliorées", description, VM.visual, {}, function(Hovered, Selected, Active, Checked) 
                        if Selected then 
                            VM.visual = Checked
                            if Checked then
                                SetTimecycleModifier('tunnel')
                            else
                                SetTimecycleModifier('')
                            end
                        end 
                    end)

                    RageUI.Checkbox("Vue & lumières améliorées ~r~2", description, VM.visual4, {}, function(Hovered, Selected, Active, Checked) 
                        if Selected then 
                            VM.visual4 = Checked
                            if Checked then
                                SetTimecycleModifier('CS3_rail_tunnel')
                            else
                                SetTimecycleModifier('')
                            end
                        end 
                    end)

                    
                    RageUI.Checkbox("Vue & lumières améliorées ~g~3", description, VM.visual9, {}, function(Hovered, Selected, Active, Checked) 
                        if Selected then 
                            VM.visual9 = Checked
                            if Checked then
                                SetTimecycleModifier('MP_lowgarage')
                            else
                                SetTimecycleModifier('')
                            end
                        end 
                    end)

                    RageUI.Checkbox("Vue lumineux", description, VM.visual7, {}, function(Hovered, Selected, Active, Checked) 
                        if Selected then 
                            VM.visual7 = Checked
                            if Checked then
                                SetTimecycleModifier('rply_vignette_neg')
                            else
                                SetTimecycleModifier('')
                            end
                        end 
                    end)

                    RageUI.Checkbox("Vue lumineux ~b~2", description, VM.visual10, {}, function(Hovered, Selected, Active, Checked) 
                        if Selected then 
                            VM.visual10 = Checked
                            if Checked then
                                SetTimecycleModifier('rply_saturation_neg')
                            else
                                SetTimecycleModifier('')
                            end
                        end 
                    end)
        
                    RageUI.Checkbox("Couleurs amplifiées", description, VM.visual2, {}, function(Hovered, Selected, Active, Checked) 
                        if Selected then 
                            VM.visual2 = Checked
                            if Checked then
                                SetTimecycleModifier('rply_saturation')
                            else
                                SetTimecycleModifier('')
                            end
                        end 
                    end)
        
                    RageUI.Checkbox("Noir & blancs", description, VM.visual3, {}, function(Hovered, Selected, Active, Checked) 
                        if Selected then 
                            VM.visual3 = Checked
                            if Checked then
                                SetTimecycleModifier('rply_saturation_neg')
                            else
                                SetTimecycleModifier('')
                            end
                        end 
                    end)

                    RageUI.Checkbox("Visual 1", description, VM.visual5, {}, function(Hovered, Selected, Active, Checked) 
                        if Selected then 
                            VM.visual5 = Checked
                            if Checked then
                                SetTimecycleModifier('yell_tunnel_nodirect')
                            else
                                SetTimecycleModifier('')
                            end
                        end 
                    end)

                    RageUI.Checkbox("Blanc", description, VM.visual6, {}, function(Hovered, Selected, Active, Checked) 
                        if Selected then 
                            VM.visual6 = Checked
                            if Checked then
                                SetTimecycleModifier('rply_contrast_neg')
                            else
                                SetTimecycleModifier('')
                            end
                        end 
                    end)

                    RageUI.Checkbox("Dégats", description, VM.visual8, {}, function(Hovered, Selected, Active, Checked) 
                        if Selected then 
                            VM.visual8 = Checked
                            if Checked then
                                SetTimecycleModifier('rply_vignette')
                            else
                                SetTimecycleModifier('')
                            end
                        end 
                    end)
                    end,function()
                end)


                ----------------------------------------------------------------------------------


                RageUI.IsVisible(RMenu:Get('inventory', 'utils'), true, true, true, function()
                    players = {}
                    for _, player in ipairs(GetActivePlayers()) do
                        local ped = GetPlayerPed(player)
                        table.insert( players, player )
                    end

                    RageUI.ButtonWithStyle("Nombres de Citoyens :", description, {RightLabel = "[~r~ "..#players.." ~s~] joueur(s) en ~g~ligne"}, true, function(Hovered, Active, Selected) 
                        if (Selected) then 
                        end 
                    end)

                    RageUI.ButtonWithStyle("Faire un report", description, {RightLabel = "→→"}, true, function(Hovered, Active, Selected) 
                        if (Selected) then 
                            local report = KeyboardInput("", '', '', 1000)
                            ExecuteCommand("report " ..report)
                        end 
                    end)

                    RageUI.ButtonWithStyle('Touche Serveur', description, {RightLabel = "→→"}, true, function(Hovered, Active, Selected) 
                        if (Selected) then 
                            end 
                        end, RMenu:Get('inventory', 'tserv'))

                        RageUI.ButtonWithStyle("Rejoindre le ~b~Discord", description, {RightLabel = "→→"}, true, function(Hovered, Active, Selected) 
                            if (Selected) then 
                                ExecuteCommand("discord")
                            end 
                        end)

                        RageUI.ButtonWithStyle("Prendre en ~r~Otage", description, {RightLabel = "→→"}, true, function(Hovered, Active, Selected) 
                            if (Selected) then 
                                ExecuteCommand("otage")
                            end 
                        end)

                        RageUI.ButtonWithStyle("Prendre sur le ~b~Dos", description, {RightLabel = "→→"}, true, function(Hovered, Active, Selected) 
                            if (Selected) then 
                                ExecuteCommand("carry")
                            end 
                        end)

                    end,function()
                end)

----------------------------

RageUI.IsVisible(RMenu:Get('inventory', 'tserv'), true, true, true, function()
    players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert( players, player )
    end

    RageUI.ButtonWithStyle("Ouvrir/Fermer Téléphone :", description, {RightLabel = "~b~F1"}, true, function(Hovered, Active, Selected) 
        if (Selected) then 
        end 
    end)

    RageUI.ButtonWithStyle("Gestion Carte SIM :", description, {RightLabel = "~b~F2"}, true, function(Hovered, Active, Selected) 
        if (Selected) then 
        end 
    end)

    RageUI.ButtonWithStyle("Gestion Animations :", description, {RightLabel = "~b~F3"}, true, function(Hovered, Active, Selected) 
        if (Selected) then 
        end 
    end)

    RageUI.ButtonWithStyle("Ouvrir/Fermer Radio :", description, {RightLabel = "~b~F10"}, true, function(Hovered, Active, Selected) 
        if (Selected) then 
        end 
    end)

    RageUI.ButtonWithStyle("Screenshot :", description, {RightLabel = "~b~F11"}, true, function(Hovered, Active, Selected) 
        if (Selected) then 
        end 
    end)

    RageUI.ButtonWithStyle("Lever les mains en l'air :", description, {RightLabel = "~b~X"}, true, function(Hovered, Active, Selected) 
        if (Selected) then 
        end 
    end)

    RageUI.ButtonWithStyle("Pointer du doigt :", description, {RightLabel = "~b~B"}, true, function(Hovered, Active, Selected) 
        if (Selected) then 
        end 
    end)

    RageUI.ButtonWithStyle("Tablette Police(Only) :", description, {RightLabel = "~b~DEL"}, true, function(Hovered, Active, Selected) 
        if (Selected) then 
        end 
    end)

    end,function()
end)

                ----------------------------------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('inventory', 'clothesbase'), true, true, true, function()
                    RageUI.ButtonWithStyle("Vetements", nil, {RightLabel = "→"},true, function()
                    end, RMenu:Get('inventory', 'clothes'))
                    RageUI.ButtonWithStyle("Accessories", nil, {RightLabel = "→"},true, function()
                    end, RMenu:Get('inventory', 'accessories'))

                  end)
                  
                  Wait(0)
                end
            end)
        end
    end

              
     --[[               RageUI.IsVisible(RMenu:Get('inventory', 'accessories'), true, true, true, function()
                      for i = 1, #VM.Accessories, 1 do
                              RageUI.Button(_U(('accessories_%s'):format(VM.Accessories[i])), nil, {}, true, {
                                  onSelected = function()
                                      accessories(VM.Accessories[i], plyPed)
                                  end,
                              })
                       end
                  end)



                Wait(0)
            end
        end)
    end
end]]

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1,166) then
            openMenu()
           -- RageUI.Visible(RMenu:Get('inventory', 'main'), not RageUI.Visible(RMenu:Get('inventory', 'main')))   
        end
    end
end)
