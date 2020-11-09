ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('buyWater')
AddEventHandler('buyWater', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePain
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('water', 1)
end)

RegisterNetEvent('buyRedbull')
AddEventHandler('buyRedbull', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePain
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('redbull', 1)
end)

RegisterNetEvent('buyMenergy')
AddEventHandler('buyMenergy', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePain
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('menergy', 1)
end)

RegisterNetEvent('buyChocolat')
AddEventHandler('buyChocolat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceChocolat
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('chocolate', 1)
end)

RegisterNetEvent('buySAC')
AddEventHandler('buySAC', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceSAC
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('bag', 1)
end)

RegisterNetEvent('buyJUM')
AddEventHandler('buyJUM', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceJUM
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('jumelles', 1)
end)

RegisterNetEvent('BuyLimonade')
AddEventHandler('BuyLimonade', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCocaCola
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('limonade', 1)
end)

RegisterNetEvent('buyIcetea')
AddEventHandler('buyIcetea', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePain
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('icetea', 1)
end)

RegisterNetEvent('BuySaucisson')
AddEventHandler('BuySaucisson', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePain
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('saucisson', 1)
end)

RegisterNetEvent('buyCafe')
AddEventHandler('buyCafe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCafe
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('coffe', 1)
end)

RegisterNetEvent('buyLait')
AddEventHandler('buyLait', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceLait
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('milk', 1)
end)

RegisterNetEvent('buyPain')
AddEventHandler('buyPain', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePain
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('bread', 1)
end)

RegisterNetEvent('buySandwich')
AddEventHandler('buySandwich', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceSandwich
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('sandwich', 1)
end)

RegisterNetEvent('buyHumburger')
AddEventHandler('buyHumburegr', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePain
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('humburger', 1)
end)

RegisterNetEvent('buyCupCake')
AddEventHandler('buyCupCake', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCupCake
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('cupcake', 1)
end)

RegisterNetEvent('buyGPS')
AddEventHandler('buyGPS', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceGPS
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('gps', 1)
end)

RegisterNetEvent('buyTEL')
AddEventHandler('buyTEL', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceTEL
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('tel', 1)
end)

RegisterNetEvent('buySIM')
AddEventHandler('buySIM', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceSIM
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('sim', 1)
end)
