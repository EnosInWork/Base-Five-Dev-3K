
local Percent_ = 0.0

vMenu.Add('val', 'bank2', ValUI.CreateMenu("Guichet", "Liste"))
vMenu.Add('val', 'bank3', ValUI.CreateSubMenu(vMenu:Get('val', 'bank2'), "Documents", "~b~Compte"))
vMenu.Add('val', 'chargement2', ValUI.CreateSubMenu(vMenu:Get('val', 'bank2'), "Documents", "~b~Compte"))

Citizen.CreateThread(function()
    while true do

        ValUI.IsVisible(vMenu:Get('val', 'bank2'), true, true, true, function()
            
            ValUI.Button("Crée un compte", nil, {RightLabel = ">"}, true, function(Hovered, Active, Selected)
            end, vMenu:Get('val', 'bank3'))
            
        end)

        ValUI.IsVisible(vMenu:Get('val', 'bank3'), true, true, true, function()
            

            ValUI.CenterButton("~s~↓ Identité ~s~↓", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
            end)

            ValUI.Button("Nom", nil, {RightLabel = nameidentity}, true, function(Hovered, Active, Selected)
                if (Selected) then 
                    local nameInput = KeyboardInput("", "", 10)

                    if tostring(nameInput) == nil then
        
                        return false
        
                    else
        
                        nameidentity = (tostring(nameInput))
        
                    end
                end    
            end)

            ValUI.Button("Prénom", nil, {RightLabel = prenomidentity}, true, function(Hovered, Active, Selected)
                if (Selected) then 
                    local prenomInput = KeyboardInput("", "", 10)
    
                    if tostring(prenomInput) == nil then
        
                        return false
        
                    else
        
                        prenomidentity = (tostring(prenomInput))
        
                    end
                end
            end)

            ValUI.CenterButton("~s~↓ Date de naissance ~s~↓", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
            end)

            ValUI.Button("Jour", nil, {RightLabel = jour}, true, function(Hovered, Active, Selected)
                if (Selected) then 
                    local jourInput = KeyboardInput("", "", 10)
    
                    if tostring(jourInput) == nil then
        
                        return false
        
                    else
        
                        jour = (tostring(jourInput))
        
                        TriggerServerEvent("nIdentity:UpdateTaille", tostring(jourInput))
        
                    end
                end
            end)

            ValUI.Button("Mois", nil, {RightLabel = mois}, true, function(Hovered, Active, Selected)
                if (Selected) then 
                    local moisInput = KeyboardInput("", "", 10)
    
                    if tostring(moisInput) == nil then
        
                        return false
        
                    else
        
                        mois = (tostring(moisInput))
        
                        TriggerServerEvent("nIdentity:UpdateTaille", tostring(moisInput))
        
                    end
                end
            end)

            ValUI.Button("Année", nil, {RightLabel = annee}, true, function(Hovered, Active, Selected)
                if (Selected) then 
                    local anneeInput = KeyboardInput("", "", 10)
    
                    if tostring(anneeInput) == nil then
        
                        return false
        
                    else
        
                        annee = (tostring(anneeInput))
        
                        TriggerServerEvent("nIdentity:UpdateTaille", tostring(anneeInput))
        
                    end
                end
            end)

            ValUI.Button("Crée le compte", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
            end, vMenu:Get('val', 'chargement2'))
            
        end)

        ValUI.IsVisible(vMenu:Get('val', 'chargement2'), true, true, true, function()
            ValUI.PercentagePanel(Percent_ or 0.0, "Création du compte (" .. math.floor(Percent_*100) .. "%)", "", "", function(Hovered, Active, Percent)
                if Percent_ < 1.0 then
                    Percent_ = Percent_+0.001
                else
                    ValUI:CloseAll()
                    ESX.ShowNotification('Création du compte ~g~acquis~s~.')
                    ESX.ShowNotification('Voici votre ~b~Carte bancaire~s~.')
                    TriggerServerEvent('bank:carte')
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                end
            end)
        end)

        Citizen.Wait(0)
    end
end)



local creacompte = {
	{x=251.59, y=221.51, z=106.29},
}  

local positionCentral = {
    {x = 252.18, y = 223.13, z = 106.28}
}

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_movprem_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_m_movprem_01", 252.18, 223.13, 105.28, 150.00, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
end)

-- Blip

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	for i = 1, #positionCentral, 1 do
        local bBlip = AddBlipForCoord(positionCentral[i].x, positionCentral[i].y, positionCentral[i].z)
        SetBlipSprite (bBlip, 277)
		SetBlipDisplay(bBlip, 4)
		SetBlipScale  (bBlip, 0.8)
		SetBlipColour (bBlip, 2)
        SetBlipAsShortRange(bBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Banque Principale")
        EndTextCommandSetBlipName(bBlip)
	end
end)



RegisterNetEvent("menucentral")
AddEventHandler("menucentral", function()
    FreezeEntityPosition(GetPlayerPed(-1), true)
    ValUI.Visible(vMenu:Get('val', 'bank2'), not ValUI.Visible(vMenu:Get('val', 'bank2')))
end)
    


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(creacompte) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, creacompte[k].x, creacompte[k].y, creacompte[k].z)

 
            if dist <= 0.6 then
                
                ValUI.Text({
                    message = "~b~E~w~ Crée un compte avec le ~b~Directeur",
                    time_display = 1
                })
            
                if IsControlJustPressed(1,51) then
                    TriggerServerEvent('bank:menucentral')
                end
            end
        end
    end
end)