

ESX = nil

local PlayerData = {}
local checkbox = true 

TriggerEvent('esx_society:registerSociety', 'realestateagent', 'Agent immobilier', 'society_realestateagent', 'society_realestateagent', 'society_realestateagent', {type = 'public'})

 

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	Citizen.Wait(5000)

end)


function RespawnPed(ped, coords)
    SetPlayerInvincible(ped, false)
    TriggerEvent('playerSpawned')
end
 

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

local function noSpace(str)
	local normalisedString = string.gsub(str, "%s+", "")
	return normalisedString
 end
 


 function Destroy()
    cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', false)
	SetCamActive(cam,  false)	
	FreezeEntityPosition(GetPlayerPed(-1), false)
	RenderScriptCams(false,  false,  0,  false,  false)
    SetFocusEntity(PlayerPedId())
	print('retour')
end

function OpenPropertyMenu() 
	TriggerEvent('esx_property:getProperties', function(properties)

		local elements = {
			head = {_U('property_name'), _U('property_actions')},
			rows = {}
		}

		for i=1, #properties, 1 do
			table.insert(elements.rows, {
				data = properties[i],
				cols = {
					properties[i].label,
					_U('property_actionbuttons')
				}
			})
		end

		ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'properties', elements, function(data, menu)
			if data.value == 'sell' then
				menu.close()

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'sell_property_amount', {
					title = _U('amount')
				}, function(data2, menu2)
					local amount = tonumber(data2.value)

					if amount == nil then
						ESX.ShowNotification(_U('invalid_amount'))
					else
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							ESX.ShowNotification(_U('no_play_near'))
							menu2.close()
						else
							TriggerServerEvent('esx_realestateagentjob:sell', GetPlayerServerId(closestPlayer), data.data.name, amount)
							menu2.close()
						end

						OpenPropertyMenu()
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			elseif data.value == 'rent' then
				menu.close()

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'rent_property_amount', {
					title = _U('amount')
				}, function(data2, menu2)
					local amount = tonumber(data2.value)

					if amount == nil then
						ESX.ShowNotification(_U('invalid_amount'))
					else
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							ESX.ShowNotification(_U('no_play_near'))
							menu2.close()
						else
							TriggerServerEvent('esx_realestateagentjob:rent', GetPlayerServerId(closestPlayer), data.data.name, amount)
							menu2.close()
						end

						OpenPropertyMenu()
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			elseif data.value == 'gps' then
				TriggerEvent('esx_property:getProperty', data.data.name, function(property)
					if property.isSingle then
						SetNewWaypoint(property.entering.x, property.entering.y)
					else
						TriggerEvent('esx_property:getGateway', property, function(gateway)
							SetNewWaypoint(gateway.entering.x, gateway.entering.y)
						end)
					end
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end


function OpenCustomersMenu()
	ESX.TriggerServerCallback('esx_realestateagentjob:getCustomers', function(customers)
		local elements = {
			head = {_U('customer_client'), _U('customer_property'), _U('customer_agreement'), _U('customer_actions')},
			rows = {}
		}  

		for i=1, #customers, 1 do
			table.insert(elements.rows, {
				data = customers[i],
				cols = {
					customers[i].name,
					customers[i].propertyLabel,
					(customers[i].propertyRented and _U('customer_rent') or _U('customer_sell')),
					_U('customer_contractbuttons')
				}
			})
		end

		ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'customers', elements, function(data, menu)
			if data.value == 'revoke' then
				TriggerServerEvent('esx_realestateagentjob:revoke', data.data.propertyName, data.data.propertyOwner)
				OpenCustomersMenu()
			elseif data.value == 'gps' then
				TriggerEvent('esx_property:getProperty', data.data.propertyName, function(property)
					if property.isSingle then
						SetNewWaypoint(property.entering.x, property.entering.y)
					else
						TriggerEvent('esx_property:getGateway', property, function(gateway)
							SetNewWaypoint(gateway.entering.x, gateway.entering.y)
						end)
					end
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end


 
     

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	-- TextEntry		-->	The Text above the typing field in the black square
	-- ExampleText		-->	An Example Text, what it should say in the typing field
	-- MaxStringLenght	-->	Maximum String Lenght

	AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
	
	blockinput = true --Blocks new input while typing if **blockinput** is used
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end 
		 
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() --Gets the result of the typing
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return result --Returns the result
	else
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return nil --Returns nil if the typing got aborted
	end
end

local Neo = true
function functionCheckBox()
    Neo = not Neo
    if not Neo then  
        TriggerServerEvent("player:serviceOn", "realestateagent")
                    ESX.ShowColoredNotification("Vous êtes désormais ~y~en service", 18)   
    elseif Neo then  
        TriggerServerEvent('esx_service:disableService', 'realestateagent')
        ESX.ShowColoredNotification("Vous êtes désormais ~y~plus en service", 6) 
    end
end

local Neo = true
function functionCheckBox2()
    Neo = not Neo 
    if not Neo then  
        TriggerEvent("call:cancelCall") 
        ESX.ShowColoredNotification("Vous avez annulé L\'appel", 6)    
        TriggerServerEvent('esx_service:disableService', 'realestateagent') 
    elseif Neo then  
        TriggerServerEvent("player:serviceOn", "realestateagent")
        ESX.ShowColoredNotification("Vous pouvez maintenant accepter à nouveau les appels", 18)   
    end
end



function Cam(type)
	local ped = GetPlayerPed(-1)
	if type == 'Low' then 
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		SetFocusArea(265.6078, -995.8491, -99.0086, 0.0, 0.0, 0.0)
		SetCamCoord(cam, 265.9317, -999.4464, -99.0086)
	    SetCamActive(cam,  true)
	  	SetCamRot(cam, 0.0, 0.0, 87.69)
		RenderScriptCams(true,  false,  0,  true,  true)
		FreezeEntityPosition(ped, true)
	elseif type == 'Middle' then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		SetFocusArea(-616.8566, 59.3575, 98.2000, 0.0, 0.0, 0.0)
		SetCamCoord(cam, -616.8566, 59.3575, 98.2000)
	    SetCamActive(cam,  true)
	  	SetCamRot(cam, 0.0, 0.0, 195.59)
		RenderScriptCams(true,  false,  0,  true,  true)
		FreezeEntityPosition(ped, true)	
	elseif type == 'Modern' then 
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		SetFocusArea(-788.3881, 320.2430, 187.3132, 0.0, 0.0, 0.0)
		SetCamCoord(cam, -788.3881, 320.2430, 187.3132)
	    SetCamActive(cam,  true)
	  	SetCamRot(cam, 0.0, 0.0, 355.81)
		RenderScriptCams(true,  false,  0,  true,  true)
		FreezeEntityPosition(ped, true)
	elseif type == 'High' then 
	    cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		SetFocusArea(-1459.1700, -520.5855, 56.9247, 0.0, 0.0, 0.0)
		SetCamCoord(cam, -1459.1700, -520.5855, 56.9247)
	    SetCamActive(cam,  true)
	  	SetCamRot(cam, 0.0, 0.0, 150.2664)
		RenderScriptCams(true,  false,  0,  true,  true)
		FreezeEntityPosition(ped, true)	
    elseif type == 'Luxe' then 
	    cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		SetFocusArea(-674.4503, 595.6156, 145.3796, 0.0, 0.0, 0.0)
		SetCamCoord(cam, -674.4503, 595.6156, 145.3796)
	    SetCamActive(cam,  true)
	  	SetCamRot(cam, 0.0, 0.0, 195.45)
		RenderScriptCams(true,  false,  0,  true,  true)
		FreezeEntityPosition(ped, true)	
	elseif type == 'Motel' then 
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		SetFocusArea(151.0994, -1007.8073, -98.9999, 0.0, 0.0, 0.0)
		SetCamCoord(cam, 151.0994, -1007.8073, -98.9999)
	    SetCamActive(cam,  true)
	  	SetCamRot(cam, 0.0, 0.0, 337.79)
		RenderScriptCams(true,  false,  0,  true,  true)
		FreezeEntityPosition(ped, true)	
	elseif type == 'Entrepot1' then 
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		SetFocusArea(1026.8707, -3099.8710, -38.9998, 0.0, 0.0, 0.0)
		SetCamCoord(cam, 1026.8707, -3099.8710, -38.9998)
	    SetCamActive(cam,  true)   
	  	SetCamRot(cam, 0.0, 0.0, 88.76)
		RenderScriptCams(true,  false,  0,  true,  true)
		FreezeEntityPosition(ped, true)
	elseif type == 'Entrepot2' then 
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		SetFocusArea(1072.8447, -3100.0390, -38.9999, 0.0, 0.0, 0.0)
		SetCamCoord(cam, 1072.8447, -3100.0390, -38.9999)
		SetCamActive(cam,  true)
		SetCamRot(cam, 0.0, 0.0, 91.85) 
		RenderScriptCams(true,  false,  0,  true,  true)
		FreezeEntityPosition(ped, true)	
	elseif type == 'Entrepot3'	then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		SetFocusArea(1104.7231, -3100.0690, -38.9999, 0.0, 0.0, 0.0)
		SetCamCoord(cam, 1104.7231, -3100.0690, -38.9999)
	    SetCamActive(cam,  true)
	  	SetCamRot(cam, 0.0, 0.0, 85.68)
		RenderScriptCams(true,  false,  0,  true,  true)
		FreezeEntityPosition(ped, true)
	end	
end


local name = ''
local exit = ''
local label = ''
local inside = '' 
local outside = ''
local ipl = ''
local isRoom = ''
local room_menu = ''
local price = ''
local entering = ''
local entrer = '' 
local isSingle = ''

local price = 0   

local zones = { 
	['AIRP'] = "Los Santos International Airport",
	['ALAMO'] = "Alamo Sea", 
	['ALTA'] = "Alta", 
	['ARMYB'] = "Fort Zancudo", 
	['BANHAMC'] = "Banham Canyon Dr", 
	['BANNING'] = "Banning", 
	['BEACH'] = "Vespucci Beach", 
	['BHAMCA'] = "Banham Canyon", 
	['BRADP'] = "Braddock Pass", 
	['BRADT'] = "Braddock Tunnel", 
	['BURTON'] = "Burton", 
	['CALAFB'] = "Calafia Bridge", 
	['CANNY'] = "Raton Canyon", 
	['CCREAK'] = "Cassidy Creek", 
	['CHAMH'] = "Chamberlain Hills", 
	['CHIL'] = "Vinewood Hills", 
	['CHU'] = "Chumash", 
	['CMSW'] = "Chiliad Mountain State Wilderness", 
	['CYPRE'] = "Cypress Flats", 
	['DAVIS'] = "Davis", 
	['DELBE'] = "Del Perro Beach", 
	['DELPE'] = "Del Perro", 
	['DELSOL'] = "La Puerta", 
	['DESRT'] = "Grand Senora Desert", 
	['DOWNT'] = "Downtown", 
	['DTVINE'] = "Downtown Vinewood", 
	['EAST_V'] = "East Vinewood", 
	['EBURO'] = "El Burro Heights", 
	['ELGORL'] = "El Gordo Lighthouse", 
	['ELYSIAN'] = "Elysian Island", 
	['GALFISH'] = "Galilee", 
	['GOLF'] = "GWC and Golfing Society", 
	['GRAPES'] = "Grapeseed", 
	['GREATC'] = "Great Chaparral", 
	['HARMO'] = "Harmony", 
	['HAWICK'] = "Hawick", 
	['HORS'] = "Vinewood Racetrack", 
	['HUMLAB'] = "Humane Labs and Research", 
	['JAIL'] = "Bolingbroke Penitentiary", 
	['KOREAT'] = "Little Seoul", 
	['LACT'] = "Land Act Reservoir", 
	['LAGO'] = "Lago Zancudo", 
	['LDAM'] = "Land Act Dam", 
	['LEGSQU'] = "Legion Square", 
	['LMESA'] = "La Mesa", 
	['LOSPUER'] = "La Puerta", 
	['MIRR'] = "Mirror Park", 
	['MORN'] = "Morningwood", 
	['MOVIE'] = "Richards Majestic", 
	['MTCHIL'] = "Mount Chiliad", 
	['MTGORDO'] = "Mount Gordo", 
	['MTJOSE'] = "Mount Josiah", 
	['MURRI'] = "Murrieta Heights", 
	['NCHU'] = "North Chumash", 
	['NOOSE'] = "N.O.O.S.E", 
	['OCEANA'] = "Pacific Ocean", 
	['PALCOV'] = "Paleto Cove", 
	['PALETO'] = "Paleto Bay", 
	['PALFOR'] = "Paleto Forest", 
	['PALHIGH'] = "Palomino Highlands", 
	['PALMPOW'] = "Palmer-Taylor Power Station", 
	['PBLUFF'] = "Pacific Bluffs", 
	['PBOX'] = "Pillbox Hill", 
	['PROCOB'] = "Procopio Beach", 
	['RANCHO'] = "Rancho", 
	['RGLEN'] = "Richman Glen", 
	['RICHM'] = "Richman", 
	['ROCKF'] = "Rockford Hills", 
	['RTRAK'] = "Redwood Lights Track", 
	['SANAND'] = "San Andreas", 
	['SANCHIA'] = "San Chianski Mountain Range", 
	['SANDY'] = "Sandy Shores", 
	['SKID'] = "Mission Row", 
	['SLAB'] = "Stab City", 
	['STAD'] = "Maze Bank Arena", 
	['STRAW'] = "Strawberry", 
	['TATAMO'] = "Tataviam Mountains", 
	['TERMINA'] = "Terminal", 
	['TEXTI'] = "Textile City", 
	['TONGVAH'] = "Tongva Hills", 
	['TONGVAV'] = "Tongva Valley", 
	['VCANA'] = "Vespucci Canals", 
	['VESP'] = "Vespucci", 
	['VINE'] = "Vinewood",
	['WINDF'] = "Ron Alternates Wind Farm", 
	['WVINE'] = "West Vinewood",
	['ZANCUDO'] = "Zancudo River",
	['ZP_ORT'] = "Port of South Los Santos", 
	['ZQ_UAR'] = "Davis Quartz" 
	}

local maison = {
    'Low',
    'Middle',
    'Modern',
    'High',
    'Luxe',
    'Motel',
    'Entrepot (grand)',
    'Entrepot (moyen)',
    'Entrepot (petit)',
    'Retour'
}
 
local prop = {
	'~b~Valider', 
	'~r~Annuler'
} 

local props = {
	'Propriété',
	'Client'
}

local testmenu = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = 'Agent immobilier' },
	Data = { currentMenu = "~b~Settings", GetPlayerName(PlayerId()) },
    Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
          

			local pos = GetEntityCoords(PlayerPedId())
			local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
			local current_zone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]
			
			if btn == "Placer une entrée" then                                      
				
				local PlayerCoord = {x = ESX.Math.Round(pos.x, 4), y = ESX.Math.Round(pos.y, 4), z = ESX.Math.Round(pos.z-1, 4)}                          
				local Out = {x = ESX.Math.Round(pos.x, 4), y = ESX.Math.Round(pos.y, 4), z = ESX.Math.Round(pos.z+2, 4)}
				entering = json.encode(PlayerCoord)
				outside  = json.encode(Out)
                PedPosition = pos
                ESX.ShowNotification('~g~Agent immobilier~s~\nSauvegarde de paramètre')
                
	            
			elseif btn == "Placer le coffre" then  

				local CoffreCoord = {x = ESX.Math.Round(pos.x, 4), y = ESX.Math.Round(pos.y, 4), z = ESX.Math.Round(pos.z-1, 4)} 
				room_menu = json.encode(CoffreCoord)
				ESX.ShowNotification('~g~Agent immobilier~s~\nSauvegarde de paramètre') 
				
			elseif slide == 1 and btn == "Propriété" then             
				if tonumber(price) == nil or tonumber(price) == 0 then
		            ESX.ShowNotification('~r~Vous n\'avez aucun prix assigné !')
		        else 
		        	if name == '' then 
		        		ESX.ShowNotification('~r~Vous n\'avez aucun nom assigné !')
		        	else 	
                        TriggerServerEvent('Neo_prop:Save', name, label, entering, exit, inside, outside, ipl, isSingle, isRoom, isGateway, room_menu, price) 
		    	    
			    	   Citizen.Wait(15) 
			    	   SetEntityCoords(PlayerPedId(), PedPosition.x, PedPosition.y, PedPosition.z)
			    	end 
				end    
			elseif slide == 2 and btn == "Propriété" then             
				if PedPosition ~= nil then
					SetEntityCoords(PlayerPedId(), PedPosition.x, PedPosition.y, PedPosition.z)
				 end  
 
				 Citizen.Wait(50)
				 CloseMenu(force) 
				 ESX.ShowNotification('Création de propriété annulé')   

			elseif btn == "Prix" then  
				local result = GetOnscreenKeyboardResult() 
				if result ~= nil then  
					price = result 
				 end
				
			elseif btn == "Nom" then    
				local result = GetOnscreenKeyboardResult() 
				if result ~= nil then  
					name = result 
				 end

			elseif btn == "Label" then  
				local result = GetOnscreenKeyboardResult() 
				if result ~= nil then  
					label = result 
				 end
				
            elseif slide == 1 and btn == "Interieur" then  
                if checkbox == false then 
                    Cam('Low')
                else
                    ipl = '[]'
                    inside = '{"x":265.307,"y":-1002.802,"z":-101.008}'
                    exit = '{"x":266.0773,"y":-1007.3900,"z":-101.008}'
                    isSingle = 1
                    isRoom = 1
                    isGateway = 0
                    SetEntityCoords(GetPlayerPed(-1), 265.6031, -1002.9244, -99.0086)		
                end		
                 
            elseif slide == 2 and btn == "Interieur" then  
                if checkbox == false then 
                    Cam('Middle')
                else
                    ipl = '[]'
                    inside = '{"x":-612.16,"y":59.06,"z":97.2}'
                    exit = '{"x":-603.4308,"y":58.9184,"z":97.2001}'
                    isSingle = 1
                    isRoom = 1
                    isGateway = 0
                    SetEntityCoords(GetPlayerPed(-1), -616.8566, 59.3575, 98.2000)		
                end	
                elseif slide == 3 and btn == "Interieur" then  
                   
		    		if checkbox == false then 
		    			Cam('Modern')
					else
						ipl = '["apa_v_mp_h_01_a"]'
						inside = '{"x":-785.13,"y":315.79,"z":187.91}'
						exit = '{"x":-786.87,"y":315.7497,"z":186.91}'
						isSingle = 1
					    isRoom = 1
					    isGateway = 0
						SetEntityCoords(GetPlayerPed(-1), -788.3881, 320.2430, 187.3132)		
					end			

                elseif slide == 4 and btn == "Interieur" then  
                    if checkbox == false then 
		    			Cam('High')
					else
						ipl = '[]'
						inside = '{"x":-1459.17,"y":-520.58,"z":54.929}'
						exit = '{"x":-1451.6394,"y":-523.5562,"z":55.9290}'
						isSingle = 1
					    isRoom = 1
					    isGateway = 0
						SetEntityCoords(GetPlayerPed(-1), -1459.1700, -520.5855, 56.9247)		
					end		
            elseif slide == 5 and btn == "Interieur" then  
                if checkbox == false then 
                    Cam('Luxe')
              else
                  ipl = '[]'
                  inside = '{"x":-680.6088,"y":590.5321,"z":145.39}'
                  exit = '{"x":-681.6273,"y":591.9663,"z":144.3930}'				
                  isSingle = 1
                  isRoom = 1
                  isGateway = 0
                  SetEntityCoords(GetPlayerPed(-1), -674.4503, 595.6156, 145.3796)		
              end		
            elseif slide == 6 and btn == "Interieur" then  
             	
		    	   if checkbox == false then 
                    Cam('Motel')   
             else
                 ipl = '["hei_hw1_blimp_interior_v_motel_mp_milo_"]'
                 inside = '{"x":151.45,"y":-1007.57,"z":-98.9999}'
                 exit = '{"x":151.3258,"y":-1007.7642,"z":-100.0000}'
                 isSingle = 1
                 isRoom = 1
                 isGateway = 0
                 SetEntityCoords(GetPlayerPed(-1), 151.0994, -1007.8073, -98.9999)		
             end		

            elseif slide == 7 and btn == "Interieur" then  
              
		    	    if checkbox == false then 
		    	    	Cam('Entrepot1')
					else
						ipl = '[]'
						inside = '{"x":1026.5056,"y":-3099.8320,"z":-38.9998}'
						exit   = '{"x":998.1795"y":-3091.9169,"z":-39.9999}'
						isSingle = 1
					    isRoom = 1
					    isGateway = 0
						SetEntityCoords(GetPlayerPed(-1), 1026.8707, -3099.8710, -38.9998)		
					end	
            elseif slide == 8 and btn == "Interieur" then  
                if checkbox == false then 
                    Cam('Entrepot2')
                 else
                     ipl = '[]'
                     inside = '{"x":1048.5067,"y":-3097.0817,"z":-38.9999}'
                     exit   = '{"x":1072.5505,"y":-3102.5522,"z":-39.9999}'
                     isSingle = 1
                     isRoom = 1
                     isGateway = 0
                     SetEntityCoords(GetPlayerPed(-1), 1072.8447, -3100.0390, -38.9999)		
                 end	
            elseif slide == 9 and btn == "Interieur" then  
                if checkbox == false then 
                    Cam('Entrepot3')
                  else  

                ipl = '[]'
                inside = '{"x":1088.1834,"y":-3099.3547,"z":-38.9999}'
                exit   = '{"x":1104.6102,"y":-3099.4333,"z":-39.9999}'
                isSingle = 1
                isRoom = 1
                isGateway = 0
                SetEntityCoords(GetPlayerPed(-1), 1104.7231, -3100.0690, -38.9999)		 
                  end
            elseif slide == 10 and btn == "Interieur" then  
				Destroy()      
				 
            elseif btn == "Visiter | Apercu" then 
                checkbox = not checkbox
				ESX.ShowNotification('~g~On~w~ pour vous rendre sur place, ~r~Off~w~ pour avoir un appercu') 

			elseif btn == "Service" then 
					functionCheckBox()
				elseif btn == "Annuler l'appel" then
						functionCheckBox2()
			elseif slide == 1 and btn == "Gestion" then  
				OpenPropertyMenu()  	
			elseif slide == 2 and btn == "Gestion" then  
				OpenCustomersMenu()
			elseif btn == "Agent Immo" then   
				local messageStaff = GetOnscreenKeyboardResult()
					ExecuteCommand("AAI "..messageStaff.."") 
				elseif btn == "Facture" then   
					facture()
					


			end   
        end,
	},
	
	Menu = { 
		["~b~Settings"] = {
			b = {
				{name = "Facture", ask = 'Aucune'},   
				{name = "Gestion", slidemax = props}, 
				{name = "Action", ask = '>', askX = true},      	  
				{name = "Création Propriété", ask = '#1', askX = true},      
			}  
		},   
		["action"] = {
            b = {
                {name = "Service", checkbox = false},
                {name = "Agent Immo", ask = 'Agent immobilier Ouvert !'}, 
                {name = "Annuler l'appel", checkbox = false},
            }
        },
		["création propriété"] = {
			b = {
	
                {name = "Nom", ask = "Aucun"},
				{name = "Placer une entrée", checkbox = false},
                {name = "Placer le coffre", checkbox = false},
				{name = "Gérer la propriété", ask = ">", askX = true},
				{name = "Propriété", slidemax = prop},
			}  
		},
		["gérer la propriété"] = {  
			b = {
				{name = "Visiter | Apercu", checkbox = false}, 
				{name = "Interieur", slidemax = maison},
				{name = "Prix", ask = "0"},  
				{name = "Label", ask = "Aucun"},
			}
		}
	}
}
	
