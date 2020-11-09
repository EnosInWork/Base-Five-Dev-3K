local versionac = ConfigACS.Version

LogBanToDiscord = function (playerId,reason)

    playerId = tonumber(playerId)
    local name = GetPlayerName(playerId)
    local steamid  = "Aucun"
    local license  = "Aucun"
    local discord  = "Aucun"
    local xbl      = "Aucun"
    local liveid   = "Aucun"
    local ip       = "Aucun"

    for k,v in pairs(GetPlayerIdentifiers(playerId)) do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xbl  = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            ip = string.sub(v, 4)
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(v, 9)
            discord = "<@"..discordid..">"
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        end
    end

    local discordInfo = {
        ["color"] = "15158332",
        ["type"] = "rich",
        ["title"] = "Un Joueur s'est fait détecté",
        ["description"] = "**Name : **"..name.."\n **Reason : **"..reason.."\n **ID : **"..playerId.."\n **IP : **"..ip.."\n **Steam Hex : **"..steamid.."\n **License : **"..license.."\n **Discord : **"..discord,
        ["footer"] = {
            ["text"] = '� WaveShield '..versionac
        }
    }

    PerformHttpRequest(ConfigACS.LogBanWebhook, function(err, text, headers) end, 'POST', json.encode({ username = '� WaveShield', embeds = { discordInfo } }), { ['Content-Type'] = 'application/json' })
end

ACStarted = function ()
    local discordInfo = {
        ["color"] = "15158332",
        ["type"] = "rich",
        ["title"] = "� WaveShield Started",
        ["footer"] = {
            ["text"] = '� WaveShield '..versionac
        }
    }

    PerformHttpRequest(ConfigACS.LogBanWebhook, function(err, text, headers) end, 'POST', json.encode({ username = '� WaveShield', embeds = { discordInfo } }), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf')
AddEventHandler('ayzn:detectionf748esf4esf4se85de7des7fesf5ede8sf', function(type, item)
    --local xPlayer = ESX.GetPlayerFromId(source)
    local _type = type or 'default'
    local _item = item or 'none'
    --local plyGroup = xPlayer.getGroup()

    _type = string.lower(_type)


    --if plyGroup ~= nil and (plyGroup == 'mod' or plyGroup == 'admin' or plyGroup == 'superadmin') then
        --LogBanToDiscord(source,"Membre du Staff , Bypass")
    --else
        if (_type == 'default') then
            LogBanToDiscord(source,"Unknown Readon")
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "Tu es ban",source)
        elseif (_type == 'godmode') then
            LogBanToDiscord(source,"Tried to put in godmod")
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : GodeMod",source)
        elseif (_type == 'resourcestart') then
            LogBanToDiscord(source,"Tried to start the resource ",item)
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Resource Start",source)
        elseif (_type == 'resourcestop') then
            LogBanToDiscord(source,"Tried to stop the resource ",item)
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Resource Stop",source)
        elseif (_type == 'esx') then
            LogBanToDiscord(source,"Injection Menu")
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "ESX",source)
        elseif (_type == 'spec') then
            LogBanToDiscord(source,"Tried to spectate a player")
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Anti Spectate",source)
        elseif (_type == 'resourcecounter') then
            LogBanToDiscord(source,"has a different resource number count")
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Different Resource Count",source)
        elseif (_type == 'antiblips') then
            LogBanToDiscord(source,"tried to enable players blips")
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Anti-Blips",source)
        elseif (_type == 'injection') then
            LogBanToDiscord(source,"tried to execute the command "..item)
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Blacklisted Command",source)
        elseif (_type == 'blacklisted_weapon') then
            LogBanToDiscord(source,"Blacklisted Weapon : "..item)
            --TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "Arme Blacklist",source)
        elseif (_type == 'hash') then
            LogBanToDiscord(source,"Tried to spawn a blacklisted car : "..item)
            TriggerServerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Blacklisted Car",source)
        elseif (_type == 'explosion') then
            LogBanToDiscord(source,"Tried to spawn an explosion : "..item)
            TriggerServerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Spawn Explosion",source)
        elseif (_type == 'event') then
            LogBanToDiscord(source,"Tried to trigger a blacklisted event : "..item)
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Blacklisted Event",source)
        end
    --end
end)

if ConfigACC.ExplosionProtection then
    AddEventHandler("explosionEvent",function(sender, ev)
        for _, v in ipairs(ConfigACC.BlockedExplosions) do
            if ev.explosionType == v then
                CancelEvent()
                LogBanToDiscord(sender,"Tried to Explose a player")
                TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Spawned Explosion",sender)
                return
            end
        end
    end)
end

if ConfigACC.GiveWeaponsProtection then
    AddEventHandler("giveWeaponEvent", function(sender, data)
        CancelEvent()
        print(sender.." give des armes")
        LogBanToDiscord(sender,"Tried to give weapon to a player")
        TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Give Weapon",sender)
    end)
end

if ConfigACC.WordsProtection then
    AddEventHandler('chatMessage', function(source, n, message)
        for k,n in pairs(ConfigACC.BlacklistedWords) do
        if string.match(message:lower(),n:lower()) then
            LogBanToDiscord(source,"Tried to say : "..n)
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Blacklisted Word",source)
        end
        end
    end)
end

if ConfigACC.TriggersProtection then
    for k,events in pairs(ConfigACC.BlacklistedEvents) do
        RegisterServerEvent(events)
        AddEventHandler(events, function()
            CancelEvent()
            LogBanToDiscord(source,"Tried to trigger his shit event : "..events)
            TriggerEvent("ayzn:bansqlfgyudgevsofyuesgdesdesfefesf4856se4d6es", "� WaveShield : Blacklisted Event",source)
        end)
    end
end