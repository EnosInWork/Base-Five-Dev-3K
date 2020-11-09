ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Armes létal

RegisterNetEvent('buyPistoletArme')
AddEventHandler('buyPistoletArme', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1500
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
    local price = 2500
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
    local price = 3000
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

RegisterNetEvent('buyVintageArme')
AddEventHandler('buyVintageArme', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 3450
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_VINTAGEPISTOL') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_VINTAGEPISTOL")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Pistolet Vintage~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyPCombatArme')
AddEventHandler('buyPCombatArme', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 3450
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_COMBATPISTOL') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_COMBATPISTOL")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Pistolet de Combat~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyPautoArme')
AddEventHandler('buyPautoArme', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 3450
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_APPISTOL') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_APPISTOL")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Pistolet Automatique~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

--  Amres de poing

RegisterNetEvent('buyCut')
AddEventHandler('buyCut', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 10
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
    local price = 20
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
    local price = 20
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

RegisterNetEvent('buyGolf')
AddEventHandler('buyGolf', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 10
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_GOLFCLUB') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_GOLFCLUB")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Club de Golf~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyPBiche')
AddEventHandler('buyPBiche', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 10
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_CROWBAR') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_CROWBAR")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Pied de biche~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyCoktail')
AddEventHandler('buyCoktail', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 25000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_MOLOTOV') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_MOLOTOV")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Coktail Molotov~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

--  Amres Lourde

RegisterNetEvent('buyMiniSMG')
AddEventHandler('buyMiniSMG', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 6000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_MINISMG') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_MINISMG")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Mini SMG~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buySMG')
AddEventHandler('buySMG', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 6500
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_SMG') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_SMG")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x SMG~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyFPompe')
AddEventHandler('buyFPompe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 6000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_PUMPSHOTGUN') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_PUMPSHOTGUN")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Fusil a pompe~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buySnipe')
AddEventHandler('buySnipe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 350000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_SNIPERRIFLE') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_SNIPERRIFLE")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Sniper~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyGrenade')
AddEventHandler('buyGrenade', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1000000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_GRENADE') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_GRENADE")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Grenade~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buySTBomb')
AddEventHandler('buySTBomb', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 2000000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_STICKYBOMB') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_STICKYBOMB")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Bombe collante~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyTec9')
AddEventHandler('buyTec9', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 6500
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_MACHINEPISTOL') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_MACHINEPISTOL")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Tech-9~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyAK47')
AddEventHandler('buyAK47', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_ASSAULTRIFLE') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_ASSAULTRIFLE")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x AK-47~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)

RegisterNetEvent('buyCRifle')
AddEventHandler('buyCRifle', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15000
    local xMoney = xPlayer.getMoney()

    if xPlayer.hasWeapon('WEAPON_CARBINERIFLE') then
     TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà un exemplaire sur vous !")
     else
     if xMoney >= price then
               xPlayer.removeMoney(price)
               xPlayer.addWeapon("WEAPON_CARBINERIFLE")
               TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Carabine d'assault~w~ ! (~g~"..price.."$~w~)")
          else
               TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~$ "..price-xMoney.."~w~")
          end
     end
end)