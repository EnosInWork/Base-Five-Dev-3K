local PlayerData, CurrentActionData, HandcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
ESX = nil
locksound = false
onDuty = false

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



function OpenBillingMenu()

	ESX.UI.Menu.Open(
	  'dialog', GetCurrentResourceName(), 'billing',
	  {
		title = "Facture"
	  },
	  function(data, menu)
  
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer() 
  
		if player ~= -1 and distance <= 3.0 then
  
		  menu.close()
		  if amount == nil then
			  ESX.ShowColoredNotification("~r~ERREUR~s~: ~g~Montant invalide", 25) 
		  else
			  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_ltdsud', _U('billing'), amount)
			  Citizen.Wait(100)
			  ESX.ShowColoredNotification("Vous avez bien envoyer une facture", 25)
		  end
  
		else
		  ESX.ShowColoredNotification("~r~ERREUR~s~: ~g~Aucun joueur proximit ", 25)
		end
  
	  end,
	  function(data, menu)
		  menu.close()
	  end
	)
  end

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
	end)
end 
function startScenario(anim)
    TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
end













local notif = {
    "~g~Ouvert",
    "~r~Fermer"
}

local Neo = true
function functionCheckBox()
    Neo = not Neo
    if not Neo then  
        TriggerServerEvent("player:serviceOn", "ltdsud")
                    ESX.ShowColoredNotification("Vous êtes désormais ~y~en service", 18)   
    elseif Neo then  
        TriggerServerEvent('esx_service:disableService', 'ltdsud')
        ESX.ShowColoredNotification("Vous êtes désormais ~y~plus en service", 6) 
    end
end

local Neo = true
function functionCheckBox2()
    Neo = not Neo
    if not Neo then  
        TriggerEvent("call:cancelCall") 
        ESX.ShowColoredNotification("Vous avez annulé L\'appel", 6)    
        TriggerServerEvent('esx_service:disableService', 'ltdsud') 
    elseif Neo then  
        TriggerServerEvent("player:serviceOn", "ltdsud")
        ESX.ShowColoredNotification("Vous pouvez maintenant accepter à nouveau les appels", 18)   
    end
end


local menuf6ltdsud = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "LTD Sud" },
    Data = { currentMenu = "Action :", "Test" }, 
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			

            if btn == "Service" then
                functionCheckBox()
            elseif btn == "Annuler l'appel" then
                    functionCheckBox2()
            elseif btn == 'Facturation' then
              OpenBillingMenu()	 
          
            elseif btn == "Prise De ~g~Service" then               
                    TriggerServerEvent("player:serviceOn", "ltdsud")
                    ESX.ShowColoredNotification("Vous êtes désormais ~y~en service", 18) 

                elseif slide == 1 and btn == "LTD Sud" then                                      
                    TriggerServerEvent('Announceltdsudo') 
                elseif slide == 2 and btn == "LTD Sud" then                                      
                    TriggerServerEvent('Announceltdsudofermer')  


                elseif btn == "Fin De ~r~Service" then  
                    TriggerServerEvent('esx_service:disableService', 'ltdsud')
                    ESX.ShowColoredNotification("Vous êtes désormais ~y~plus en service", 6) 
           
        end
    end,
},

    Menu = {

        ["Action :"] = {

            b = {
                {name = "Facturation", ask = "", askX = true},
                {name = "Action", ask = "→", askX = true},
               
            
                
                
            }
        },
        ["action"] = {

            b = {
                {name = "Service", checkbox = false},
                {name = "LTD Sud", slidemax = notif},
                {name = "Annuler l'appel", checkbox = false},
              
                
                
            }
        }
     
      
	}
}  



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1,167) and PlayerData.job and PlayerData.job.name == 'ltdsud' then
            CreateMenu(menuf6ltdsud)
        end
    end
end)
------Interaction contoire

local voiture = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "LTD CONTOIRE" },
    Data = { currentMenu = "Animation ltd", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            if btn.name == "Donner objet" then 
               
                local lib1, anim1 = 'mp_safehousevagos@', 'package_dropoff'
                ESX.Streaming.RequestAnimDict(lib1, function()
                TaskPlayAnim(PlayerPedId(), lib1, anim1, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)  
            elseif btn.name == "Contoire" then 
                ExecuteCommand('e leanbar')
            elseif btn.name == "Bras Croiser" then  
                ExecuteCommand('e crossarms')
            elseif btn.name == "Prendre Not" then 
                ExecuteCommand('e notepad')
            elseif btn.name == "Prendre une boite" then 
                ExecuteCommand('e box')
            elseif btn.name == "~r~APPELER LA POLICE" then 
                ExecuteCommand('e pointdown')
                ESX.ShowColoredNotification("Tu as appelé la police", 6)
                TriggerServerEvent("call:makeCall", "police", {x=-709.71,y=-914.48,z=19}, "Besoin d'aides au LTD Sud : On a besoin de vous", GetPlayerServerId(player))
    
                
                    
                     
             
            
          
            end  
    end,
},

    Menu = {

        ["Animation ltd"] = {

            b = {
                {name = "Donner objet", ask = ">", askX = true},
                {name = "Contoire", ask = ">", askX = true},
                {name = "Bras Croiser", ask = ">", askX = true},
                {name = "Prendre Not", ask = ">", askX = true},
                {name = "Prendre une boite", ask = "~g~GROSSE COMMANDE", askX = true},
                {name = "~r~APPELER LA POLICE", ask = ">", askX = true}, 
            
            }
        }
    }
}




