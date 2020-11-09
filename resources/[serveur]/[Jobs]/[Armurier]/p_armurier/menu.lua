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
		Citizen.Wait(0)
	end

	PlayerData = ESX.GetPlayerData()
end)
----------------------------------------------------------------------------------------

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-----------------------------------------------------------------------------------------
function OpenBillingMenu()

    ESX.UI.Menu.Open(
      'dialog', GetCurrentResourceName(), 'billing',
      {
        title = "Insérer une somme pour la facture client"
      },
      function(data, menu)
      
        local amount = tonumber(data.value)
        local player, distance = ESX.Game.GetClosestPlayer()
  
        if player ~= -1 and distance <= 3.0 then
  
          menu.close()
          if amount == nil then
              ESX.ShowNotification("~r~Problèmes~s~: Le montant est invalide")
          else
              TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_armurier', ('Armurier'), amount)
              Citizen.Wait(100)
              ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
          end
  
        else
          ESX.ShowNotification("~r~Problèmes~s~: Aucun joueur à proximitée")
        end
  
      end,
      function(data, menu)
          menu.close()
      end
    )
  end

--------------------------------------------------------------------------------------------------------------------------------------------------------


function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_armurier:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = ('Stockage'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = ('Nombre SVP ?')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification('Quantité invalide')
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_armurier:getStockItem', itemName, count)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('esx_armurier:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = ('Mon Inventaire'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = ('Nombre SVP ?')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification('Quantité invalide')
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_armurier:putStockItems', itemName, count)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end



------------------------------------------------------------------------------------------

local MyMenus = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Inventaire" },
	Data = { currentMenu = "Inventaire Armurier", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			if btn == 'Prendre Stoks' then
				OpenGetStocksMenu()
				CloseMenu()
				
			elseif btn == 'Rendre Stoks' then
				OpenPutStocksMenu()
				CloseMenu()

			end

	end
},
	Menu = {
		["Inventaire Armurier"] = {
			b = {
				{name = "Prendre Stoks", ask = ">", askX = true},
				{name = "Rendre Stoks", ask = ">", askX = true},
			}
		}
	}
}

--------------- MENU F6 armurier ----------

function LoadingPrompt(loadingText, spinnerType)

    if IsLoadingPromptBeingDisplayed() then
        RemoveLoadingPrompt()
    end

    if (loadingText == nil) then
        BeginTextCommandBusyString(nil)
    else
        BeginTextCommandBusyString("STRING");
        AddTextComponentSubstringPlayerName(loadingText);
    end

    EndTextCommandBusyString(spinnerType)
end


local mobarmurierMenu = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Menu Intéraction" },
	Data = { currentMenu = "Interaction Armurier", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			
		    if btn == 'Facture' then 
				OpenBillingMenu()

		end
	end
},
	Menu = {
		["Interaction Armurier"] = {
			b = {
				{name = "Facture", ask = ">", askX = true}
			}
		}
	}
}

local MyShop = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Shops" },
	Data = { currentMenu = "Shops Armurier", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			if btn == ".357 Double Action" then 
				TriggerServerEvent('BuyDoubleaction')
			 elseif btn == "9mm" then 
				TriggerServerEvent('BuyMm') 
			elseif btn == "Pistolet de combat" then 
				TriggerServerEvent('BuyPcombat') 
			elseif btn == "Pistolet Automatique" then 
				TriggerServerEvent('BuyPauto') 
			elseif btn == "Micro-SMG" then 
				TriggerServerEvent('BuyMicrosmg') 
			elseif btn == "Mini-SMG" then 
				TriggerServerEvent('BuyMinismg') 
			elseif btn == "SMG" then 
				TriggerServerEvent('BuySmg') 
			elseif btn == "Mini-AK" then 
				TriggerServerEvent('BuyMiniak') 
			elseif btn == "M4" then 
				TriggerServerEvent('BuyM4') 
			elseif btn == "AK-47" then 
				TriggerServerEvent('BuyAK47') 
			elseif btn == "Gunsenberg" then 
				TriggerServerEvent('BuyGunsenberg') 
			elseif btn == "Fusil à pompe" then 
				TriggerServerEvent('BuyPompe') 
			elseif btn == "Fusil canon cié" then 
				TriggerServerEvent('BuyPompec') 
			elseif btn == "Fusil double action" then 
				TriggerServerEvent('BuyPompedc')
			elseif btn == "Sniper" then 
				TriggerServerEvent('BuySniper')
			elseif btn == "Chargeur" then 
				TriggerServerEvent('BuyClip') 
			end

	end
},
	Menu = {
		["Shops Armurier"] = {
			b = {
				{name = ".357 Double Action", ask = "~g~9,000$", askX = true},
				{name = "9mm", ask = "~g~10,000$", askX = true},
				{name = "Pistolet de combat", ask = "~g~11,000$", askX = true},
				{name = "Pistolet Automatique", ask = "~g~15,000$", askX = true},
				{name = "Micro-SMG", ask = "~g~20,000$", askX = true},
				{name = "Mini-SMG", ask = "~g~23,000$", askX = true},
				{name = "SMG", ask = "~g~25,000$", askX = true},
				{name = "Mini-AK", ask = "~g~40,000$", askX = true},
				{name = "M4", ask = "~g~50,000$", askX = true},
				{name = "AK-47", ask = "~g~50,000$", askX = true},
				{name = "Gunsenberg", ask = "~g~51,000$", askX = true},
				{name = "Fusil à pompe", ask = "~g~60,000$", askX = true},
				{name = "Fusil canon cié", ask = "~g~64,000$", askX = true},
				{name = "Fusil double action", ask = "~g~67,000$", askX = true},
				{name = "Sniper", ask = "~g~100,000$", askX = true},
				{name = "Chargeur", ask = "~g~200$", askX = true},
			}
		}
	}
}
---------------- FIN MENU F6 armurier ---------------

-- Create blips
Citizen.CreateThread(function()

	for k,v in pairs(Config.ArmurierStations) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('Ammu-Nation')
		EndTextCommandSetBlipName(blip)
	end

end)


local boss = {
    {x = 827.1, y = -2158.47, z = 29.61}
}
local shop = {
	{x = 809.406, y = -2159.196, z = 29.61}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlJustPressed(1,167) and PlayerData.job and PlayerData.job.name == 'armurier' then
			CreateMenu(mobarmurierMenu)
		end
		for k in pairs(shop) do 
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) 
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, shop[k].x, shop[k].y, shop[k].z) 
			if dist <= 2.0 and PlayerData.job and PlayerData.job.name == 'armurier' then 
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~g~stockage~s~") 
				if IsControlJustPressed(1,38) then 
					CreateMenu(MyShop) 
				end 
			end 
		end 
		for k in pairs(boss) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, boss[k].x, boss[k].y, boss[k].z)

            if dist <= 2.0 and PlayerData.job and PlayerData.job.name == 'armurier' and PlayerData.job.grade_name == 'boss' then
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder à l'ordinateur de ~b~l'entreprise~s~")
				if IsControlJustPressed(1,38) then 
					TriggerEvent('esx_society:openBossMenu', 'armurier', function(data, menu)
						menu.close()
					end, {wash = false})
				end
            end
        end
	end
end)


function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end
