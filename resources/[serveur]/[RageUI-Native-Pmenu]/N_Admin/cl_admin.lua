ESX = nil local PlayerData = {} local isPlayerSpawned = false local showcoord = false Config = {} local playerGroup = nil local ListPlayer = {} local ListItem = {} Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end while ESX.GetPlayerData().job == nil do Citizen.Wait(10) end ESX.PlayerData = ESX.GetPlayerData() --[[ while playerGroup == nil do ESX.TriggerServerCallback('N_admin:getgroupadmin', function(group) playerGroup = group end) Citizen.Wait(10) end ]] end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

local banjoueur = {}
			
Admin = {
    actuellementspec = false,
    godmod = false,
    noclip = false,
    supersaut = false,
    staminainfini = false,
    fastrun = false,
    showcoords = false,
    showcrosshair = false
}
function retournercar()
    local pPed = GetPlayerPed(-1)
    posped = GetEntityCoords(pPed)
    carspawndep = GetClosestVehicle(posped['x'], posped['y'], posped['z'], 10.0,0,70)
	if carspawndep ~= nil then
		platecarspawndep = GetVehicleNumberPlateText(carspawndep)
	end
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    playerCoords = playerCoords + vector3(0, 2, 0)
	SetEntityCoords(carspawndep, playerCoords)
end
local godmodec = true
function playergodmod()
	godmodec = not godmodec
	local pPed = GetPlayerPed(-1)
	if not godmodec then
		SetEntityInvincible(pPed, true)
		ESX.DrawMissionText("~g~Invincible", 99999999999999999999) 
	elseif godmodec then
		SetEntityInvincible(pPed, false)
		ESX.DrawMissionText("", 0)
	end
end
local invisible = true
function playerinvisible()
	invisible = not invisible
	local pPed = GetPlayerPed(-1)
	if not invisible then
		SetEntityVisible(pPed, false, false)
		ESX.DrawMissionText("~g~Invisible", 99999999999999999999)  
	elseif invisible then
		SetEntityVisible(pPed, true, false)
		ESX.DrawMissionText("", 0)
	end
end

function KeyboardInput69(TextEntry, ExampleText, MaxStringLength)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end


local noclip = false
local noclip_speed = 0.5

function playernoclip()
	noclip = not noclip
	local ped = GetPlayerPed(-1)
	if noclip then -- activé
		SetEntityVisible(ped, false, false)
		ESX.DrawMissionText("~g~Noclip activé", 1250)
	else -- désactivé
		SetEntityVisible(ped, true, false)
		ESX.DrawMissionText("~r~Noclip désactivé", 1250)
	end
end

function getPosition()
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
	return x,y,z
end
function getCamDirection()
	local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
	local pitch = GetGameplayCamRelativePitch()
	local x = -math.sin(heading*math.pi/180.0)
	local y = math.cos(heading*math.pi/180.0)
	local z = math.sin(pitch*math.pi/180.0)
	local len = math.sqrt(x*x+y*y+z*z)
	if len ~= 0 then
		x = x/len
		y = y/len
		z = z/len
	end
	return x,y,z
end

