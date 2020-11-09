ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Intéraction pour la banque

RegisterServerEvent("PoserArgent")
AddEventHandler("PoserArgent", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getMoney()
    
    if xMoney >= total then

    xPlayer.addAccountMoney('bank', total)
    xPlayer.removeMoney(total)
         TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'FL~g~EE~s~CA', "~b~Vous avez déposer ~g~ "..total.."$ ~w~ en banque !", 'CHAR_BANK_FLEECA', 8)
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas tout cette ~r~d\'argent !")
    end    
end)

RegisterServerEvent("RetiréArgent")
AddEventHandler("RetiréArgent", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getBank()
    
    if xMoney >= total then

    xPlayer.removeAccountMoney('bank', total)
    xPlayer.addMoney(total)

         TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'FL~g~EE~s~CA', "~b~Vous avez retiré ~g~ "..total.."$ ~w~.", 'CHAR_BANK_FLEECA', 8)
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas tout cette ~r~d\'argent !")
    end    
end)

-- Voir le solde avc refresh

RegisterServerEvent("bank:solde") 
AddEventHandler("bank:solde", function(action, amount)

    local xPlayer = ESX.GetPlayerFromId(source)

    local playerMoney = xPlayer.getBank()

    TriggerClientEvent("solde:argent", source, playerMoney)
end)

-- Sa nous donne la carte banquaire

RegisterServerEvent('bank:carte')
AddEventHandler('bank:carte', function()
     local _source = source
     local xPlayer = ESX.GetPlayerFromId(source)
 
     local price = 15
     local item = 'carte'
     local carte = xPlayer.getInventoryItem(item).count
  
     if xPlayer.getMoney() >= price then
          TriggerClientEvent('esx:showNotification', source, "~o~Transaction~s~ :\npaiement ~g~accepté~s~\nvous avez payer ~g~".. price .."$") 
           xPlayer.removeMoney(price)
          xPlayer.addInventoryItem(item, 1)
      else
           TriggerClientEvent('esx:showNotification', source, "~o~Transaction~s~ :\npaiement ~r~non accepté")
     end
end)

-- Ouvrir les menus

RegisterNetEvent('bank:menu')
AddEventHandler('bank:menu', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local carte = xPlayer.getInventoryItem('carte').count

    if carte  <=0 then
     TriggerClientEvent('esx:showNotification', source, '~s~Allez crée un compte à la ~g~Pacific Bank~s~.')
    else
     TriggerClientEvent('menuopen', source)  
end
end)


RegisterNetEvent('bank:menucentral')
AddEventHandler('bank:menucentral', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local carte = xPlayer.getInventoryItem('carte').count

    if carte  <=0 then
     TriggerClientEvent('menucentral', source)
    else
     TriggerClientEvent('esx:showNotification', source, 'Vous avez déja un ~b~Compte bancaire~s~.')
     end
end)