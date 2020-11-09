ESX          = nil

bandana = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)  
-------------------Masque
RegisterNetEvent('n_vetement:Masque1') 
AddEventHandler('n_vetement:Masque1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId() 
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 1 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)
RegisterNetEvent('n_vetement:Masque1_2') 
AddEventHandler('n_vetement:Masque1_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 1 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)
RegisterNetEvent('n_vetement:Masque1_3') 
AddEventHandler('n_vetement:Masque1_3', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 1 ,2, 2)  
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)




RegisterNetEvent('n_vetement:Masque2')
AddEventHandler('n_vetement:Masque2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 2 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)

RegisterNetEvent('n_vetement:Masque2_1')
AddEventHandler('n_vetement:Masque2_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 2 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)

RegisterNetEvent('n_vetement:Masque2_2')
AddEventHandler('n_vetement:Masque2_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 2 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)
 

RegisterNetEvent('n_vetement:Masque3')
AddEventHandler('n_vetement:Masque3', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 3 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)


RegisterNetEvent('n_vetement:Masque4')
AddEventHandler('n_vetement:Masque4', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 4 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)
RegisterNetEvent('n_vetement:Masque4_1')
AddEventHandler('n_vetement:Masque4_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 4 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)
RegisterNetEvent('n_vetement:Masque4_2')
AddEventHandler('n_vetement:Masque4_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 4 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)


RegisterNetEvent('n_vetement:Masque5')
AddEventHandler('n_vetement:Masque5', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 5 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)
RegisterNetEvent('n_vetement:Masque5_1')
AddEventHandler('n_vetement:Masque5_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 5 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)
RegisterNetEvent('n_vetement:Masque5_2')
AddEventHandler('n_vetement:Masque5_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 5 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2) 
	end
end)


RegisterNetEvent('n_vetement:Masque6')
AddEventHandler('n_vetement:Masque6', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then 
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 6 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)
RegisterNetEvent('n_vetement:Masque6_1')
AddEventHandler('n_vetement:Masque6_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then 
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 6 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)
RegisterNetEvent('n_vetement:Masque6_2')
AddEventHandler('n_vetement:Masque6_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then 
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 6 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)


RegisterNetEvent('n_vetement:Masque7')
AddEventHandler('n_vetement:Masque7', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 7 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)
RegisterNetEvent('n_vetement:Masque7_1')
AddEventHandler('n_vetement:Masque7_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 7 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)
RegisterNetEvent('n_vetement:Masque7_2')
AddEventHandler('n_vetement:Masque7_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 7 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)


RegisterNetEvent('n_vetement:Masque8')
AddEventHandler('n_vetement:Masque8', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 8 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)
RegisterNetEvent('n_vetement:Masque8_1')
AddEventHandler('n_vetement:Masque8_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 8 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)
RegisterNetEvent('n_vetement:Masque8_2')
AddEventHandler('n_vetement:Masque8_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 8 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)   


RegisterNetEvent('n_vetement:Masque9')
AddEventHandler('n_vetement:Masque9', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 9 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)
RegisterNetEvent('n_vetement:Masque9_1')
AddEventHandler('n_vetement:Masque9_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 9 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)
RegisterNetEvent('n_vetement:Masque9_2')
AddEventHandler('n_vetement:Masque9_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 9 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)  
	end
end)


RegisterNetEvent('n_vetement:Masque10')
AddEventHandler('n_vetement:Masque10', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 10 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque10_1')
AddEventHandler('n_vetement:Masque10_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 10 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque10_2')
AddEventHandler('n_vetement:Masque10_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 10 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
 

RegisterNetEvent('n_vetement:Masque11')
AddEventHandler('n_vetement:Masque11', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 11 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque11_1')
AddEventHandler('n_vetement:Masque11_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 11 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque11_2')
AddEventHandler('n_vetement:Masque11_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 11 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque12')
AddEventHandler('n_vetement:Masque12', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 12 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque12_1')
AddEventHandler('n_vetement:Masque12_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 12 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque12_2')
AddEventHandler('n_vetement:Masque12_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 12 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque13')
AddEventHandler('n_vetement:Masque13', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 13 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque13_1')
AddEventHandler('n_vetement:Masque13_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 13 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)    
RegisterNetEvent('n_vetement:Masque13_2')
AddEventHandler('n_vetement:Masque13_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 13 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  



RegisterNetEvent('n_vetement:Masque14')
AddEventHandler('n_vetement:Masque14', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 14 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque14_1')
AddEventHandler('n_vetement:Masque14_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 14 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque14_2')
AddEventHandler('n_vetement:Masque14_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 14 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque15')
AddEventHandler('n_vetement:Masque15', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 15 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque15_1')
AddEventHandler('n_vetement:Masque15_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 15 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque15_2')
AddEventHandler('n_vetement:Masque15_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 15 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque16')
AddEventHandler('n_vetement:Masque16', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 16 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque16_1')
AddEventHandler('n_vetement:Masque16_1', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 16 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque16_2')
AddEventHandler('n_vetement:Masque16_2', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 16 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque17') 
AddEventHandler('n_vetement:Masque17', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 17 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque17_1') 
AddEventHandler('n_vetement:Masque17_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 17 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque17_2') 
AddEventHandler('n_vetement:Masque17_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 17 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque18')
AddEventHandler('n_vetement:Masque18', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 18 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque18_1')
AddEventHandler('n_vetement:Masque18_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 18 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque18_2')
AddEventHandler('n_vetement:Masque18_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 18 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque19')
AddEventHandler('n_vetement:Masque19', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 19 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque19_1')
AddEventHandler('n_vetement:Masque19_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 19 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque19_2')
AddEventHandler('n_vetement:Masque19_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 19 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque20')
AddEventHandler('n_vetement:Masque20', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 20 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque20_1')
AddEventHandler('n_vetement:Masque20_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 20 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque20_2')
AddEventHandler('n_vetement:Masque20_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 20 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque21')
AddEventHandler('n_vetement:Masque21', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 21 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque21_1')
AddEventHandler('n_vetement:Masque21_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 21 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque21_2')
AddEventHandler('n_vetement:Masque21_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 21 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)


RegisterNetEvent('n_vetement:Masque22')
AddEventHandler('n_vetement:Masque22', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 22 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque22_1')
AddEventHandler('n_vetement:Masque22_1', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 22 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque22_2')
AddEventHandler('n_vetement:Masque22_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 22 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque23')
AddEventHandler('n_vetement:Masque23', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 23 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque23_1')
AddEventHandler('n_vetement:Masque23_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 23 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque23_2')
AddEventHandler('n_vetement:Masque23_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 23 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque24')
AddEventHandler('n_vetement:Masque24', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 24 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque24_1')
AddEventHandler('n_vetement:Masque24_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 24 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  
RegisterNetEvent('n_vetement:Masque24_2')
AddEventHandler('n_vetement:Masque24_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 24 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque25')
AddEventHandler('n_vetement:Masque25', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 25 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque25_1')
AddEventHandler('n_vetement:Masque25_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 25 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  
RegisterNetEvent('n_vetement:Masque25_2')
AddEventHandler('n_vetement:Masque25_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 25 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque26')
AddEventHandler('n_vetement:Masque26', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 26 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque26_1')
AddEventHandler('n_vetement:Masque26_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 26 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque26_2')
AddEventHandler('n_vetement:Masque26_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 26 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque27')
AddEventHandler('n_vetement:Masque27', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 27 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque27_1')
AddEventHandler('n_vetement:Masque27_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 27 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  
RegisterNetEvent('n_vetement:Masque27_2') 
AddEventHandler('n_vetement:Masque27_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 27 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque28')
AddEventHandler('n_vetement:Masque28', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 28 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque28_1')
AddEventHandler('n_vetement:Masque28_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 28 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque28_2')
AddEventHandler('n_vetement:Masque28_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 28 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque29')
AddEventHandler('n_vetement:Masque29', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 29 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque29_1')
AddEventHandler('n_vetement:Masque29_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 29 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  
RegisterNetEvent('n_vetement:Masque29_2')
AddEventHandler('n_vetement:Masque29_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 29 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  


RegisterNetEvent('n_vetement:Masque30')
AddEventHandler('n_vetement:Masque30', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 30 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque30_1')
AddEventHandler('n_vetement:Masque30_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 30 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque30_2')
AddEventHandler('n_vetement:Masque30_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 30 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque31')
AddEventHandler('n_vetement:Masque31', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 31 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque31_1')
AddEventHandler('n_vetement:Masque31_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 31 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque31_2')
AddEventHandler('n_vetement:Masque31_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 31 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque32')
AddEventHandler('n_vetement:Masque32', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 32 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque32_1')
AddEventHandler('n_vetement:Masque32_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 32 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque32_2')
AddEventHandler('n_vetement:Masque32_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 32 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque33')
AddEventHandler('n_vetement:Masque33', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 33 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque33_1')
AddEventHandler('n_vetement:Masque33_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 33 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque33_2')
AddEventHandler('n_vetement:Masque33_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 33 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque34')
AddEventHandler('n_vetement:Masque34', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 34 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque34_1')
AddEventHandler('n_vetement:Masque34_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 34 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque34_2')
AddEventHandler('n_vetement:Masque34_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 34 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque35')
AddEventHandler('n_vetement:Masque35', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 35 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque35_1')
AddEventHandler('n_vetement:Masque35_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 35 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque35_2')
AddEventHandler('n_vetement:Masque35_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 35 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque36')
AddEventHandler('n_vetement:Masque36', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 36 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque36_1')
AddEventHandler('n_vetement:Masque36_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 36 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque36_2')
AddEventHandler('n_vetement:Masque36_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 36 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque37')
AddEventHandler('n_vetement:Masque37', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 37 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque37_1')
AddEventHandler('n_vetement:Masque37_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 37 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque37_2')
AddEventHandler('n_vetement:Masque37_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 37 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
 
 
RegisterNetEvent('n_vetement:Masque38')
AddEventHandler('n_vetement:Masque38', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 38 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque38_1')
AddEventHandler('n_vetement:Masque38_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 38 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque38_2')
AddEventHandler('n_vetement:Masque38_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 38 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque39')
AddEventHandler('n_vetement:Masque39', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 39 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque39_1')
AddEventHandler('n_vetement:Masque39_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 39 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque39_2')
AddEventHandler('n_vetement:Masque39_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 39 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 



RegisterNetEvent('n_vetement:Masque40')
AddEventHandler('n_vetement:Masque40', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 40 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque40_1')
AddEventHandler('n_vetement:Masque40_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 40 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque40_2')
AddEventHandler('n_vetement:Masque40_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 40 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)


RegisterNetEvent('n_vetement:Masque41')
AddEventHandler('n_vetement:Masque41', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 41 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque41_1')
AddEventHandler('n_vetement:Masque41_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 41 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque41_2')
AddEventHandler('n_vetement:Masque41_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 41 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque42')
AddEventHandler('n_vetement:Masque42', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 42 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque42_1')
AddEventHandler('n_vetement:Masque42_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 42 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque42_2')
AddEventHandler('n_vetement:Masque42_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 42 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque43')
AddEventHandler('n_vetement:Masque43', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 43 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque43_1')
AddEventHandler('n_vetement:Masque43_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 43 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque43_2')
AddEventHandler('n_vetement:Masque43_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 43 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque44')
AddEventHandler('n_vetement:Masque44', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 44 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque44_1')
AddEventHandler('n_vetement:Masque44_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 44 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque44_2')
AddEventHandler('n_vetement:Masque44_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 44 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque45')
AddEventHandler('n_vetement:Masque45', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 45 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque45_1')
AddEventHandler('n_vetement:Masque45_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 45 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque45_2')
AddEventHandler('n_vetement:Masque45_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 45 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque46')
AddEventHandler('n_vetement:Masque46', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 46 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque46_1')
AddEventHandler('n_vetement:Masque46_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 46 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque46_2')
AddEventHandler('n_vetement:Masque46_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 46 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque47')
AddEventHandler('n_vetement:Masque47', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 47 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque47_1')
AddEventHandler('n_vetement:Masque47_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 47 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque47_2')
AddEventHandler('n_vetement:Masque47_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 47 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque48')
AddEventHandler('n_vetement:Masque48', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 48 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque48_1')
AddEventHandler('n_vetement:Masque48_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 48 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque48_2')
AddEventHandler('n_vetement:Masque48_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 48 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque49')
AddEventHandler('n_vetement:Masque49', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 49 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque49_1')
AddEventHandler('n_vetement:Masque49_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 49 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque49_2')
AddEventHandler('n_vetement:Masque49_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads ) 
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 49 ,2, 2)  
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque50')
AddEventHandler('n_vetement:Masque50', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 50 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque50_1')
AddEventHandler('n_vetement:Masque50_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 50 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque50_2')
AddEventHandler('n_vetement:Masque50_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 50 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  
RegisterNetEvent('n_vetement:Masque50_3')
AddEventHandler('n_vetement:Masque50_3', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 50 ,3, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque50_4')
AddEventHandler('n_vetement:Masque50_4', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 50 ,4, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque50_5')
AddEventHandler('n_vetement:Masque50_5', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 50 ,5, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque50_6')
AddEventHandler('n_vetement:Masque50_6', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 50 ,6, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque50_7')
AddEventHandler('n_vetement:Masque50_7', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 50 ,7, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque50_8')
AddEventHandler('n_vetement:Masque50_8', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 50 ,8, 2)  
	elseif bandana then
	bandana = false
	RequestAnimDict(dict) 
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque50_9')
AddEventHandler('n_vetement:Masque50_9', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 50 ,9, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)


RegisterNetEvent('n_vetement:Masque51')
AddEventHandler('n_vetement:Masque51', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 51 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque51_1')
AddEventHandler('n_vetement:Masque51_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 51 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque51_2')
AddEventHandler('n_vetement:Masque51_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 51 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque51_3')
AddEventHandler('n_vetement:Masque51_3', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 51 ,3, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  
RegisterNetEvent('n_vetement:Masque51_4')
AddEventHandler('n_vetement:Masque51_4', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 51 ,4, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque51_5')
AddEventHandler('n_vetement:Masque51_5', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 51 ,5, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque51_6')
AddEventHandler('n_vetement:Masque51_6', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 51 ,6, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque51_7')
AddEventHandler('n_vetement:Masque51_7', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 51 ,7, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque51_8')
AddEventHandler('n_vetement:Masque51_8', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 51 ,8, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque51_9')
AddEventHandler('n_vetement:Masque51_9', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 51 ,9, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)




RegisterNetEvent('n_vetement:Masque52')
AddEventHandler('n_vetement:Masque52', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 52 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque52_1')
AddEventHandler('n_vetement:Masque52_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 52 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque52_2')
AddEventHandler('n_vetement:Masque52_2', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 52 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque52_3')
AddEventHandler('n_vetement:Masque52_3', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 52 ,3, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque52_4')
AddEventHandler('n_vetement:Masque52_4', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 52 ,4, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque52_5')
AddEventHandler('n_vetement:Masque52_5', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 52 ,5, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque52_6')
AddEventHandler('n_vetement:Masque52_6', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 52 ,6, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque52_7')
AddEventHandler('n_vetement:Masque52_7', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 52 ,7, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque52_8')
AddEventHandler('n_vetement:Masque52_8', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 52 ,8, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque52_9')
AddEventHandler('n_vetement:Masque52_9', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 52 ,9, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 






RegisterNetEvent('n_vetement:Masque53')
AddEventHandler('n_vetement:Masque53', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 53 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque53_1')
AddEventHandler('n_vetement:Masque53_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 53 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque53_2')
AddEventHandler('n_vetement:Masque53_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 53 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque53_3')
AddEventHandler('n_vetement:Masque53_3', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 53 ,3, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque53_4')
AddEventHandler('n_vetement:Masque53_4', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 53 ,4, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  
RegisterNetEvent('n_vetement:Masque53_5')
AddEventHandler('n_vetement:Masque53_5', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 53 ,5, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque53_6')
AddEventHandler('n_vetement:Masque53_6', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict) 
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 53 ,6, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque53_7')
AddEventHandler('n_vetement:Masque53_7', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 53 ,7, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque53_8')
AddEventHandler('n_vetement:Masque53_8', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 53 ,8, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  
RegisterNetEvent('n_vetement:Masque53_9')
AddEventHandler('n_vetement:Masque53_9', function()  
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 53 ,9, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque54')
AddEventHandler('n_vetement:Masque54', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 54 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque54_1') 
AddEventHandler('n_vetement:Masque54_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 54 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  
RegisterNetEvent('n_vetement:Masque54_2')
AddEventHandler('n_vetement:Masque54_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 54 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque54_3')
AddEventHandler('n_vetement:Masque54_3', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads ) 
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 54 ,3, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque54_4')
AddEventHandler('n_vetement:Masque54_4', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 54 ,4, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque54_5')
AddEventHandler('n_vetement:Masque54_5', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 54 ,5, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque54_6')
AddEventHandler('n_vetement:Masque54_6', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 54 ,6, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque54_7')
AddEventHandler('n_vetement:Masque54_7', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 54 ,7, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque54_8')
AddEventHandler('n_vetement:Masque54_8', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 54 ,8, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque54_9')
AddEventHandler('n_vetement:Masque54_9', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 54 ,9, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  








RegisterNetEvent('n_vetement:Masque55')
AddEventHandler('n_vetement:Masque55', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 55 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque55_1')
AddEventHandler('n_vetement:Masque55_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 55 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque55_2')
AddEventHandler('n_vetement:Masque55_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 55 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque56')
AddEventHandler('n_vetement:Masque56', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict) 
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 56 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque56_1')
AddEventHandler('n_vetement:Masque56_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict) 
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 56 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque56_2')
AddEventHandler('n_vetement:Masque56_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict) 
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 56 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 



RegisterNetEvent('n_vetement:Masque57')
AddEventHandler('n_vetement:Masque57', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 57 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque57_1')
AddEventHandler('n_vetement:Masque57_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 57 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque57_2')
AddEventHandler('n_vetement:Masque57_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 57 ,2, 2)  
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 


RegisterNetEvent('n_vetement:Masque58')
AddEventHandler('n_vetement:Masque58', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 58 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque58_1')
AddEventHandler('n_vetement:Masque58_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 58 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque58_2')
AddEventHandler('n_vetement:Masque58_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 58 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)


RegisterNetEvent('n_vetement:Masque59')
AddEventHandler('n_vetement:Masque59', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 59 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)
RegisterNetEvent('n_vetement:Masque59_1')
AddEventHandler('n_vetement:Masque59_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 59 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque59_2')
AddEventHandler('n_vetement:Masque59_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 59 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)    

RegisterNetEvent('n_vetement:Masque60')
AddEventHandler('n_vetement:Masque60', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 60 ,0, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque60_1')
AddEventHandler('n_vetement:Masque60_1', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 60 ,1, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end) 
RegisterNetEvent('n_vetement:Masque60_2')
AddEventHandler('n_vetement:Masque60_2', function() 
   --local ad = "missheist_agency2ahelmet" 
   --local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   --loadAnimDict( ad )
   --loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedComponentVariation(player, 1, 60 ,2, 2) 
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0, 2)   
	end
end)  
 

print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^0 ^0n^7")
print("^0======================================================================^7") 


function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

