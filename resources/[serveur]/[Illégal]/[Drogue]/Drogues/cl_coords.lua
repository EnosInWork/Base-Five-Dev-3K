Config = {}

sync = false

Citizen.CreateThread(function()

	TriggerServerEvent("SowDrogue:AntiDump")

end)

RegisterNetEvent("SowDrogue:AntiDump")

AddEventHandler("SowDrogue:AntiDump", function(conf)

	Config = conf

	sync = true

end)





local ActionEnCours = false

Citizen.CreateThread(function()

	while not sync do Wait(100) end

	local attente = 10000

	while true do

		local pPed = GetPlayerPed(-1)

		local pCoords = GetEntityCoords(pPed)

		

		local dstWeedRec = GetDistanceBetweenCoords(pCoords, Config.Weed.recolte, true)

		local dstWeedTrait = GetDistanceBetweenCoords(pCoords, Config.Weed.traitement, true)



		local dstCokeRec = GetDistanceBetweenCoords(pCoords, Config.Coke.recolte, true)

		local dstCokeTrait = GetDistanceBetweenCoords(pCoords, Config.Coke.traitement, true)



		local dstMethRec = GetDistanceBetweenCoords(pCoords, Config.Meth.recolte, true)

		local dstMethTrait = GetDistanceBetweenCoords(pCoords, Config.Meth.traitement, true)



		local dstOpiumRec = GetDistanceBetweenCoords(pCoords, Config.Opium.recolte, true)

		local dstOpiumTrait = GetDistanceBetweenCoords(pCoords, Config.Opium.traitement, true)



		local dstLsdRec = GetDistanceBetweenCoords(pCoords, Config.Lsd.recolte, true)

		local dstLsdTrait = GetDistanceBetweenCoords(pCoords, Config.Lsd.traitement, true)



		if not ActionEnCours then

			for _,v in pairs(Config.Vente) do

				local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)



				if dst < 5.0 then

					attente = 1

					DrawMarker(27, v.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 4.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

					ShowHelpNotification(v.messageVente)

					if IsControlJustPressed(1, 38) then



						BoucleIncroyableVente(v.item, v.temps, v.prixMin, v.prixMax)

					end

					break

				else

					attente = 500

				end

			end

		end



		if not ActionEnCours and attente ~= 1 then

			if dstWeedRec < 5.0 then

				attente = 1

				DrawMarker(27, Config.Weed.recolte, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

				ShowHelpNotification(Config.Weed.messageRecolte)

				if IsControlJustPressed(1, 38) then

					BoucleIncroyable(Config.Weed.itemRecolte, "recolte")

				end

			elseif dstWeedTrait < 5.0 then

				attente = 1

				DrawMarker(27, Config.Weed.traitement, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

				ShowHelpNotification(Config.Weed.messageTraitement)

				if IsControlJustPressed(1, 38) then

					BoucleIncroyable(Config.Weed.itemTraitement, "traitement", Config.Weed.itemRecolte)

				end





			elseif dstCokeRec < 5.0 then

				attente = 1

				DrawMarker(27, Config.Coke.recolte, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

				ShowHelpNotification(Config.Coke.messageRecolte)

				if IsControlJustPressed(1, 38) then

					BoucleIncroyable(Config.Coke.itemRecolte, "recolte")

				end

			elseif dstCokeTrait < 5.0 then

				attente = 1

				DrawMarker(27, Config.Coke.traitement, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

				ShowHelpNotification(Config.Coke.messageTraitement)

				if IsControlJustPressed(1, 38) then

					BoucleIncroyable(Config.Coke.itemTraitement, "traitement", Config.Coke.itemRecolte)

				end





			elseif dstMethRec < 5.0 then

				attente = 1

				DrawMarker(27, Config.Meth.recolte, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

				ShowHelpNotification(Config.Meth.messageRecolte)

				if IsControlJustPressed(1, 38) then

					BoucleIncroyable(Config.Meth.itemRecolte, "recolte")

				end

			elseif dstMethTrait < 5.0 then

				attente = 1

				DrawMarker(27, Config.Meth.traitement, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

				ShowHelpNotification(Config.Meth.messageTraitement)

				if IsControlJustPressed(1, 38) then

					BoucleIncroyable(Config.Meth.itemTraitement, "traitement", Config.Meth.itemRecolte)

				end





			elseif dstOpiumRec < 5.0 then

				attente = 1

				DrawMarker(27, Config.Opium.recolte, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

				ShowHelpNotification(Config.Opium.messageRecolte)

				if IsControlJustPressed(1, 38) then

					BoucleIncroyable(Config.Opium.itemRecolte, "recolte")

				end

			elseif dstOpiumTrait < 5.0 then

				attente = 1

				DrawMarker(27, Config.Opium.traitement, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

				ShowHelpNotification(Config.Opium.messageTraitement)

				if IsControlJustPressed(1, 38) then

					BoucleIncroyable(Config.Opium.itemTraitement, "traitement", Config.Opium.itemRecolte)

				end



			

			elseif dstLsdRec < 5.0 then

				attente = 1

				DrawMarker(27, Config.Lsd.recolte, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

				ShowHelpNotification(Config.Lsd.messageRecolte)

				if IsControlJustPressed(1, 38) then

					BoucleIncroyable(Config.Lsd.itemRecolte, "recolte")

				end

			elseif dstLsdTrait < 5.0 then

				attente = 1

				DrawMarker(27, Config.Lsd.traitement, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

				ShowHelpNotification(Config.Lsd.messageTraitement)

				if IsControlJustPressed(1, 38) then

					BoucleIncroyable(Config.Lsd.itemTraitement, "traitement", Config.Lsd.itemRecolte)

				end





				

			else

				attente = 200

			end

		end



		

		Citizen.Wait(attente)

	end

end)



local syncDrogue = false

local countDure = 0

local countTait = 0

RegisterNetEvent("SowDrogue:GetSyncDrogue")

AddEventHandler("SowDrogue:GetSyncDrogue", function(dure, trait)

	countDure = dure

	countTait = trait

	syncDrogue = true

end)



local SyncDrogueCountVente = 0

local SyncCountEtat = false

RegisterNetEvent("SowDrogue:GetItemCount")

AddEventHandler("SowDrogue:GetItemCount", function(dure)

	SyncDrogueCountVente = dure

	SyncCountEtat = true

end)



function BoucleIncroyableVente(item, temps, min, max)

	ActionEnCours = true

	SyncCountEtat = false

	stopped = false

	--print(item)

	TriggerServerEvent("SowDrogue:GetItemCount", item)

	while not SyncCountEtat do Wait(1) end

	--print(SyncDrogueCountVente)

	if SyncDrogueCountVente > 0 then

		StopAnimVente()

		local WaitTime = SyncDrogueCountVente * temps

		local randomPay = math.random(min, max)

		local randomPay = randomPay * SyncDrogueCountVente

		Citizen.CreateThread(function()

			print(stopped)

			while not stopped do

				exports["rs_prog"]:AfficherProgressbar(WaitTime)      

				Citizen.Wait(WaitTime*1000)

				exports["rs_prog"]:CacherProgressbar()

				if not stopped then

					ShowNotification("Tu a été payé ~g~"..randomPay.."$~w~ pour avoir vendu ~b~x"..SyncDrogueCountVente.."~w~ de "..item)

					TriggerServerEvent("SowDrogue:GetPaid", item, SyncDrogueCountVente, randomPay)

					stopped = true

					ActionEnCours = false

					break

				end

			end

		end)

	else 

		ShowNotification("~r~Tu n'a pas assez ~w~"..item.." ~r~sur toi")

		stopped = true

		ActionEnCours = false

	end

	--print("Fin")

	--stopped = true

	--ActionEnCours = false

end



function BoucleIncroyable(item, type, base)

	ActionEnCours = true

	if type == "recolte" then

		StopAnim()

		syncDrogue = false

		TriggerServerEvent("SowDrogue:CheckCount", item, item)

		while not syncDrogue do Wait(100) end

		Citizen.CreateThread(function()

			while not stopped do

				Wait(1)

				if countTait < 50 then

					countTait = countTait + 1

					exports["rs_prog"]:AfficherProgressbar(5.1)      

					Citizen.Wait(5001)

					exports["rs_prog"]:CacherProgressbar()

					if not stopped then

						TriggerServerEvent("SowDrogue:GiveItem", item)

					end

				else

					ShowNotification("Tu en as trop sur toi")

				end

			end

		end)

	elseif type == "traitement" then

		StopAnim()

		syncDrogue = false

		TriggerServerEvent("SowDrogue:CheckCount", base, item)

		while not syncDrogue do Wait(100) end

		Citizen.CreateThread(function()

			while not stopped do

				exports["rs_prog"]:AfficherProgressbar(5.1)      

				Citizen.Wait(5001)

				exports["rs_prog"]:CacherProgressbar()

				if countTait > 36 then

					ShowNotification("Tu as trop de pochon de drogue sur toi")

				elseif countDure < 2 then

					ShowNotification("Vous n'avez pas assez de drogue sur vous pour continuer de traiter")

				else

					if not stopped then

						countDure = countDure - 2

						countTait = countTait + 1

						TriggerServerEvent("SowDrogue:RemoveItem", base)

						TriggerServerEvent("SowDrogue:GiveItem", item)

					end

				end

			end

		end)

	end

end





local antiTriche = 0

function StopAnim()

	stopped = false

	antiTriche = antiTriche + 1

	if antiTriche > 1 then

		exports["rs_prog"]:CacherProgressbar()

		ClearPedTasks(GetPlayerPed(-1))

		stopped = true

		ActionEnCours = false

		antiTriche = 0

		ShowNotification("~r~Mmh Mmh ... Je te surveille petit tricheur ...")

	else

		Citizen.CreateThread(function()

			TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, 0)

			if antiTriche > 0 then

				while not stopped do

					Citizen.Wait(1)

					ShowHelpNotification("Appuyer sur ~INPUT_VEH_FLY_DUCK~ pour arrêter l'action en cours")

					if not IsPedActiveInScenario(GetPlayerPed(-1)) then

						ClearPedTasksImmediately(GetPlayerPed(-1))

						TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, 0)

						--ShowNotification("~r~Mmh Mmh ... Je te surveille petit tricheur ...")

					end

					if IsControlJustPressed(1, 120) then

						exports["rs_prog"]:CacherProgressbar()

						ClearPedTasks(GetPlayerPed(-1))

						stopped = true

						--ActionEnCours = false

						Wait(6000)

						stopped = true

						ActionEnCours = false

						antiTriche = 0

					end



					--if IsControlJustPressed(1, 38) then

				--		ClearPedTasks(GetPlayerPed(-1))

				--	end

				end

			else

				exports["rs_prog"]:CacherProgressbar()

				ClearPedTasks(GetPlayerPed(-1))

				stopped = true

				ActionEnCours = false

				antiTriche = 0

				ShowNotification("~r~Mmh Mmh ... Je te surveille petit tricheur ...")

			end

		end)

	end

end



function StopAnimVente()

	stopped = false

	Citizen.CreateThread(function()

		TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, 0)

		while not stopped do

			Citizen.Wait(1)

			ShowHelpNotification("Appuyer sur ~INPUT_VEH_FLY_DUCK~ pour arrêter l'animation")

			if not IsPedActiveInScenario(GetPlayerPed(-1)) then

				ClearPedTasksImmediately(GetPlayerPed(-1))

				TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, 0)

			end

		end

	end)

end



ShowNotification = function(msg)

	AddTextEntry('SowNotifSimple', msg)

	BeginTextCommandThefeedPost('SowNotifSimple')

	EndTextCommandThefeedPostTicker(false, false)

end



ShowHelpNotification = function(msg)

	AddTextEntry('SowDrogueNotif', msg)

	DisplayHelpTextThisFrame('SowDrogueNotif', false)

end