function facture()
    local amount = GetOnscreenKeyboardResult()

    if amount ~= nil then
        amount = tonumber(amount)
        
        if type(amount) == 'number' then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                local playerPed        = GetPlayerPed(-1)
                TriggerServerEvent('esx_billing:sendBill1', GetPlayerServerId(closestPlayer), 'society_realestateagent', 'realestateagent', amount)
                ESX.ShowNotification('~g~Vous venez de mettre une facture a une personnes')		
            else        
                ESX.ShowNotification('~r~ERREUR~s~: ~g~Aucun joueur à proximitée')
        end
    end
end

local tp = { {x=-198.09, y=-575.11, z=40.48}} Citizen.CreateThread(function() while true do Citizen.Wait(0) for k in pairs(tp) do local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, tp[k].x, tp[k].y, tp[k].z) if dist <= 1.5 then ESX.ShowHelpNotification("Presse ~INPUT_PICKUP~ ~g~Pour accéder à l'agence immobilière") if IsControlJustPressed(1,38) then Citizen.Wait(1) SetEntityCoords(GetPlayerPed(-1), -77.57, -829.832, 243.568-0.98) end end end end end)
local tp1 = { {x=-77.57, y=-829.832, z=243.568}} Citizen.CreateThread(function() while true do Citizen.Wait(0) for k in pairs(tp1) do local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, tp1[k].x, tp1[k].y, tp1[k].z) if dist <= 1.5 then ESX.ShowHelpNotification("Presse ~INPUT_PICKUP~ ~g~Pour accéder à l'agence immobilière") if IsControlJustPressed(1,38) then Citizen.Wait(1) SetEntityCoords(GetPlayerPed(-1), -198.09, -575.11, 40.48-0.98) end end end end end) 
 
