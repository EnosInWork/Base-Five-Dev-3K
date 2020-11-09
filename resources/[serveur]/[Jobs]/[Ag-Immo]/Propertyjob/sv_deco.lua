ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


TriggerEvent('esx_society:registerSociety', 'realestateagent', 'realestateagent', 'society_realestateagent', 'society_realestateagent', 'society_realestateagent', {type = 'private'})



RegisterCommand('AAI', function(source, args, rawCommand) 
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source)
if xPlayer.job.name == "realestateagent" then 
	local src = source
	local msg = rawCommand:sub(5)
	local args = msg   
	if player ~= false then 
			local name = GetPlayerName(source)
			local xPlayers	= ESX.GetPlayers()
		for i=1, #xPlayers, 1 do   
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) 
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Agent immobilier', "~b~@".. name .."", ''..msg..'', 'CHAR_AMANDA', 0) 
		end
	else
	end
else  
end
end, false) 

RegisterServerEvent('Neo_prop:Save')
AddEventHandler('Neo_prop:Save', function(name, label, entering, exit, inside, outside, ipl, isSingle, isRoom, isGateway, room_menu, price)
    local x_source = source

    MySQL.Async.fetchAll("SELECT name FROM properties WHERE name = @name", {
 
   	   ['@name'] = name,    

    }, 
    function(result)
        if result[1] ~= nil then 
       	   TriggerClientEvent('esx:showNotification', x_source, 'Ce nom éxiste déja !')
       	else 
       	   Insert(x_source, name, label, entering, exit, inside, outside, ipl, isSingle, isRoom, isGateway, room_menu, price)   
        end 
    end)
end)        

function Insert(x_source, name, label, entering, exit, inside, outside, ipl, isSingle, isRoom, isGateway, room_menu, price)
    MySQL.Async.execute('INSERT INTO properties (name, label ,entering ,`exit`,inside,outside,ipls,is_single,is_room,is_gateway,room_menu,price) VALUES (@name,@label,@entering,@exit,@inside,@outside,@ipls,@isSingle,@isRoom,@isGateway,@room_menu,@price)', 
		{
			['@name'] = name,
			['@label'] = label,
			['@entering'] = entering,
			['@exit'] = exit,
			['@inside'] = inside,
			['@outside'] = outside,
			['@ipls'] = ipl,
			['@isSingle'] = isSingle,
			['@isRoom'] = isRoom,
			['@isGateway'] = isGateway,
			['@room_menu'] = room_menu, 
			['@price'] = price,  

		}, 
		function (rowsChanged)
			TriggerClientEvent('esx:showNotification', x_source, 'Propriété bien enregistré')
		end
	)
end