function isNoclip()
	return noclip
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if noclip then
			local ped = GetPlayerPed(-1)
			local x,y,z = getPosition()
			local dx,dy,dz = getCamDirection()
			local speed = noclip_speed
			SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
		if IsControlPressed(0,32) then -- MOVE UP
			x = x+speed*dx
			y = y+speed*dy
			z = z+speed*dz
		end
		if IsControlPressed(0,21) then -- Speed
			local speed = 5.5
			x = x+speed*dx
			y = y+speed*dy
			z = z+speed*dz
		end
		if IsControlPressed(0,269) then -- MOVE DOWN
			x = x-speed*dx
			y = y-speed*dy
			z = z-speed*dz
		end
		SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputvehicle == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputvehicle = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputvehicle = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputvehicle = 0
			end
		end
		if inputvehicle == 2 then
		local vehicleidd = GetOnscreenKeyboardResult()
				local car = GetHashKey(vehicleidd)
				Citizen.CreateThread(function()
					Citizen.Wait(10)
					RequestModel(car)
					while not HasModelLoaded(car) do
						Citizen.Wait(0)
					end
                    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
					veh = CreateVehicle(car, x,y,z, 0.0, true, false)
					SetEntityVelocity(veh, 2000)
					SetVehicleOnGroundProperly(veh)
					SetVehicleHasBeenOwnedByPlayer(veh,true)
					local id = NetworkGetNetworkIdFromEntity(veh)
					SetNetworkIdCanMigrate(id, true)
					SetVehRadioStation(veh, "OFF")
					SetPedIntoVehicle(GetPlayerPed(-1),  veh,  -1)
					--Notify("Véhicule spawn, bonne route")
				end)
        inputvehicle = 0
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputplate == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputplate = 0
			elseif UpdateOnscreenKeyboard() == 1 then
				inputplate = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputplate = 0
			end
		end
		if inputplate == 2 then
		local vehicleplate = GetOnscreenKeyboardResult()
				Citizen.CreateThread(function()
					Citizen.Wait(10)
					SetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false), vehicleplate)
				end)
			inputplate = 0
		end
	end
end)
local deleteveh = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if deleteveh then
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed, false)
			local vehicle   = ESX.Game.GetVehicleInDirection()
			if IsPedInAnyVehicle(playerPed, true) then
				vehicle = GetVehiclePedIsIn(playerPed, false)
			end
			local entity = vehicle
			NetworkRequestControlOfEntity(entity)
			SetEntityAsMissionEntity(entity, true, true)
			Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
			if (DoesEntityExist(entity)) then
				DeleteEntity(entity)
			end
		end
	end
end)
function changeplayerskin()
	CloseMenu(force)
	Citizen.Wait(100)
	TriggerEvent('esx_skin:openSaveableMenu', source)
end
function KeyboardInput1(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, "", inputText, "", "", "", maxLength)
	blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(10)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
		blockinput = false
        return result
    else
        Citizen.Wait(500)
		blockinput = false
        return nil
    end
end
function agivemoney()
	local amount = KeyboardInput1("N_BOX_AMOUNT", "", "", 8)
	if amount ~= nil then
		amount = tonumber(amount)
		if type(amount) == 'number' then
			TriggerServerEvent('N_admin:givecash', amount) 
		end
	end
end
function agivemoneybank()
	local amount = KeyboardInput1("N_BOX_AMOUNT", "", "", 8)
	if amount ~= nil then
		amount = tonumber(amount)
		if type(amount) == 'number' then
			TriggerServerEvent('N_admin:givecashbank', amount)
		end
	end
end
function agivemoneysale()
	local amount = KeyboardInput1("N_BOX_AMOUNT", "", "", 8)
	if amount ~= nil then
		amount = tonumber(amount)
		if type(amount) == 'number' then
			TriggerServerEvent('N_admin:givecashsale', amount)
		end
	end
end
function tpplayermarker()
			local playerPed = GetPlayerPed(-1)
			local WaypointHandle = GetFirstBlipInfoId(8)
			if DoesBlipExist(WaypointHandle) then
				local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, WaypointHandle, Citizen.ResultAsVector())
				--SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, coord.z, false, false, false, true)
				SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, -199.5, false, false, false, true)
				ESX.DrawMissionText("Téléporté sur le marqueur !")
			else
				ESX.DrawMissionText("Pas de marqueur sur la carte !")
			end
		end
	
function admin_heal_player()
	local plyId = KeyboardInput1("N_BOX_ID", "", "", 8)
	if plyId ~= nil then
		plyId = tonumber(plyId)
		if type(plyId) == 'number' then
			TriggerServerEvent('esx_ambulancejob:revive', plyId)
		end
	end
end
function tptoplayer()
	local plyId = KeyboardInput1("N_BOX_ID", "", "", 8)
	if plyId ~= nil then
		plyId = tonumber(plyId) 
		if type(plyId) == 'number' then
			local targetPlyCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(plyId)))
			SetEntityCoords(plyPed, targetPlyCoords)
		end
	end
