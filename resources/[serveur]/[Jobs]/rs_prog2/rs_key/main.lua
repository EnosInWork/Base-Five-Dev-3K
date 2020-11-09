local OwnedVehTable = {}
SetAudioFlag("LoadMPData", 1)

Citizen.CreateThread(function()
    TriggerServerEvent("RS_KEY:GetRegisteredKeys")
end)

RegisterNetEvent("RS_KEY:GetRegisteredKeys")
AddEventHandler("RS_KEY:GetRegisteredKeys", function(keys)
    OwnedVehTable = keys
end)

RegisterNetEvent("RS_KEY:GiveKey")
AddEventHandler("RS_KEY:GiveKey", function(plaque)
    local exist = false
    for _,v in pairs(OwnedVehTable) do
        if v == plaque then
            exist = true
            break
        end
    end
    if not exist then
        table.insert(OwnedVehTable, plaque)
        PlaySoundFrontend(-1, "Select_Placed_Prop", "DLC_Dmod_Prop_Editor_Sounds", 0)
        Popup("~g~Tu à reçu les clés du véhicule "..plaque)
        TriggerServerEvent("RS_KEY:RegisterKey", OwnedVehTable)
    end
end)



-- Opti pour évité que ça spam

function GetNearestPlate()
    local NearVeh = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)))
    local NearPlate = GetVehicleNumberPlateText(NearVeh)
    local NearStatus = IsNear(NearVeh)
    return NearPlate, NearVeh, NearStatus
end

function IsNear(veh)
    local pPed = GetPlayerPed(-1)
    local pCoords = GetEntityCoords(pPed)
    local vCoords = GetEntityCoords(veh)
    local dst = GetDistanceBetweenCoords(pCoords, vCoords, true)
    if dst <= 10.0 then
        return true
    else
        return false
    end
end


-- Controls
local ClosedVehicle = {}


Citizen.CreateThread(function()
    --DecorRegister("lock_status", 2)
    --DecorRegisterLock()
    while true do
        Wait(0)
        DisableControlAction(0, 303, true)
        if IsDisabledControlJustPressed(0, 303) then

        local dict = "anim@mp_player_intmenu@key_fob@"
		RequestAnimDict(dict)
		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end	

		--vehicleKeys = CreateObject(GetHashKey("prop_cuff_keys_01"), 0, 0, 0, true, true, true) -- creates object
	 	--AttachEntityToEntity(vehicleKeys, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.11, 0.03, -0.03, 90.0, 0.0, 0.0, true, true, false, true, 1, true) -- object is attached to right hand
		TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)

            local NearPlate, NearVeh, Near = GetNearestPlate()
            if Near then
                local found = false
                for k,v in pairs(OwnedVehTable) do
                    if v == NearPlate then
                        found = true
                        local players = {}
                        for k,v in pairs(GetActivePlayers()) do
							table.insert(players, GetPlayerServerId(v))
						end
                        if GetVehicleDoorLockStatus(NearVeh) == 2 then
                            local netVeh = NetworkGetNetworkIdFromEntity(NearVeh)
                            TriggerServerEvent("RS_KEY:LockVehicle", netVeh, false, players)
                            exports['rs_notif']:Notify('true', 'Véhicule ouvert') -- Retirer cette ligne si vous l'utilisé sur votre serveur
                            --LockVehicle(NearVeh, false)
                        else
                            local netVeh = NetworkGetNetworkIdFromEntity(NearVeh)
                            TriggerServerEvent("RS_KEY:LockVehicle", netVeh, true, players)
                            exports['rs_notif']:Notify('false', 'Véhicule fermé') -- Retirer cette ligne si vous l'utilisé sur votre serveur
                            --LockVehicle(NearVeh, true)
                        end
                    end
                end
                if not found then
                    Popup("~r~Tu n'a pas les clés du véhicule.")
                end
            end
        end

        --if DoesEntityExist(vehicleKeys) then
		--	Wait(800)
        --    DeleteEntity(vehicleKeys)
	    --end
        
    end
end)

-- Not Used for now
--Citizen.CreateThread(function()
--    while true do
--        Wait(3000)
--        local _c = 0
--        for veh in EnumerateVehicles() do
--            --if DecorExistOn(veh, "lock_status") and DecorGetBool(veh, "lock_status") then
--            --    --print(GetVehicleNumberPlateText(veh).." - fermé")
--            --    SetVehicleDoorsLocked(veh, 2)
--            --    SetVehicleDoorsLockedForAllPlayers(veh, 1)
--            --else
--            --    --print(GetVehicleNumberPlateText(veh).." - Ouvert")
--            --    SetVehicleDoorsLocked(veh, 1)
--            --    SetVehicleDoorsLockedForAllPlayers(veh, 0)
--            --end
--            SetEntityAsMissionEntity(veh, 1, 1)
--            _c = (_c + 1) % 10
--            if _c == 0 then
--                Wait(0)
--            end
--        end
--    end
--end)


function Popup(txt)
	ClearPrints()
	SetNotificationBackgroundColor(140)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(txt)
	DrawNotification(false, true)
end

RegisterNetEvent("RS_KEY:LockVehicle")
AddEventHandler("RS_KEY:LockVehicle", function(netVeh, status)
    LockVehicle(NetworkGetEntityFromNetworkId(netVeh), status)
end)

function LockVehicle(veh, status)
    if not status then
        
        SetVehicleDoorsLocked(veh, 1)
        SetVehicleDoorsLockedForAllPlayers(veh, 0)
        SetVehicleLights(veh, 2)
        SoundVehicleHornThisFrame(veh)
        Wait(200)
        SetVehicleLights(veh, 0)
        Wait(200)
        SetVehicleLights(veh, 2)
        SoundVehicleHornThisFrame(veh)
        Wait(400)
        SetVehicleLights(veh, 0)
        while GetVehicleDoorLockStatus(veh) == 2 do
            Wait(100)
            SetVehicleDoorsLocked(veh, 1)
            SetVehicleDoorsLockedForAllPlayers(veh, 0)
        end
    else
        
        SetVehicleDoorsLocked(veh, 2)
        SetVehicleDoorsLockedForAllPlayers(veh, 1)
        SetVehicleLights(veh, 2)
        SoundVehicleHornThisFrame(veh)
        Wait(200)
        SetVehicleLights(veh, 0)
        Wait(200)
        SetVehicleLights(veh, 2)
        SoundVehicleHornThisFrame(veh)
        Wait(400)
        SetVehicleLights(veh, 0)
        while GetVehicleDoorLockStatus(veh) == 1 do
            Wait(100)
            SetVehicleDoorsLocked(veh, 2)
            SetVehicleDoorsLockedForAllPlayers(veh, 1)
        end
    end
end