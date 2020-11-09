ESX = nil


-- Gestion GoFast
GoFastDejaFait = 1
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10*60000)
          GoFastDejaFait = GoFastDejaFait + 1
          print(GoFastDejaFait)
          TriggerClientEvent("Sync:GoFast", -1, GoFastDejaFait)
	end
end)

RegisterServerEvent("Sync:MoinUnGoFast")
AddEventHandler("Sync:MoinUnGoFast", function()
     GoFastDejaFait = GoFastDejaFait - 1
     TriggerClientEvent("Sync:GoFast", -1, GoFastDejaFait)
     print(GoFastDejaFait)
     print("-1 gofast")
end)


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()
	local xPlayers = ESX.GetPlayers()
	CopsConnected = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			CopsConnected = CopsConnected + 1
		end
	end
	SetTimeout(120 * 1000, CountCops)
end

CountCops()

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		PrixPolicierVente = CopsConnected * 50
		local r = math.random(100, 300) + PrixPolicierVente
		PrixVente = r
	end
end)
RegisterServerEvent("GoFast:VenteDuVehicule")
AddEventHandler("GoFast:VenteDuVehicule", function(bonus)
     local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)
     if not xPlayer then return; end
     local bonusFinal = bonus
     if CopsConnected < 2 then
          bonusFinal = bonusFinal / 2
     end
     if bonus > 900 then
          TriggerClientEvent('esx:showAdvancedNotification', source, 'GoFast', '~b~Récompense GoFast', '🔧~w~Véhicule en parfait état ! Bonus de ~g~'..bonusFinal..'$', 'CHAR_LESTER_DEATHWISH', 3)
     elseif bonus > 600 then
          TriggerClientEvent('esx:showAdvancedNotification', source, 'GoFast', '~b~Récompense GoFast', '🔧~w~Véhicule en états correct ! Bonus de ~g~'..bonusFinal..'$', 'CHAR_LESTER_DEATHWISH', 3)
     elseif bonus > 400 then
          TriggerClientEvent('esx:showAdvancedNotification', source, 'GoFast', '~b~Récompense GoFast', '🔧~w~Véhicule assez abimé ! Bonus de ~g~'..bonusFinal..'$', 'CHAR_LESTER_DEATHWISH', 3)
     elseif bonus > 100 then
          TriggerClientEvent('esx:showAdvancedNotification', source, 'GoFast', '~b~Récompense GoFast', '🔧~w~Véhicule complétement abimé ! Bonus de ~g~'..bonusFinal..'$', 'CHAR_LESTER_DEATHWISH', 3)
     end
     PrixVente = PrixVente + bonusFinal
     xPlayer.addMoney(PrixVente)
     TriggerClientEvent('esx:showAdvancedNotification', source, 'GoFast', '~b~Récompense GoFast', '✅~w~Vous avez gagné ~g~'..PrixVente..'$', 'CHAR_LESTER_DEATHWISH', 3)
end)

RegisterServerEvent("GoFast:MessagePolice")
AddEventHandler("GoFast:MessagePolice", function()

	local xPlayers	= ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          if xPlayer.job.name == 'police' then
               Citizen.Wait(10*1000)
               TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Indic LSPD", "~b~Message de l'indic", "D'après mes infos, un GoFast à commencé, rester attentif!", "CHAR_JOSEF", 3)
               print('Message GoFast envoyé à la police')
		end
	end

end)

RegisterServerEvent("GoFast:MessageSheriff")
AddEventHandler("GoFast:MessageSheriff", function()

	local xPlayers	= ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          if xPlayer.job.name == 'sheriff' then
               Citizen.Wait(10*1000)
               TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Indic Sheriff", "~b~Message de l'indic", "D'après mes infos, un GoFast à commencé, rester attentif!", "CHAR_JOSEF", 3)
               print('Message GoFast envoyé aux sheriff')
		end
	end

end)