end
RegisterNetEvent('N_admin:bringplayer')
AddEventHandler('N_admin:bringplayer', function(plyPedCoords)
	SetEntityCoords(plyPed, plyPedCoords)
end)

function soignernehco()
TriggerEvent('esx_basicneeds:healPlayer', plyId)
end

function messagenehco()
	local raison = KeyboardInput69("Entrez votre message","", 1000)
	local plyId = KeyboardInput1("N_BOX_ID", "ID du joueur :", "", 8)
	local valuejoueur = GetPlayerServerId(v)
	local namejoueur = GetPlayerName(v)
	local joueurPed = GetPlayerPed(v)
	if plyId and raison ~= nil then
		raison = tostring(raison)
		plyId = tonumber(plyId)

		if type(raison, plyId) == 'string' then
			TriggerServerEvent("Nehco:Message", plyId, raison)
		end
	end
end

function tpplayertome()
	local plyId = KeyboardInput1("N_BOX_ID", "ID du joueur :", "", 8)
	if plyId ~= nil then
		plyId = tonumber(plyId)
		if type(plyId) == 'number' then
			local plyPedCoords = GetEntityCoords(plyPed)
			TriggerServerEvent('N_admin:bringplayer', plyId, plyPedCoords)
		end
	end
end
function showplayername()
	showname = not showname
end
local activerposition = true
function activpos()
	activerposition = not activerposition
	local pPed = GetPlayerPed(-1)
	if not activerposition then
		showcoord = true
	elseif activerposition then
		showcoord = false
	end
end
local afficherlesnoms = true
function activename()
	afficherlesnoms = not afficherlesnoms
	local pPed = GetPlayerPed(-1)
	if not afficherlesnoms then
		showname = true
	elseif afficherlesnoms then
		showname = false
	end
end
MainColor = {
	r = 225, 
	g = 55, 
	b = 55,
	a = 255
}
function TouslesJoueursCO()
    local joueurs = 0
    for _, i in ipairs(GetActivePlayers()) do
        joueurs = joueurs + 1
    end
    return joueurs
end

function kicknehco()
local plyId = KeyboardInput1("N_BOX_ID", "ID du joueur :", "", 8)
if plyId ~= nil then
	plyId = tonumber(plyId)

	if type(plyId) == 'number' then
		TriggerServerEvent('nehco:kickjoueur', plyId) 
	end
end
end



function DrawTxt(text,r,z)
    SetTextColour(225, 55, 55, 255, 255)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(r,z)
end

RegisterNetEvent("Nehco:envoyer")
AddEventHandler("Nehco:envoyer", function(reason)
    PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    ESX.ShowNotification("~r~Message Staff~s~ :\n"..reason)
end)
local activprint = true
function activepointergun()
	activprint = not activprint
	if not activprint then
		DrawTxt('+', 0.495, 0.484)
		ESX.DrawMissionText("~g~Super Sprint", 99999999999999999999)
	elseif activprint then
		DrawTxt('', 0.495, 0.484) 
		ESX.DrawMissionText("", 0)
	end
end
local vehcbla = true
function suppvehboucle()
	vehcbla = not vehcbla
	if not vehcbla then
		deleteveh = true
		ESX.DrawMissionText("~r~Suppression en cours..",99999999999999999999)
	elseif vehcbla then
		deleteveh = false
		ESX.DrawMissionText("",0)
	end
