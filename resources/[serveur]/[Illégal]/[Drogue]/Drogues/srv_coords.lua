RegisterNetEvent("SowDrogue:AntiDump")

AddEventHandler("SowDrogue:AntiDump", function()

    TriggerClientEvent("SowDrogue:AntiDump", source, Config)

end)





Config = {

    Vente = {

        Weed = {

            pos = vector3(-198.27, 83.12, 68.76),

            heading = 129.5,

            item = "weed_pooch",

            temps = 2, -- Temps en seconde par item, si le joueur vend 50 il attends temps x nombre secondes

            prixMin = 100,

            prixMax = 150,

            messageVente = "Appuyer sur ~INPUT_PICKUP~ pour vendre",

        },

        Coke = {

            pos = vector3(-1164.88, -1568.04, 3.55),

            heading = 261.5,

            item = "coke_pooch",

            temps = 2, -- Temps en seconde par item, si le joueur vend 50 il attends temps x nombre secondes

            prixMin = 125,

            prixMax = 185,

            messageVente = "Appuyer sur ~INPUT_PICKUP~ pour vendre",

        },

        Meth = {

            pos = vector3(109.04, 6325.90, 30.38),

            heading = 73.5,

            item = "meth_pooch",

            temps = 2, -- Temps en seconde par item, si le joueur vend 50 il attends temps x nombre secondes

            prixMin = 115,

            prixMax = 140,

            messageVente = "Appuyer sur ~INPUT_PICKUP~ pour vendre",

        },

        Opium = {

            pos = vector3(3600.64, 3657.69, 32.87),

            heading = 183.5,

            item = "opium_pooch",

            temps = 2, -- Temps en seconde par item, si le joueur vend 50 il attends temps x nombre secondes

            prixMin = 120,

            prixMax = 155,

            messageVente = "Appuyer sur ~INPUT_PICKUP~ pour vendre",

        },

        Lsd = {

            pos = vector3(927.42, -1300.3, 26.17),

            heading = 16.5,

            item = "lsd_pooch",

            temps = 2, -- Temps en seconde par item, si le joueur vend 50 il attends temps x nombre secondes

            prixMin = 135,

            prixMax = 165,

            messageVente = "Appuyer sur ~INPUT_PICKUP~ pour vendre",

        },

    },





    Weed = {

        recolte = vector3(1057.35, -3196.62, -40.16),

        traitement = vector3(1036.17, -3205.89, -39.0),

        itemRecolte = "weed",

        itemTraitement = "weed_pooch",

        messageRecolte = "Appuyer sur ~INPUT_PICKUP~ pour récolter",

        messageTraitement = "Appuyer sur ~INPUT_PICKUP~ pour traiter",

    },



    Coke = {

        recolte = vector3(1092.94, -3195.24, -39.99),

        traitement = vector3(841.69, 2116.42, 51.41),

        itemRecolte = "coke",

        itemTraitement = "coke_pooch",

        messageRecolte = "Appuyer sur ~INPUT_PICKUP~ pour récolter",

        messageTraitement = "Appuyer sur ~INPUT_PICKUP~ pour traiter",

    },



    Meth = {

        recolte = vector3(1011.12, -3194.97, -39.99),

        traitement = vector3(2051.75, 3173.92, 44.25),

        itemRecolte = "meth",

        itemTraitement = "meth_pooch",

        messageRecolte = "Appuyer sur ~INPUT_PICKUP~ pour récolter",

        messageTraitement = "Appuyer sur ~INPUT_PICKUP~ pour traiter",

    },



    Opium = {

        recolte = vector3(1131.52, -2009.87, 30.04),

        traitement = vector3(2544.84, 390.19, 107.63),

        itemRecolte = "opium",

        itemTraitement = "opium_pooch",

        messageRecolte = "Appuyer sur ~INPUT_PICKUP~ pour récolter",

        messageTraitement = "Appuyer sur ~INPUT_PICKUP~ pour traiter",

    },



    Lsd = {

        recolte = vector3(-1912.06, 1388.55, 218.15),

        traitement = vector3(1507.57, -2155.15, 76.63),

        itemRecolte = "lsd",

        itemTraitement = "lsd_pooch",

        messageRecolte = "Appuyer sur ~INPUT_PICKUP~ pour récolter",

        messageTraitement = "Appuyer sur ~INPUT_PICKUP~ pour traiter",

    },

}



ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)





RegisterNetEvent("SowDrogue:GiveItem")

AddEventHandler("SowDrogue:GiveItem", function(item)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(item, 1)

end)





RegisterNetEvent("SowDrogue:RemoveItem")

AddEventHandler("SowDrogue:RemoveItem", function(item)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem(item, 5)

end)





RegisterNetEvent("SowDrogue:CheckCount")

AddEventHandler("SowDrogue:CheckCount", function(dure, traiter)

    local _source = source

    local xPlayer = ESX.GetPlayerFromId(_source)



    local drogueDureQuantite = xPlayer.getInventoryItem(dure).count

    local drogueTraiterQuantite = xPlayer.getInventoryItem(traiter).count

    TriggerClientEvent("SowDrogue:GetSyncDrogue", source, drogueDureQuantite, drogueTraiterQuantite)

end)



RegisterNetEvent("SowDrogue:GetItemCount")

AddEventHandler("SowDrogue:GetItemCount", function(item)

    local _source = source

    local xPlayer = ESX.GetPlayerFromId(_source)



    local drogueDureQuantite = xPlayer.getInventoryItem(item).count

    TriggerClientEvent("SowDrogue:GetItemCount", source, drogueDureQuantite)

end)





RegisterNetEvent("SowDrogue:GetPaid")

AddEventHandler("SowDrogue:GetPaid", function(item, count, paid)

    local _source = source

    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem(item, count)

    xPlayer.addAccountMoney('black_money', paid)

end)