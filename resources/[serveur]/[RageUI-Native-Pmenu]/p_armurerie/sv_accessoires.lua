RegisterNetEvent('Skin')
AddEventHandler('Skin', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 950
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('yusuf', 1)
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~b~1x ".. ESX.GetItemLabel("yusuf") .." ~w~ pour ~g~$".. price .."~s~ !")
    else
         TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~ $"..price-xMoney.."~w~ !")
    end
end)

RegisterNetEvent('Poigne')
AddEventHandler('Poigne', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 150
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('grip', 1)
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~b~1x ".. ESX.GetItemLabel("grip") .." ~w~ pour ~g~$".. price .."~s~ !")
    else
         TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~ $"..price-xMoney.."~w~ !")
    end
end)

RegisterNetEvent('Silencieux')
AddEventHandler('Silencieux', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 500
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('silencieux', 1)
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~b~1x ".. ESX.GetItemLabel("silencieux") .." ~w~ pour ~g~$".. price .."~s~ !")
    else
         TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~ $"..price-xMoney.."~w~ !")
    end
end)

RegisterNetEvent('Lampe')
AddEventHandler('Lampe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 250
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('flashlight', 1)
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~b~1x ".. ESX.GetItemLabel("flashlight") .." ~w~ pour ~g~$".. price .."~s~ !")
    else
         TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~ $"..price-xMoney.."~w~ !")
    end
end)

RegisterNetEvent('Viseur')
AddEventHandler('Viseur', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 800
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('celownikdluga', 1)
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~b~1x ".. ESX.GetItemLabel("celownikdluga") .." ~w~ pour ~g~$".. price .."~s~ !")
    else
         TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~ $"..price-xMoney.."~w~ !")
    end
end)