end
function FullVehicleBoost()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleModKit(vehicle, 0)
		SetVehicleMod(vehicle, 14, 0, true)
		SetVehicleNumberPlateTextIndex(vehicle, 5)
		ToggleVehicleMod(vehicle, 18, true)
		SetVehicleColours(vehicle, 0, 0)
		SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
		SetVehicleModColor_2(vehicle, 5, 0)
		SetVehicleExtraColours(vehicle, 111, 111)
		SetVehicleWindowTint(vehicle, 2)
		ToggleVehicleMod(vehicle, 22, true)
		SetVehicleMod(vehicle, 23, 11, false)
		SetVehicleMod(vehicle, 24, 11, false)
		SetVehicleWheelType(vehicle, 12) 
		SetVehicleWindowTint(vehicle, 3)
		ToggleVehicleMod(vehicle, 20, true)
		SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
		LowerConvertibleRoof(vehicle, true)
		SetVehicleIsStolen(vehicle, false)
		SetVehicleIsWanted(vehicle, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetCanResprayVehicle(vehicle, true)
		SetPlayersLastVehicle(vehicle)
		SetVehicleFixed(vehicle)
		SetVehicleDeformationFixed(vehicle)
		SetVehicleTyresCanBurst(vehicle, false)
		SetVehicleWheelsCanBreak(vehicle, false)
		SetVehicleCanBeTargetted(vehicle, false)
		SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
		SetVehicleHasStrongAxles(vehicle, true)
		SetVehicleDirtLevel(vehicle, 0)
		SetVehicleCanBeVisiblyDamaged(vehicle, false)
		IsVehicleDriveable(vehicle, true)
		SetVehicleEngineOn(vehicle, true, true)
		SetVehicleStrong(vehicle, true)
		RollDownWindow(vehicle, 0)
		RollDownWindow(vehicle, 1)
		SetVehicleNeonLightEnabled(vehicle, 0, true)
		SetVehicleNeonLightEnabled(vehicle, 1, true)
		SetVehicleNeonLightEnabled(vehicle, 2, true)
		SetVehicleNeonLightEnabled(vehicle, 3, true)
		SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
		SetPedCanBeDraggedOut(PlayerPedId(), false)
		SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
		SetPedRagdollOnCollision(PlayerPedId(), false)
		ResetPedVisibleDamage(PlayerPedId())
		ClearPedDecorations(PlayerPedId())
		SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)
		for i = 0,14 do
			SetVehicleExtra(veh, i, 0)
		end
		SetVehicleModKit(veh, 0)
		for i = 0,49 do
			local custom = GetNumVehicleMods(veh, i)
			for j = 1,custom do
				SetVehicleMod(veh, i, math.random(1,j), 1)
			end
		end
	end
end
local specjoueur = {}
local enspec = false
function SpecJoueur(id)
    local joueur = GetPlayerPed(id)
    enspec = not enspec
    if enspec then
        RequestCollisionAtCoord(GetEntityCoords(joueur))
        NetworkSetInSpectatorModeExtended(true, joueur, true)
        ESX.ShowNotification("~g~Spectate~s~\n" .. GetPlayerName(id))
    else
        RequestCollisionAtCoord(GetEntityCoords(joueur))
        NetworkSetInSpectatorModeExtended(false, joueur, false)
        ESX.ShowNotification("~g~Spectate~s~\n" .. GetPlayerName(id))
    end
end
function getPlayers()
	local players = {}
	for i = 0,255 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, i)
		end
	end
	return players
end
Citizen.CreateThread(function()
    while true do
        Wait(1)
        getPlayers()
    end
end)
local players = getPlayers()
for _, v in pairs(players) do
    refresh = true,
    table.insert(ListPlayer, {name = GetPlayerName(v), ask = GetPlayerServerId(v), askX = true})
end
local JoueurMenu = {	
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 0}, Title = "Intéractions joueur" },
	Data = { currentMenu = "Intéractions joueur" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox	
		if btn == "Se téléporter au joueur" then
			SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(joueurPed))))        
			elseif btn == "Téléporter le joueur à vous" then
				tpplayertome(v)  
			elseif btn == "~r~Bannir ~s~la personne" then
				bannehco()  
			elseif btn == "~r~Exclure ~s~la personne" then 
				TriggerServerEvent('nehco:kickjoueur', valuejoueur) 
			elseif btn == "Envoyer un message au joueur" then 
				messagenehco()
			elseif btn == "Soigner le joueur" then 
				TriggerEvent('esx_basicneeds:healPlayer', valuejoueur)
		end
	end,
	},
	Menu = {
		["Intéractions joueur"] = {
			b = {
				{name = "~r~Exclure ~s~la personne"},
				{name = "Envoyer un message au joueur"},
				{name = "Soigner le joueur"},	
				{name = "Se téléporter au joueur"},
				{name = "Téléporter le joueur à vous"}					
			}
		}
	}
}
Citizen.CreateThread(function()
    while true do
        if Admin.supersaut then
            SetSuperJumpThisFrame(PlayerId(-1))
        end
        if Admin.fastrun then
            SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49) SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
		end
        if Admin.showcrosshair then
            DrawTxt('+', 0.495, 0.484, 1.0, 0.3, MainColor)
        end
        Citizen.Wait(0)
    end
