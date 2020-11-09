

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(2000)
    end
end)


local PlayerMoney, PlayerCash = 0, 0

RegisterNetEvent("solde:argent")
AddEventHandler("solde:argent", function(money, cash)
    PlayerMoney = tonumber(money)
end)

Citizen.CreateThread(function()
    while true do
        Config.GetPlayerMoney()
        Wait(2500)
    end
end)


vMenu.Add('val', 'bank', ValUI.CreateMenu("Guichet", "Liste"))


Citizen.CreateThread(function()
    while true do

        ValUI.IsVisible(vMenu:Get('val', 'bank'), true, true, true, function()

            ValUI.Separator("Propriétaire du compte : ".. GetPlayerName(PlayerId()) .."")

            ValUI.Separator("Solde Banquaire : ~g~" .. PlayerMoney .." $")

            ValUI.Button("Dépot", nil, {RightLabel = ">"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    depot_argent()
                end
            end)

            ValUI.Button("Retrait", nil, {RightLabel = ">"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    retire_argent()
                end
            end)
            
        end)
        Citizen.Wait(0)
    end
end)


local position = {
    {x = 147.61, y = -1035.83, z = 29.37}, 
	{x=-1212.980, y=-330.841, z=37.56},
	{x=-2962.582, y=482.627, z=15.703},
	{x=-112.202, y=6469.295, z=31.626},
	{x=314.187, y=-278.621, z=54.170},
	{x=-351.534, y=-49.529, z=49.042},
	{x=1175.0643310547, y=2706.6435546875, z=38.094036102295},
}  


RegisterNetEvent("menuopen")
AddEventHandler("menuopen", function()

    RequestAnimDict("amb@prop_human_atm@male@enter")
    while (not HasAnimDictLoaded("amb@prop_human_atm@male@enter")) do
        Citizen.Wait(1) 
    end
    TaskPlayAnim(PlayerPedId(),"amb@prop_human_atm@male@enter", "enter", 1.0, 1.0, 3000, 0, 1, true, true, true)
    Citizen.Wait(3000)			
    RequestAnimDict("amb@prop_human_atm@male@idle_a")
    while (not HasAnimDictLoaded("amb@prop_human_atm@male@idle_a")) do
        Citizen.Wait(1)
    end
    TaskPlayAnim(PlayerPedId(),"amb@prop_human_atm@male@idle_a", "idle_c", 1.0, -1.0, -1, 0, 1, true, true, true)
    ClearPedTasks(GetPlayerPed(-1))
    Citizen.Wait(6500)
    alreadyOnATM = false
    

    ValUI.Visible(vMenu:Get('val', 'bank'), not ValUI.Visible(vMenu:Get('val', 'bank')))
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(position) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

 
            if dist <= 0.6 then
                
                ValUI.Text({
                    message = "[~b~E~w~] Pour insérer la carte",
                    time_display = 1
                })
            
                if IsControlJustPressed(1,51) then
                    TriggerServerEvent('bank:menu')
                end
                
                if IsControlJustPressed(1, 177) then
                    RequestAnimDict("amb@prop_human_atm@male@enter")
                    while (not HasAnimDictLoaded("amb@prop_human_atm@male@enter")) do
                        Citizen.Wait(1) 
                    end
                    TaskPlayAnim(PlayerPedId(),"amb@prop_human_atm@male@enter", "enter", 1.0, 1.0, 3000, 0, 1, true, true, true)
                    Citizen.Wait(3000)			
                    RequestAnimDict("amb@prop_human_atm@male@idle_a")
                    while (not HasAnimDictLoaded("amb@prop_human_atm@male@idle_a")) do
                        Citizen.Wait(1)
                    end
                    TaskPlayAnim(PlayerPedId(),"amb@prop_human_atm@male@idle_a", "base", 1.0, -1.0, -1, 0, 1, true, true, true)
                    ClearPedTasks(GetPlayerPed(-1))
                    Citizen.Wait(6500)
                    alreadyOnATM = false
                end        
            end
        end
    end
end)


function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	-- TextEntry		-->	The Text above the typing field in the black square
	-- ExampleText		-->	An Example Text, what it should say in the typing field
	-- MaxStringLenght	-->	Maximum String Lenght

	AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
	
	blockinput = true --Blocks new input while typing if **blockinput** is used
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end 
		 
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() --Gets the result of the typing
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return result --Returns the result
	else
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return nil --Returns nil if the typing got aborted
	end
end

function retire_argent()
    local amount = KeyboardInput('', '', 4)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('RetiréArgent', amount)
        end
    end
end

function depot_argent()
    local amount = KeyboardInput('', '', 4)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('PoserArgent', amount)
        end
    end
end

Citizen.CreateThread(function()

	for i=1, #Config.kBank, 1 do

		local kblip = AddBlipForCoord(Config.kBank[i].x, Config.kBank[i].y, Config.kBank[i].z)

		SetBlipSprite (kblip, 434)
		SetBlipDisplay(kblip, 4)
		SetBlipScale  (kblip, 0.8)
		SetBlipColour (kblip, 2)
        SetBlipAsShortRange(kblip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Banque")
        EndTextCommandSetBlipName(kblip)
	end

end)