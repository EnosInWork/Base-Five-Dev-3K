ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

------------------------------------------------------------------------------------
---------------------------- Métiers Non Whitelist----------------------------------
------------------------------------------------------------------------------------

RegisterNetEvent('powx_tuto:BuyAbatteur')
AddEventHandler('powx_tuto:BuyAbatteur', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.setJob("slaughterer", 0)
        TriggerClientEvent('esx:showNotification', source, "~b~Félicitation~w~ ! Vous êtes embauché chez les ~b~Abatteurs~w~ en tant que ~g~Intérimaire.")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyBucheron')
AddEventHandler('powx_tuto:BuyBucheron', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.setJob("lumberjack", 0)
        TriggerClientEvent('esx:showNotification', source, "~b~Félicitation~w~ ! Vous êtes embauché chez les ~b~Bûcherons~w~ en tant que ~g~Intérimaire.")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyCouturier')
AddEventHandler('powx_tuto:BuyCouturier', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.setJob("tailor", 0)
        TriggerClientEvent('esx:showNotification', source, "~b~Félicitation~w~ ! Vous êtes embauché chez les ~b~Couturiers~w~ en tant que ~g~Intérimaire.")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyMineur')
AddEventHandler('powx_tuto:BuyMineur', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.setJob("miner", 0)
        TriggerClientEvent('esx:showNotification', source, "~b~Félicitation~w~ ! Vous êtes embauché chez les ~b~Mineurs~w~ en tant que ~g~Intérimaire.")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyPecheur')
AddEventHandler('powx_tuto:BuyPecheur', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.setJob("fisherman", 0)
        TriggerClientEvent('esx:showNotification', source, "~b~Félicitation~w~ ! Vous êtes embauché chez les ~b~Pêcheurs~w~ en tant que ~g~Intérimaire.")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyRaffineur')
AddEventHandler('powx_tuto:BuyRaffineur', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.setJob("fueler", 0)
        TriggerClientEvent('esx:showNotification', source, "~b~Félicitation~w~ ! Vous êtes embauché chez les ~b~Raffineurs~w~ en tant que ~g~Intérimaire.")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyChomeur')
AddEventHandler('powx_tuto:BuyChomeur', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.setJob("unemployed", 0)
        TriggerClientEvent('esx:showNotification', source, "Vous êtes un ~r~chômeur")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


------------------------------------------------------------------------------------
---------------------------- Métiers Whitelist--------------------------------------
------------------------------------------------------------------------------------

RegisterNetEvent('powx_tuto:BuyPolice')
AddEventHandler('powx_tuto:BuyPolice', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Pour intégrer la ~b~LSPD~w~, veuillez rédiger une ~b~candidature~w~ sur ~g~Discord~w~")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyEMS')
AddEventHandler('powx_tuto:BuyEMS', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Pour intégrer les ~b~EMS~w~, veuillez rédiger une ~b~candidature~w~ sur ~g~Discord~w~")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyConcess')
AddEventHandler('powx_tuto:BuyConcess', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Pour intégrer la ~b~Concession~w~, veuillez rédiger une ~b~candidature~w~ sur ~g~Discord~w~")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyMecano')
AddEventHandler('powx_tuto:BuyMecano', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Pour intégrer le ~b~Mécano~w~, veuillez rédiger une ~b~candidature~w~ sur ~g~Discord~w~")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyTabac')
AddEventHandler('powx_tuto:BuyTabac', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Pour intégrer le ~b~Tabac~w~, veuillez rédiger une ~b~candidature~w~ sur ~g~Discord~w~")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyVigneron')
AddEventHandler('powx_tuto:BuyVigneron', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Pour intégrer les ~b~Vignerons~w~, veuillez rédiger une ~b~candidature~w~ sur ~g~Discord~w~")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('powx_tuto:BuyTaxi')
AddEventHandler('powx_tuto:BuyTaxi', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Pour intégrer les ~b~Taxis~w~, veuillez rédiger une ~b~candidature~w~ sur ~g~Discord~w~")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)