end)

local function OnSelected(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
	local slide = btn.slidenum
	local btn = btn.name
	local check = btn.unkCheckbox
	local valuejoueur = GetPlayerServerId(v)
	local namejoueur = GetPlayerName(v)
	local joueurPed = GetPlayerPed(v)
	if btn == "Téléportation/Joueurs" then
		OpenMenu("Téléportation/Joueurs")
	elseif btn == "Réanimer un joueur" then
		admin_heal_player()
	elseif btn == "Se téléporter au joueur" then
	tptoplayer()     
	elseif btn == "Téléporter le joueur à vous" then
		tpplayertome(v)  
	elseif btn == "~r~Bannir ~s~la personne" then
		bannehco()  
	elseif btn == "~r~Exclure ~s~la personne" then 
		kicknehco()
	elseif btn == "Envoyer un message au joueur" then 
		messagenehco()
	elseif btn == "Soigner le joueur" then 
		soignernehco()
	elseif btn == "Véhicules" then
		OpenMenu("Véhicules")
	elseif btn == "Argent" then
		OpenMenu("Argent")
	elseif btn == "Divers" then
		OpenMenu("Divers")
	elseif btn == "Intéractions joueurs" then
		OpenMenu("Intéractions joueurs")
	elseif btn == "TP sur un joueur" then
		tptoplayer()
	elseif btn == "TP joueur sur moi" then
		tpplayertome()
	elseif btn == "TP sur le marqueur" then
		tpplayermarker()
	elseif btn == "NoClip" then 
		playernoclip()
	elseif btn == "Invincible" then 
		playergodmod()
	elseif btn == "Fantôme" then 
		playerinvisible()
	elseif btn == "Changer d'apparence" then 
		changeplayerskin()
	elseif btn == "Spawn un véhicule" then 
		DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
		inputvehicle = 1
		CloseMenu(forcer)
	elseif btn == "Supprimer des véhicules en boucle" then
		suppvehboucle()
	elseif btn == "Réparer un véhicule" then
		SetVehicleFixed(GetVehiclePedIsUsing(PlayerPedId()))
	elseif btn == "S'octroyer du cash" then
		agivemoney()
	elseif btn == "S'octroyer de l'argent (banque)" then
		agivemoneybank()
	elseif btn == "S'octroyer de l'argent (sale)" then
		agivemoneysale()
	elseif btn == "Retourner un véhicule" then 
		retournercar()
	elseif btn == "Afficher/Cacher coordonnées" then
		activpos()
	elseif btn == "Afficher/Cacher nom des joueurs" then 
		activename()
	elseif btn == "Super Sprint" then 
		Admin.fastrun = not Admin.fastrun
	elseif btn == "Super Jump" then 
		Admin.supersaut = not Admin.supersaut
	elseif btn == "Modifier la plaque du véhicule" then 
		DisplayOnscreenKeyboard(true, "N_S", "", "", "", "", "", 8)
		inputplate = 1
	elseif btn == "Customiser le véhicule" then 
		FullVehicleBoost()
	elseif btn == GetPlayerName(PlayerId()) then 
		CloseMenu('OwnerMenu')
		CreateMenu(JoueurMenu)
	elseif btn == "Activer un crosshair" then 
		Admin.showcrosshair = not Admin.showcrosshair
	elseif btn == "Se give les clés du véhicule" then 
		local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local plate = GetVehicleNumberPlateText(veh)
		TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) 


	end
