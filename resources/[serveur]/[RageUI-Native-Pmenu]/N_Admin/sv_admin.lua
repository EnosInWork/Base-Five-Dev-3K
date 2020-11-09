ESX = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) RegisterServerEvent("N_admin:givecash") AddEventHandler("N_admin:givecash", function(money) local _source = source local xPlayer = ESX.GetPlayerFromId(_source) local total = money TriggerClientEvent('esx:showNotification', _source, "Give : ~g~+ "..total.."$ ~s~(Cash)") xPlayer.addMoney((total)) end) RegisterServerEvent("N_admin:givecashbank") AddEventHandler("N_admin:givecashbank", function(money) local _source = source local xPlayer = ESX.GetPlayerFromId(_source) local total = money TriggerClientEvent('esx:showNotification', _source, "Give : ~g~+ "..total.."$ ~s~(Banque)") xPlayer.addAccountMoney('bank', total) end) RegisterServerEvent("N_admin:givecashsale") AddEventHandler("N_admin:givecashsale", function(money) local _source = source local xPlayer = ESX.GetPlayerFromId(_source) local total = money TriggerClientEvent('esx:showNotification', _source, "Give : ~g~+ "..total.."$ ~s~(Sale)") xPlayer.addAccountMoney('black_money', total) end) RegisterServerEvent("N_admin:bringplayer") AddEventHandler("N_admin:bringplayer", function(plyId, plyPedCoords) TriggerClientEvent('N_admin:bringplayer', plyId, plyPedCoords) end) ESX.RegisterServerCallback('N_admin:getgroupadmin', function(source, cb) local xPlayer = ESX.GetPlayerFromId(source) if xPlayer ~= nil then local playerGroup = xPlayer.getGroup() if playerGroup ~= nil then cb(playerGroup) else cb(nil) end else cb(nil) end end)

RegisterServerEvent('nehco:kickjoueur')
AddEventHandler('nehco:kickjoueur', function(player)
    DropPlayer(player, "Vous avez été kick !")
end)

RegisterNetEvent("Nehco:Message")
AddEventHandler("Nehco:Message", function(id, type)
	TriggerClientEvent("Nehco:envoyer", id, type)
end)