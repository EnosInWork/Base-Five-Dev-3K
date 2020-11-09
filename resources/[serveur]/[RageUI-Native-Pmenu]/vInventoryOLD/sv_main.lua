ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('Nehco:getUsergroup', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    cb(group)
end)

RegisterServerEvent('VMLife:Weapon_addAmmoToPedS')
AddEventHandler('VMLife:Weapon_addAmmoToPedS', function(plyId, value, quantity)
	if #(GetEntityCoords(source, false) - GetEntityCoords(plyId, false)) <= 3.0 then
		TriggerClientEvent('VMLife:Weapon_addAmmoToPedC', plyId, value, quantity)
	end
end)

ESX.RegisterServerCallback('VInventory:billing', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local bills = {}

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for i = 1, #result, 1 do
			table.insert(bills, {
				id = result[i].id,
				label = result[i].label,
				amount = result[i].amount
			})
		end

		cb(bills)
	end)
end)

function getMaximumGrade(jobname)
	local queryDone, queryResult = false, nil

	MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @jobname ORDER BY `grade` DESC ;', {
		['@jobname'] = jobname
	}, function(result)
		queryDone, queryResult = true, result
	end)

	while not queryDone do
		Citizen.Wait(10)
	end

	if queryResult[1] then
		return queryResult[1].grade
	end

	return nil
end



RegisterServerEvent('job:set')
AddEventHandler('job:set', function(job, grade)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob(job, 0)	
end)

-- RegisterServerEvent('vInventory:Boss_promouvoirplayer')
-- AddEventHandler('vInventory:Boss_promouvoirplayer', function(target)
-- 	local sourceXPlayer = ESX.GetPlayerFromId(source)
-- 	local targetXPlayer = ESX.GetPlayerFromId(target)

-- 	if (targetXPlayer.job.grade == tonumber(getMaximumGrade(sourceXPlayer.job.name)) - 1) then
-- 		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du ~r~Gouvernement~w~.')
-- 	else
-- 		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
-- 			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) + 1)

-- 			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '~w~.')
-- 			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '~w~.')
-- 		else
-- 			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
-- 		end
-- 	end
-- end)

-- RegisterServerEvent('vInventory:Boss_destituerplayer')
-- AddEventHandler('vInventory:Boss_destituerplayer', function(target)
-- 	local sourceXPlayer = ESX.GetPlayerFromId(source)
-- 	local targetXPlayer = ESX.GetPlayerFromId(target)

-- 	if (targetXPlayer.job.grade == 0) then
-- 		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous ne pouvez pas ~r~rétrograder~w~ davantage.')
-- 	else
-- 		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
-- 			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) - 1)

-- 			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~rétrogradé ' .. targetXPlayer.name .. '~w~.')
-- 			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~r~rétrogradé par ' .. sourceXPlayer.name .. '~w~.')
-- 		else
-- 			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
-- 		end
-- 	end
-- end)

-- RegisterServerEvent('vInventory:Boss_recruterplayer')
-- AddEventHandler('vInventory:Boss_recruterplayer', function(target, job, grade)
-- 	local sourceXPlayer = ESX.GetPlayerFromId(source)
-- 	local targetXPlayer = ESX.GetPlayerFromId(target)

-- 	if sourceXPlayer.job.grade_name == 'boss' then
-- 		targetXPlayer.setJob(job, grade)
-- 		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~recruté ' .. targetXPlayer.name .. '~w~.')
-- 		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~embauché par ' .. sourceXPlayer.name .. '~w~.')
-- 	end
-- end)

-- RegisterServerEvent('vInventory:Boss_virerplayer')
-- AddEventHandler('vInventory:Boss_virerplayer', function(target)
-- 	local sourceXPlayer = ESX.GetPlayerFromId(source)
-- 	local targetXPlayer = ESX.GetPlayerFromId(target)

-- 	if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
-- 		targetXPlayer.setJob('unemployed', 0)
-- 		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~viré ' .. targetXPlayer.name .. '~w~.')
-- 		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~viré par ' .. sourceXPlayer.name .. '~w~.')
-- 	else
-- 		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
-- 	end
-- end)