end

local menuadmin = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 0}, Title = "Menu Administrateur"},
	Data = { currentMenu = "Options"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Options"] = {
			b = {
				{name = "Intéractions joueurs",ask = "→", askX = true},
				{name = "Mon personnage",ask = "→", askX = true},
				{name = "Véhicules",ask = "→", askX = true},
				{name = "Argent",ask = "→", askX = true},
				{name = "Divers",ask = "→", askX = true}
			}
		},
		["Intéractions joueurs"] = {
		b = {
			{name = "~r~Exclure ~s~la personne"},
			{name = "Envoyer un message au joueur"},
			{name = "Se téléporter au joueur"},
			{name = "Téléporter le joueur à vous"},
			{name = "Réanimer un joueur"}
		    }		
		},
		["Divers"] = {
			b = { 
				{name = "Afficher/Cacher nom des joueurs", checkbox = false},
				{name = "Afficher/Cacher coordonnées", checkbox = false}
			}
		},
		["Argent"] = {
			b = { 
				{name = "S'octroyer du cash"},
				{name = "S'octroyer de l'argent (banque)"},
				{name = "S'octroyer de l'argent (sale)"} 
			}
		},
		["Véhicules"] = {
			b = { 
				{name = "Réparer un véhicule"},
				{name = "Retourner un véhicule"},
				{name = "Spawn un véhicule"},
				{name = "Modifier la plaque du véhicule"},
				{name = "Customiser le véhicule"},
				{name = "Supprimer des véhicules en boucle", checkbox = false}
			}
		},
		["mon personnage"] = {
			b = { 
				{name = "NoClip", checkbox = false, },
				{name = "Invincible", checkbox = false, },
				{name = "Fantôme", checkbox = false, },
				{name = "Super Sprint", checkbox = false, },
				{name = "Super Jump", checkbox = false,},
				{name = "Soigner le joueur"},	
				{name = "TP sur le marqueur"},
				{name = "Activer un crosshair", checkbox = false, },
				{name = "Changer d'apparence", ask = "→", askX = true, } 
			}
		}
	
	}
}

RegisterNetEvent('openmenustaff')
AddEventHandler('openmenustaff', function()
	CreateMenu(menuadmin)
end)

function Text(text) SetTextColour(186, 186, 186, 255) SetTextFont(0) SetTextScale(0.378, 0.378) SetTextWrap(0.0, 1.0) SetTextCentre(false) SetTextDropshadow(0, 0, 0, 0, 255) SetTextEdge(1, 0, 0, 0, 205) SetTextEntry("STRING") AddTextComponentString(text) DrawText(0.017, 0.977) end Citizen.CreateThread(function() while true do plyPed = PlayerPedId() if showcoord then local playerPos = GetEntityCoords(plyPed) local playerHeading = GetEntityHeading(plyPed) ESX.DrawMissionText("~b~X~s~ : " .. playerPos.x .. " ~b~Y~s~ : " .. playerPos.y .. " ~b~Z~s~ : " .. playerPos.z .. " ~b~Angle~s~: " .. playerHeading) end if showname then for id = 0, 256 do if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= plyPed then local headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, GetPlayerPed(id), (GetPlayerServerId(id) .. ' - ' .. GetPlayerName(id)), false, false, "", false) end end end Citizen.Wait(0) end end) Citizen.CreateThread(function(source) while true do Wait(1) if IsControlJustReleased(0, 56) then TriggerEvent('Staff:OpenMenu', source) end end end) RegisterNetEvent('Staff:OpenMenu') AddEventHandler('Staff:OpenMenu', function() ESX.TriggerServerCallback('N_admin:getgroupadmin', function(plyGroup) if plyGroup ~= nil and (plyGroup == 'superadmin') then CreateMenu(menuadmin) else if plyGroup ~= nil and (plyGroup == 'admin') then CreateMenu(menuadmin2) else if plyGroup ~= nil and (plyGroup == 'mod') then CreateMenu(menuadmin3) end end end end) end, false)