Citizen.CreateThread(function()
    while true do
        Wait(1)
        if  PlayerData.job and PlayerData.job.name == 'realestateagent' and IsControlJustReleased(0, 167) then
            local pos = GetEntityCoords(PlayerPedId())       	 
			local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
	        local current_zone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]  
            CreateMenu(testmenu)  
        end  
    end
end)
 


 
local patronAction = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Intéraction Patron" },
	Data = { currentMenu = "Action :", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn
			local check = btn.unkCheckbox   
            if btn.name == "Entreprise" then
                self:CloseMenu(true)
                TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data, menu) 
					menu.close() 
				    
                end, {wash = false})

		end
	end, 
},
	Menu = {
		["Action :"] = {
			b = {
				{name = "Entreprise", ask = ">", askX = true}
			}
		}
	}
}

local patron = {
    {x = -80.72, y = -802.144, z = 243.40}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(patron) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, patron[k].x, patron[k].y, patron[k].z)

            if dist <= 1.5 and PlayerData.job and PlayerData.job.name == 'realestateagent' and PlayerData.job.grade_name == 'boss' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder à l'ordinateur de ~b~l'entreprise")
                if IsControlJustPressed(1,38) then 
                    CreateMenu(patronAction)
                    end
                end
            end
        end
    end) 

	local call = {
        {x = -73.23, y= -815.83, z=242.43}
    }
         
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
        
            for k in pairs(call) do 
                    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, call[k].x, call[k].y, call[k].z)
          
                if dist <= 2.2  then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~b~téléphone~s~")   
                    if IsControlJustPressed(1,38) then 			
                        local text = 'L\'individu Compose le 669'  
                        TriggerServerEvent('3dme:shareDisplay', text) 
                        ESX.ShowNotification('Vous avez passé un appel')
                        TriggerServerEvent("call:makeCall", "realestateagent", {x=-73.23,y=-815.83,z=243.38}, "Besoin de vous pour des information .", GetPlayerServerId(player))
                        Citizen.Wait(10000)
 
                        end     
                    end
                end
            end  
		end)
		
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                local coords = GetEntityCoords(GetPlayerPed(-1))
        
                for k,v in pairs(call) do  
                        if(Config.Type ~= 1 and GetDistanceBetweenCoords(coords, call[k].x, call[k].y, call[k].z, true) < Config.DrawDistance) then
                            DrawMarker(Config.Type, call[k].x, call[k].y, call[k].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                    end
                end
            end
        end) 






		local voiture = {
			Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Garage" },
			Data = { currentMenu = "Action :", "Test"},
			Events = {
				onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
					if btn.name == "Voiture" then
						self:CloseMenu(true)
						spawnCar("oracle")
						Citizen.Wait(700)
						ESX.ShowNotification('~g~Garage~s~\nVous avez sorti une ~y~oracle')
					elseif btn.name == "Voiture " then
							self:CloseMenu(true)
							spawnCar("oracle2")
							Citizen.Wait(700)
							ESX.ShowNotification('~g~Garage~s~\nVous avez sorti une ~y~oracle2')
					elseif btn.name == "~r~Ranger Vehicule" then 
						TriggerEvent('esx:deleteVehicle')
					end
			end,
		},
			Menu = {
				["Action :"] = {
					b = {
						{name = "Voiture", ask = ">", askX = true},
						{name = "Voiture ", ask = ">", askX = true},
						{name = "~r~Ranger Vehicule", ask = ">", askX = true},
					}
				}
			}
		} 
		
		function spawnCar(car)
			DoScreenFadeIn(3250) DoScreenFadeOut(1250) 
			Citizen.Wait(3250)
			SetEntityCoords(GetPlayerPed(-1), -217.97, -621.50, 33.72-0.98, 0.0, 0.0, 0.0, 10)
			SetEntityHeading(GetPlayerPed(-1), 147.9283561706543)
			DoScreenFadeIn(2000) DoScreenFadeOut(1550)  DoScreenFadeIn(1000)
			local car = GetHashKey(car)
			RequestModel(car)
			while not HasModelLoaded(car) do
				RequestModel(car)
				Citizen.Wait(50) 
			end
			local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
			local vehicle = CreateVehicle(car, -214.71, -626.87, 33.48, 69.38, true, false)
			SetEntityAsNoLongerNeeded(vehicle) 
			SetModelAsNoLongerNeeded(vehicleName)
			SetVehicleNumberPlateText(vehicle, "Immo")
		end 

		local garage = {
			{x=-216.93, y=-605.88, z=34.17}
		}
		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(0)
				for k in pairs(garage) do
					local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
					local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, garage[k].x, garage[k].y, garage[k].z)
					if dist <= 1.5 and PlayerData.job and PlayerData.job.name == 'realestateagent' then
						ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~b~garage~s~")
						if IsControlJustPressed(1,38) then 			
							CreateMenu(voiture)
							end
						end
					end
				end
			end) 




local blips = {
	{title="Agence immobilière", id=414, x = -198.89, y = -575.52, z = 40.134},
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do   
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.7)
		SetBlipColour(info.blip, 46)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)


Citizen.CreateThread(function() local hash = GetHashKey("cs_bankman") while not HasModelLoaded(hash) do RequestModel(hash) Wait(20) end ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_bankman", -215.72, -605.79, 33.17, 65.1554794, false, true) SetBlockingOfNonTemporaryEvents(ped, true) FreezeEntityPosition(ped, true) end) 
 