local garage = {
    {x=-706.10, y=-914.81, z=19.11}, 
    {x=-706.12, y=-912.68, z=19.11}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    
        for k in pairs(garage) do
                
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, garage[k].x, garage[k].y, garage[k].z)
    
            if dist <= 1.5 and PlayerData.job and PlayerData.job.name == 'ltdsud' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~b~Contoire~s~")
                if IsControlJustPressed(1,38) then 			
                    CreateMenu(voiture)
                    end
                end
            end
        end
    end)






------------------------
       --Casier--
------------------------

  local casierltdsud = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Casier" },
	Data = { currentMenu = "Action :", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
            if btn == "Tenue Civil" then

               
               
          
            
                -------
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
				end)
                ESX.ShowAdvancedNotification('LTD nord', '~b~Casier', 'Tu vien de mettre ta tenue Civil !', 'CHAR_AMANDA')
            end
        
 if btn == "Tenue Employer" then				
					TriggerEvent('skinchanger:getSkin', function(skin)
						if skin.sex == 0 then
                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.ltdnord_wear.male)
                    elseif skin.sex == 1 then
                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.ltdnord_wear.female)
                    end
                end)
                ESX.ShowAdvancedNotification('LTD nord', '~b~Casier', 'Tu vien de mettre ta tenue de travaille !', 'CHAR_AMANDA')
                
    end
            
        
	end,
}, 
	Menu = {
		["Action :"] = {
			b = {
				{name = "Tenue Civil", ask = "→", askX = true},
				{name = "Tenue Employer", ask = "→", askX = true}
			}
		}
	}
}

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		else
			if Config.Uniforms[job].female then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
end

local casierltdsuds = {
    {x = -708.96, y = -907.21, z = 19.21}
}


Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(0)
    
        for k in pairs(casierltdsuds) do
                
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, casierltdsuds[k].x, casierltdsuds[k].y, casierltdsuds[k].z)
    
            if dist <= 0.5 and PlayerData.job and PlayerData.job.name == 'ltdsud' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~b~Casier~s~")
                if IsControlJustPressed(1,38) then 
                    CreateMenu(casierltdsud)
                    end
                end
            end
        end
    end)




        
-------------------------------------------------
  --Interaction Achat/Déposer/Retirer Objects--
-------------------------------------------------

local coffreltdsud = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Coffres" },
	Data = { currentMenu = "Action :", "Test" },
	Events = {
        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            if btn.name == "Pain" then
                TriggerServerEvent('KrXDarkShop:buy', 2, "bread", "bread")
          elseif btn.name == "Eau" then
                TriggerServerEvent('KrXDarkShop:buy', 2, "water", "water")
            elseif btn.name == "Jus de fruit" then
                TriggerServerEvent('KrXDarkShop:buy', 2, "jusfruit", "jusfruit")
            elseif btn.name == "Hamburger" then
                TriggerServerEvent('KrXDarkShop:buy', 2, "burger", "burger")
            elseif btn.name == "Sandwich" then
                TriggerServerEvent('KrXDarkShop:buy', 2, "sandwich", "sandwich")
            elseif btn.name == "GPS" then
                TriggerServerEvent('KrXDarkShop:buy', 10, "gps", "gps")
            elseif btn.name == "Télephone" then
                TriggerServerEvent('KrXDarkShop:buy', 50, "phone", "phone")
        end
	end,
},
	Menu = {
		["Action :"] = {
			b = {
                {name = "Acheter Nourritures", ask = "~o~$", askX = true},
                {name = "Acheter Electronic", ask = "~o~$", askX = true}
			}
        },
        
		["acheter nourritures"] = {
			b = {
                {name = "Eau", ask = "~o~2$", askX = true},
                {name = "Pain", ask = "~o~2$", askX = true},
                {name = "Jus de fruit", ask = "~o~2$", askX = true},
                {name = "Hamburger", ask = "~o~2$", askX = true},
                {name = "Sandwich", ask = "~o~2$", askX = true}
			}
        },
        ["acheter electronic"] = {
			b = {
                {name = "GPS", ask = "~o~10$", askX = true},
                {name = "Télephone", ask = "~o~50$", askX = true}
			}
        }
	}
}

local Coffresltdsuds = {
    {x = -705.54, y = -904.99, z = 19.21}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    
        for k in pairs(Coffresltdsuds) do
                
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Coffresltdsuds[k].x, Coffresltdsuds[k].y, Coffresltdsuds[k].z)
    
            if dist <= 1.5 and PlayerData.job and PlayerData.job.name == 'ltdsud' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~b~Coffres~s~")
                if IsControlJustPressed(1,38) then
                    ExecuteCommand('e clipboard2')
                    CreateMenu(coffreltdsud) 
                    end
                end
            end
        end
    end)

---------------------
  --Patron Action--
---------------------

local patronltdsud = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Intéraction Patron" },
	Data = { currentMenu = "Action :", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
            if btn == "Entreprise" then   
                TriggerEvent('esx_society:openBossMenu', 'ltdsud', function(data, menu)
				end)
        end
	end,
},
	Menu = {
		["Action :"] = {
			b = {
				{name = "Entreprise", ask = "→", askX = true}
			}
        }
	}
}

local patronltdsuds = {
    {x = -709.66, y = -905.31, z = 19.21}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    
        for k in pairs(patronltdsuds) do
                
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, patronltdsuds[k].x, patronltdsuds[k].y, patronltdsuds[k].z)
    
            if dist <= 0.5 and PlayerData.job and PlayerData.job.name == 'ltdsud' and PlayerData.job.grade_name == 'boss' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder à l'ordinateur de ~b~l'entreprise")
                if IsControlJustPressed(1,38) then
                    CreateMenu(patronltdsud)
                    end
                end 
            end
        end
    end)
    
  

    print("^0======================================================================^7")
    print("^0[^4Author^0] ^7:^0 ^0Neo^7")
    print("^0======================================================================^7")
    
  

