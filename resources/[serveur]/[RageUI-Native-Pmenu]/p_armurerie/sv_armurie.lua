ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Armes létal

RegisterNetEvent('buyPistoletArme')
AddEventHandler('buyPistoletArme', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15000
    local xMoney = xPlayer.getMoney()

     if xPlayer.hasWeapon('WEAPON_PISTOL') then
          TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
          if xMoney >= price then
              xPlayer.removeMoney(price)
              xPlayer.addWeapon("WEAPON_PISTOL")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Pistolet~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyPistolet50Arme')
AddEventHandler('buyPistolet50Arme', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 25000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_PISTOL50') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
           xPlayer.removeMoney(price)
           xPlayer.addWeapon("WEAPON_PISTOL50")
           TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Pistolet Calibre 50~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyRevolvertArme')
AddEventHandler('buyRevolvertArme', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 30000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_REVOLVER') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_REVOLVER")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Revolver~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('BuyClip')
AddEventHandler('BuyClip', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 500
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('clip', 1)
         TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~1x Chargeur ~s~pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

--  Amres de poing

RegisterNetEvent('buyCut')
AddEventHandler('buyCut', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 100
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_KNIFE') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_KNIFE")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Couteau~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyPoing')
AddEventHandler('buyPoing', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 225
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_KNUCKLE') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_KNUCKLE")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Poing Américain~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyBat')
AddEventHandler('buyBat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 200
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_BAT') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_BAT")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Bat de baseball~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)