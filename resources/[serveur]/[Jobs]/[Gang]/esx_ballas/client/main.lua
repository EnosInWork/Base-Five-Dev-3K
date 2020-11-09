local Keys = {

  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F11"] = 344,

  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,

  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,

  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,

  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,

  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,

  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,

  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,

  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118

}



local PlayerData                = {}

local GUI                       = {}

local HasAlreadyEnteredMarker   = false

local LastStation               = nil

local LastPart                  = nil

local LastPartNum               = nil

local LastEntity                = nil

local CurrentAction             = nil

local CurrentActionMsg          = ''

local CurrentActionData         = {}

local IsHandcuffed              = false

local IsDragged                 = false

local CopPed                    = 0



ESX                             = nil

GUI.Time                        = 0




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
Citizen.CreateThread(function()

  while ESX == nil do

    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    Citizen.Wait(0)

  end

end)



function SetVehicleMaxMods(vehicle)



  local props = {

    modEngine       = 2,

    modBrakes       = 2,

    modTransmission = 2,

    modSuspension   = 3,

    modTurbo        = true,

  }



  ESX.Game.SetVehicleProperties(vehicle, props)



end



function OpenCloakroomMenu()



  local elements = {

    {label = _U('citizen_wear'), value = 'citizen_wear'},

    {label = _U('ballas_wear'), value = 'ballas_wear'}

  }



  ESX.UI.Menu.CloseAll()



  if Config.EnableNonFreemodePeds then

    table.insert(elements, {label = _U('sheriff_wear'), value = 'sheriff_wear'})

    table.insert(elements, {label = _U('lieutenant_wear'), value = 'lieutenant_wear'})

    table.insert(elements, {label = _U('commandant_wear'), value = 'commandant_wear'})

  end



    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'cloakroom',

      {

        
        title    = _U('cloakroom'),
        align    = 'top-left',
        elements = elements,

        },



        function(data, menu)



      menu.close()



      --Taken from SuperCoolNinja

      if data.current.value == 'citizen_wear' then

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

          local model = nil



          if skin.sex == 0 then

            model = GetHashKey("mp_m_freemode_01")

          else

            model = GetHashKey("mp_f_freemode_01")

          end



          RequestModel(model)

          while not HasModelLoaded(model) do

            RequestModel(model)

            Citizen.Wait(1)

          end



          SetPlayerModel(PlayerId(), model)

          SetModelAsNoLongerNeeded(model)



          TriggerEvent('skinchanger:loadSkin', skin)

          TriggerEvent('esx:restoreLoadout')

        end)

      end



      if data.current.value == 'ballas_wear' then



        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)



          if skin.sex == 0 then

            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)

          else

            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)

          end



        end)



      end



      if data.current.value == 'ballas_wear' then



        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)



        if skin.sex == 0 then

					local clothesSkin = {

            		['tshirt_1'] = 13,    ['tshirt_2'] = 2,

					['ears_1'] = -1, 	  ['ears_2'] = 0,

            		['torso_1'] = 58,     ['torso_2'] = 0,

            		['decals_1'] = 0,     ['decals_2']= 0,

            		['mask_1'] = 0, 	  ['mask_2'] = 0,

            		['arms'] = 33,

            		['pants_1'] = 4, 	  ['pants_2'] = 0,

            		['shoes_1'] = 10,     ['shoes_2'] = 0,

            		['helmet_1'] 	= 12,  ['helmet_2'] = 1,

            		['bags_1'] = 0,      ['bags_2'] = 0,

					['glasses_1'] = 0,    ['glasses_2'] = 0,

					['chain_1'] = 0,      ['chain_2'] = 0,

            		['bproof_1'] = 0,     ['bproof_2'] = 0

					}

		  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		  

          RequestModel(model)

          while not HasModelLoaded(model) do

            RequestModel(model)

            Citizen.Wait(0)

          end



          SetPlayerModel(PlayerId(), model)

          SetModelAsNoLongerNeeded(model)

          end



        end)

      end





      CurrentAction     = 'menu_cloakroom'

      CurrentActionMsg  = _U('open_cloackroom')

      CurrentActionData = {}



    end,

    function(data, menu)



      menu.close()



      CurrentAction     = 'menu_cloakroom'

      CurrentActionMsg  = _U('open_cloackroom')

      CurrentActionData = {}

    end

  )



end



function OpenArmoryMenu(station)



  if Config.EnableArmoryManagement then



    local elements = {

      {label = _U('get_weapon'), value = 'get_weapon'},

      {label = _U('put_weapon'), value = 'put_weapon'},

      {label = 'Prendre Objet',  value = 'get_stock'},

      {label = 'Déposer objet',  value = 'put_stock'}

    }

	-- double job

    if PlayerData.job then

      table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})

    end

	if PlayerData.job2 then

      table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})

    end

	if PlayerData.job3 then

      table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})

    end



    ESX.UI.Menu.CloseAll()



    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'armory',

      {

        title    = _U('armory'),

        align    = 'top-left',

        elements = elements,

      },

      function(data, menu)



        if data.current.value == 'get_weapon' then

          OpenGetWeaponMenu()

        end



        if data.current.value == 'put_weapon' then

          OpenPutWeaponMenu()

        end



        if data.current.value == 'buy_weapons' then

          OpenBuyWeaponsMenu(station)

        end



        if data.current.value == 'put_stock' then

              OpenPutStocksMenu()

            end



            if data.current.value == 'get_stock' then

              OpenGetStocksMenu()

            end



      end,

      function(data, menu)



        menu.close()



        CurrentAction     = 'menu_armory'

        CurrentActionMsg  = _U('open_armory')

        CurrentActionData = {station = station}

      end

    )



  else



    local elements = {}



    for i=1, #Config.YakuzaStations[station].AuthorizedWeapons, 1 do

      local weapon = Config.YakuzaStations[station].AuthorizedWeapons[i]

      table.insert(elements, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name})

    end



    ESX.UI.Menu.CloseAll()



    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'armory',

      {

        title    = _U('armory'),

        align    = 'top-left',

        elements = elements,

      },

      function(data, menu)

        local weapon = data.current.value

        TriggerServerEvent('esx_ballasjob:giveWeapon', weapon,  1000)

      end,

      function(data, menu)



        menu.close()



        CurrentAction     = 'menu_armory'

        CurrentActionMsg  = _U('open_armory')

        CurrentActionData = {station = station}



      end

    )



  end



end



function OpenVehicleSpawnerMenu(station, partNum)



  local vehicles = Config.YakuzaStations[station].Vehicles



  ESX.UI.Menu.CloseAll()



  if Config.EnableSocietyOwnedVehicles then



    local elements = {}



    ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(garageVehicles)



      for i=1, #garageVehicles, 1 do

        table.insert(elements, {label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. ' [' .. garageVehicles[i].plate .. ']', value = garageVehicles[i]})

      end



      ESX.UI.Menu.Open(

        'default', GetCurrentResourceName(), 'vehicle_spawner',

        {

          title    = _U('vehicle_menu'),

          align    = 'top-left',

          elements = elements,

        },

        function(data, menu)



          menu.close()



          local vehicleProps = data.current.value



          ESX.Game.SpawnVehicle(vehicleProps.model, vehicles[partNum].SpawnPoint, 270.0, function(vehicle)

            ESX.Game.SetVehicleProperties(vehicle, vehicleProps)

            local playerPed = PlayerPedId()

            TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)

          end)



          TriggerServerEvent('esx_society:removeVehicleFromGarage', 'ballas', vehicleProps)



        end,

        function(data, menu)



          menu.close()



          CurrentAction     = 'menu_vehicle_spawner'

          CurrentActionMsg  = _U('vehicle_spawner')

          CurrentActionData = {station = station, partNum = partNum}



        end

      )



    end, 'ballas')



  else



    local elements = {}



    for i=1, #Config.YakuzaStations[station].AuthorizedVehicles, 1 do

      local vehicle = Config.YakuzaStations[station].AuthorizedVehicles[i]

      table.insert(elements, {label = vehicle.label, value = vehicle.name})

    end



    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'vehicle_spawner',

      {

        title    = _U('vehicle_menu'),

        align    = 'top-left',

        elements = elements,

      },

      function(data, menu)



        menu.close()



        local model = data.current.value



        local vehicle = GetClosestVehicle(vehicles[partNum].SpawnPoint.x,  vehicles[partNum].SpawnPoint.y,  vehicles[partNum].SpawnPoint.z,  3.0,  0,  71)



        if not DoesEntityExist(vehicle) then



          local playerPed = PlayerPedId()



          if Config.MaxInService == -1 then



            ESX.Game.SpawnVehicle(model, {

              x = vehicles[partNum].SpawnPoint.x,

              y = vehicles[partNum].SpawnPoint.y,

              z = vehicles[partNum].SpawnPoint.z

            }, vehicles[partNum].Heading, function(vehicle)

              TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)

              SetVehicleMaxMods(vehicle)

			  local numberplate = math.random(1000, 9999)

			  SetVehicleNumberPlateText(vehicle," BALLAS  “ .. numberplate .. ”")
                          SetVehicleCustomPrimaryColour(vehicle, 50, 0, 50)
                          SetVehicleCustomSecondaryColour(vehicle, 50, 0, 50)

            end)



          else



            ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)



              if canTakeService then



                ESX.Game.SpawnVehicle(model, {

                  x = vehicles[partNum].SpawnPoint.x,

                  y = vehicles[partNum].SpawnPoint.y,

                  z = vehicles[partNum].SpawnPoint.z

                }, vehicles[partNum].Heading, function(vehicle)

                  TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)

                  SetVehicleMaxMods(vehicle)

                end)



              else

                ESX.ShowNotification(_U('service_max') .. inServiceCount .. '/' .. maxInService)

              end



            end, 'ballas')



          end



        else

          ESX.ShowNotification(_U('vehicle_out'))

        end



      end,

      function(data, menu)



        menu.close()



        CurrentAction     = 'menu_vehicle_spawner'

        CurrentActionMsg  = _U('vehicle_spawner')

        CurrentActionData = {station = station, partNum = partNum}



      end

    )



  end



end



local blips = {
  -- Example {title="", colour=, id=, x=, y=, z=},

   {title="~p~Quartier~s~ | Ballas", colour=83, id=378, x = 71.16, y = -1861.01, z = 50.0},

}
    


Citizen.CreateThread(function()

  Citizen.Wait(0)

local bool = true

if bool then
      
  for k,v in pairs(blips) do
         

             zoneblip = AddBlipForRadius(v.x,v.y,v.z, 125.0)
                        SetBlipSprite(zoneblip,1.0)
                        SetBlipColour(zoneblip,83)
                        SetBlipAlpha(zoneblip,75)
                       
      end
       
  
       for _, info in pairs(blips) do
      
           info.blip = AddBlipForCoord(info.x, info.y, info.z)
                       SetBlipSprite(info.blip, info.id)
                       SetBlipDisplay(info.blip, 4)
                       SetBlipScale(info.blip, 1.1)
                       SetBlipColour(info.blip, info.colour)
                       SetBlipAsShortRange(info.blip, true)
                       BeginTextCommandSetBlipName("STRING")
                       AddTextComponentString(info.title)
                       EndTextCommandSetBlipName(info.blip)
       end
   
   bool = false
 
 end
end)




function OpenYakuzaActionsMenu()



  ESX.UI.Menu.CloseAll()



  ESX.UI.Menu.Open(

    'default', GetCurrentResourceName(), 'ballas_actions',

    {

      
 
      title    = 'Ballas',

      align    = 'top-left',

      elements = {

        {label = _U('citizen_interaction'), value = 'citizen_interaction'},

        {label = _U('vehicle_interaction'), value = 'vehicle_interaction'},

        {label = _U('object_spawner'),      value = 'object_spawner'},

      },

    },

    function(data, menu)



      if data.current.value == 'citizen_interaction' then



        ESX.UI.Menu.Open(

          'default', GetCurrentResourceName(), 'citizen_interaction',

          {

            title    = _U('citizen_interaction'),

            align    = 'top-left',

            elements = {

              {label = _U('id_card'),       value = 'identity_card'},

              {label = _U('search'),        value = 'body_search'},

              {label = _U('handcuff'),    value = 'handcuff'},

              {label = _U('drag'),      value = 'drag'},

              {label = _U('put_in_vehicle'),  value = 'put_in_vehicle'},

              {label = _U('out_the_vehicle'), value = 'out_the_vehicle'},

              {label = _U('fine'),            value = 'fine'}

            },

          },

          function(data2, menu2)



            local player, distance = ESX.Game.GetClosestPlayer()



            if distance ~= -1 and distance <= 3.0 then



              if data2.current.value == 'identity_card' then

                OpenIdentityCardMenu(player)

              end



              if data2.current.value == 'body_search' then

                OpenBodySearchMenu(player)

              end



              if data2.current.value == 'handcuff' then

                TriggerServerEvent('esx_ballasjob:handcuff', GetPlayerServerId(player))

              end



              if data2.current.value == 'drag' then

                TriggerServerEvent('esx_ballasjob:drag', GetPlayerServerId(player))

              end



              if data2.current.value == 'put_in_vehicle' then

                TriggerServerEvent('esx_ballasjob:putInVehicle', GetPlayerServerId(player))

              end



              if data2.current.value == 'out_the_vehicle' then

                  TriggerServerEvent('esx_ballasjob:OutVehicle', GetPlayerServerId(player))

              end



              if data2.current.value == 'fine' then

                OpenFineMenu(player)

              end



            else

              ESX.ShowNotification(_U('no_players_nearby'))

            end



          end,

          function(data2, menu2)

            menu2.close()

          end

        )



      end



      if data.current.value == 'vehicle_interaction' then



        ESX.UI.Menu.Open(

          'default', GetCurrentResourceName(), 'vehicle_interaction',

          {

            title    = _U('vehicle_interaction'),

            align    = 'top-left',

            elements = {

              {label = _U('vehicle_info'), value = 'vehicle_infos'},

              {label = _U('pick_lock'),    value = 'hijack_vehicle'},

            },

          },

          function(data2, menu2)



            local playerPed = PlayerPedId()

            local coords    = GetEntityCoords(playerPed)

            local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)



            if DoesEntityExist(vehicle) then



              local vehicleData = ESX.Game.GetVehicleProperties(vehicle)



              if data2.current.value == 'vehicle_infos' then

                OpenVehicleInfosMenu(vehicleData)

              end



              if data2.current.value == 'hijack_vehicle' then



                local playerPed = PlayerPedId()

                local coords    = GetEntityCoords(playerPed)



                if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then



                  local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)



                  if DoesEntityExist(vehicle) then



                    Citizen.CreateThread(function()



                      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)



                      Wait(20000)



                      ClearPedTasksImmediately(playerPed)



                      SetVehicleDoorsLocked(vehicle, 1)

                      SetVehicleDoorsLockedForAllPlayers(vehicle, false)



                      TriggerEvent('esx:showNotification', _U('vehicle_unlocked'))



                    end)



                  end



                end



              end



            else

              ESX.ShowNotification(_U('no_vehicles_nearby'))

            end



          end,

          function(data2, menu2)

            menu2.close()

          end

        )



      end



      if data.current.value == 'object_spawner' then



        ESX.UI.Menu.Open(

          'default', GetCurrentResourceName(), 'citizen_interaction',

          {

            title    = _U('traffic_interaction'),

            align    = 'top-left',

            elements = {

              {label = _U('cone'),     value = 'prop_roadcone02a'},

              {label = _U('barrier'), value = 'prop_barrier_work06a'},

              {label = _U('spikestrips'),    value = 'p_ld_stinger_s'},

              {label = _U('box'),   value = 'prop_boxpile_07d'},

              {label = _U('cash'),   value = 'hei_prop_cash_crate_half_full'}

            },

          },

          function(data2, menu2)





            local model     = data2.current.value

            local playerPed = PlayerPedId()

            local coords    = GetEntityCoords(playerPed)

            local forward   = GetEntityForwardVector(playerPed)

            local x, y, z   = table.unpack(coords + forward * 1.0)



            if model == 'prop_roadcone02a' then

              z = z - 2.0

            end



            ESX.Game.SpawnObject(model, {

              x = x,

              y = y,

              z = z

            }, function(obj)

              SetEntityHeading(obj, GetEntityHeading(playerPed))

              PlaceObjectOnGroundProperly(obj)

            end)



          end,

          function(data2, menu2)

            menu2.close()

          end

        )



      end



    end,

    function(data, menu)



      menu.close()



    end

  )



end



function OpenIdentityCardMenu(player)



  if Config.EnableESXIdentity then



    ESX.TriggerServerCallback('esx_ballasjob:getOtherPlayerData', function(data)



      local jobLabel    = nil

      local sexLabel    = nil

      local sex         = nil

      local dobLabel    = nil

      local heightLabel = nil

      local idLabel     = nil



      if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then

        jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label

      else

        jobLabel = 'Job : ' .. data.job.label

      end



      if data.sex ~= nil then

        if (data.sex == 'm') or (data.sex == 'M') then

          sex = 'Male'

        else

          sex = 'Female'

        end

        sexLabel = 'Sex : ' .. sex

      else

        sexLabel = 'Sex : Unknown'

      end



      if data.dob ~= nil then

        dobLabel = 'DOB : ' .. data.dob

      else

        dobLabel = 'DOB : Unknown'

      end



      if data.height ~= nil then

        heightLabel = 'Height : ' .. data.height

      else

        heightLabel = 'Height : Unknown'

      end



      if data.name ~= nil then

        idLabel = 'ID : ' .. data.name

      else

        idLabel = 'ID : Unknown'

      end



      local elements = {

        {label = _U('name') .. data.firstname .. " " .. data.lastname, value = nil},

        {label = sexLabel,    value = nil},

        {label = dobLabel,    value = nil},

        {label = heightLabel, value = nil},

        {label = jobLabel,    value = nil},

        {label = idLabel,     value = nil},

      }



      if data.drunk ~= nil then

        table.insert(elements, {label = _U('bac') .. data.drunk .. '%', value = nil})

      end



      if data.licenses ~= nil then



        table.insert(elements, {label = '--- Licenses ---', value = nil})



        for i=1, #data.licenses, 1 do

          table.insert(elements, {label = data.licenses[i].label, value = nil})

        end



      end



      ESX.UI.Menu.Open(

        'default', GetCurrentResourceName(), 'citizen_interaction',

        {

          title    = _U('citizen_interaction'),

          align    = 'top-left',

          elements = elements,

        },

        function(data, menu)



        end,

        function(data, menu)

          menu.close()

        end

      )



    end, GetPlayerServerId(player))



  else



    ESX.TriggerServerCallback('esx_ballasjob:getOtherPlayerData', function(data)



      local jobLabel = nil



      if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then

        jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label

      else

        jobLabel = 'Job : ' .. data.job.label

      end



        local elements = {

          {label = _U('name') .. data.name, value = nil},

          {label = jobLabel,              value = nil},

        }



      if data.drunk ~= nil then

        table.insert(elements, {label = _U('bac') .. data.drunk .. '%', value = nil})

      end



      if data.licenses ~= nil then



        table.insert(elements, {label = '--- Licenses ---', value = nil})



        for i=1, #data.licenses, 1 do

          table.insert(elements, {label = data.licenses[i].label, value = nil})

        end



      end



      ESX.UI.Menu.Open(

        'default', GetCurrentResourceName(), 'citizen_interaction',

        {

          title    = _U('citizen_interaction'),

          align    = 'top-left',

          elements = elements,

        },

        function(data, menu)



        end,

        function(data, menu)

          menu.close()

        end

      )



    end, GetPlayerServerId(player))



  end



end



function OpenBodySearchMenu(player)



  ESX.TriggerServerCallback('esx_ballasjob:getOtherPlayerData', function(data)



    local elements = {}



    local blackMoney = 0



    for i=1, #data.accounts, 1 do

      if data.accounts[i].name == 'black_money' then

        blackMoney = data.accounts[i].money

      end

    end



    table.insert(elements, {

      label          = _U('confiscate_dirty') .. blackMoney,

      value          = 'black_money',

      itemType       = 'item_account',

      amount         = blackMoney

    })



    table.insert(elements, {label = '--- Armes ---', value = nil})



    for i=1, #data.weapons, 1 do

      table.insert(elements, {

        label          = _U('confiscate') .. ESX.GetWeaponLabel(data.weapons[i].name),

        value          = data.weapons[i].name,

        itemType       = 'item_weapon',

        amount         = data.ammo,

      })

    end



    table.insert(elements, {label = _U('inventory_label'), value = nil})



    for i=1, #data.inventory, 1 do

      if data.inventory[i].count > 0 then

        table.insert(elements, {

          label          = _U('confiscate_inv') .. data.inventory[i].count .. ' ' .. data.inventory[i].label,

          value          = data.inventory[i].name,

          itemType       = 'item_standard',

          amount         = data.inventory[i].count,

        })

      end

    end





    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'body_search',

      {

        title    = _U('search'),

        align    = 'top-left',

        elements = elements,

      },

      function(data, menu)



        local itemType = data.current.itemType

        local itemName = data.current.value

        local amount   = data.current.amount



        if data.current.value ~= nil then



          TriggerServerEvent('esx_ballasjob:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)



          OpenBodySearchMenu(player)



        end



      end,

      function(data, menu)

        menu.close()

      end

    )



  end, GetPlayerServerId(player))



end



function OpenFineMenu(player)



  ESX.UI.Menu.Open(

    'default', GetCurrentResourceName(), 'fine',

    {

      title    = _U('fine'),

      align    = 'top-left',

      elements = {

        {label = _U('traffic_offense'),   value = 0},

        {label = _U('minor_offense'),     value = 1},

        {label = _U('average_offense'),   value = 2},

        {label = _U('major_offense'),     value = 3}

      },

    },

    function(data, menu)



      OpenFineCategoryMenu(player, data.current.value)



    end,

    function(data, menu)

      menu.close()

    end

  )



end



function OpenFineCategoryMenu(player, category)



  ESX.TriggerServerCallback('esx_ballasjob:getFineList', function(fines)



    local elements = {}



    for i=1, #fines, 1 do

      table.insert(elements, {

        label     = fines[i].label .. ' $' .. fines[i].amount,

        value     = fines[i].id,

        amount    = fines[i].amount,

        fineLabel = fines[i].label

      })

    end



    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'fine_category',

      {

        title    = _U('fine'),

        align    = 'top-left',

        elements = elements,

      },

      function(data, menu)



        local label  = data.current.fineLabel

        local amount = data.current.amount



        menu.close()



        if Config.EnablePlayerManagement then

          TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_ballas', _U('fine_total') .. label, amount)

        else

          TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total') .. label, amount)

        end



        ESX.SetTimeout(300, function()

          OpenFineCategoryMenu(player, category)

        end)



      end,

      function(data, menu)

        menu.close()

      end

    )



  end, category)



end



function OpenVehicleInfosMenu(vehicleData)



  ESX.TriggerServerCallback('esx_ballasjob:getVehicleInfos', function(infos)



    local elements = {}



    table.insert(elements, {label = _U('plate') .. infos.plate, value = nil})



    if infos.owner == nil then

      table.insert(elements, {label = _U('owner_unknown'), value = nil})

    else

      table.insert(elements, {label = _U('owner') .. infos.owner, value = nil})

    end



    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'vehicle_infos',

      {

        title    = _U('vehicle_info'),

        align    = 'top-left',

        elements = elements,

      },

      nil,

      function(data, menu)

        menu.close()

      end

    )



  end, vehicleData.plate)



end



function OpenGetWeaponMenu()



  ESX.TriggerServerCallback('esx_ballasjob:getArmoryWeapons', function(weapons)



    local elements = {}



    for i=1, #weapons, 1 do

      if weapons[i].count > 0 then

        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})

      end

    end



    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'armory_get_weapon',

      {

        title    = _U('get_weapon_menu'),

        align    = 'top-left',

        elements = elements,

      },

      function(data, menu)



        menu.close()



        ESX.TriggerServerCallback('esx_ballasjob:removeArmoryWeapon', function()

          OpenGetWeaponMenu()

        end, data.current.value)



      end,

      function(data, menu)

        menu.close()

      end

    )



  end)



end



function OpenPutWeaponMenu()



  local elements   = {}

  local playerPed  = PlayerPedId()

  local weaponList = ESX.GetWeaponList()



  for i=1, #weaponList, 1 do



    local weaponHash = GetHashKey(weaponList[i].name)



    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then

      local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)

      table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})

    end



  end



  ESX.UI.Menu.Open(

    'default', GetCurrentResourceName(), 'armory_put_weapon',

    {

      title    = _U('put_weapon_menu'),

      align    = 'top-left',

      elements = elements,

    },

    function(data, menu)



      menu.close()



      ESX.TriggerServerCallback('esx_ballasjob:addArmoryWeapon', function()

        OpenPutWeaponMenu()

      end, data.current.value)



    end,

    function(data, menu)

      menu.close()

    end

  )



end



function OpenBuyWeaponsMenu(station)



  ESX.TriggerServerCallback('esx_ballasjob:getArmoryWeapons', function(weapons)



    local elements = {}



    for i=1, #Config.YakuzaStations[station].AuthorizedWeapons, 1 do



      local weapon = Config.YakuzaStations[station].AuthorizedWeapons[i]

      local count  = 0



      for i=1, #weapons, 1 do

        if weapons[i].name == weapon.name then

          count = weapons[i].count

          break

        end

      end



      table.insert(elements, {label = 'x' .. count .. ' ' .. ESX.GetWeaponLabel(weapon.name) .. ' $' .. weapon.price, value = weapon.name, price = weapon.price})



    end



    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'armory_buy_weapons',

      {

        title    = _U('buy_weapon_menu'),

        align    = 'top-left',

        elements = elements,

      },

      function(data, menu)



        ESX.TriggerServerCallback('esx_ballasjob:buy', function(hasEnoughMoney)



          if hasEnoughMoney then

            ESX.TriggerServerCallback('esx_ballasjob:addArmoryWeapon', function()

              OpenBuyWeaponsMenu(station)

            end, data.current.value)

          else

            ESX.ShowNotification(_U('not_enough_money'))

          end



        end, data.current.price)



      end,

      function(data, menu)

        menu.close()

      end

    )



  end)



end



function OpenGetStocksMenu()



  ESX.TriggerServerCallback('esx_ballasjob:getStockItems', function(items)



    print(json.encode(items))



    local elements = {}



    for i=1, #items, 1 do

      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})

    end



    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'stocks_menu',

      {

        title    = _U('ballas_stock'),

        elements = elements

      },

      function(data, menu)



        local itemName = data.current.value



        ESX.UI.Menu.Open(

          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',

          {

            title = _U('quantity')

          },

          function(data2, menu2)



            local count = tonumber(data2.value)



            if count == nil then

              ESX.ShowNotification(_U('quantity_invalid'))

            else

              menu2.close()

              menu.close()

              OpenGetStocksMenu()



              TriggerServerEvent('esx_ballasjob:getStockItem', itemName, count)

            end



          end,

          function(data2, menu2)

            menu2.close()

          end

        )



      end,

      function(data, menu)

        menu.close()

      end

    )



  end)



end



function OpenPutStocksMenu()



  ESX.TriggerServerCallback('esx_ballasjob:getPlayerInventory', function(inventory)



    local elements = {}



    for i=1, #inventory.items, 1 do



      local item = inventory.items[i]



      if item.count > 0 then

        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})

      end



    end



    ESX.UI.Menu.Open(

      'default', GetCurrentResourceName(), 'stocks_menu',

      {

        title    = _U('inventory'),

        elements = elements

      },

      function(data, menu)



        local itemName = data.current.value



        ESX.UI.Menu.Open(

          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',

          {

            title = _U('quantity')

          },

          function(data2, menu2)



            local count = tonumber(data2.value)



            if count == nil then

              ESX.ShowNotification(_U('quantity_invalid'))

            else

              menu2.close()

              menu.close()

              OpenPutStocksMenu()



              TriggerServerEvent('esx_ballasjob:putStockItems', itemName, count)

            end



          end,

          function(data2, menu2)

            menu2.close()

          end

        )



      end,

      function(data, menu)

        menu.close()

      end

    )



  end)



end



RegisterNetEvent('esx:playerLoaded')

AddEventHandler('esx:playerLoaded', function(xPlayer)

  PlayerData = xPlayer

end)



RegisterNetEvent('esx:setJob')

AddEventHandler('esx:setJob', function(job)

  PlayerData.job = job

end)



-- double job

RegisterNetEvent('esx:setJob2')

AddEventHandler('esx:setJob2', function(job2)

  PlayerData.job2 = job2

end)



RegisterNetEvent('esx:setJob3')

AddEventHandler('esx:setJob3', function(job3)

  PlayerData.job3 = job3

end)



AddEventHandler('esx_ballasjob:hasEnteredMarker', function(station, part, partNum)



  if part == 'Cloakroom' then

    CurrentAction     = 'menu_cloakroom'

    CurrentActionMsg  = _U('open_cloackroom')

    CurrentActionData = {}

  end



  if part == 'Armory' then

    CurrentAction     = 'menu_armory'

    CurrentActionMsg  = _U('open_armory')

    CurrentActionData = {station = station}

  end



  if part == 'VehicleSpawner' then

    CurrentAction     = 'menu_vehicle_spawner'

    CurrentActionMsg  = _U('vehicle_spawner')

    CurrentActionData = {station = station, partNum = partNum}

  end



  if part == 'VehicleDeleter' then



    local playerPed = PlayerPedId()

    local coords    = GetEntityCoords(playerPed)



    if IsPedInAnyVehicle(playerPed,  false) then



      local vehicle = GetVehiclePedIsIn(playerPed, false)



      if DoesEntityExist(vehicle) then

        CurrentAction     = 'delete_vehicle'

        CurrentActionMsg  = _U('store_vehicle')

        CurrentActionData = {vehicle = vehicle}

      end



    end



  end



  if part == 'BossActions' then

    CurrentAction     = 'menu_boss_actions'

    CurrentActionMsg  = _U('open_bossmenu')

    CurrentActionData = {}

  end



end)



AddEventHandler('esx_ballasjob:hasExitedMarker', function(station, part, partNum)

  ESX.UI.Menu.CloseAll()

  CurrentAction = nil

end)



AddEventHandler('esx_ballasjob:hasEnteredEntityZone', function(entity)



  local playerPed = PlayerPedId()



  if (PlayerData.job ~= nil and PlayerData.job.name == 'ballas') or (PlayerData.job2 ~= nil and PlayerData.job2.name == 'ballas') or (PlayerData.job3 ~= nil and PlayerData.job3.name == 'ballas') and not IsPedInAnyVehicle(playerPed, false) then

    CurrentAction     = 'remove_entity'

    CurrentActionMsg  = _U('remove_object')

    CurrentActionData = {entity = entity}

  end



  if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then



    local playerPed = PlayerPedId()

    local coords    = GetEntityCoords(playerPed)



    if IsPedInAnyVehicle(playerPed,  false) then



      local vehicle = GetVehiclePedIsIn(playerPed)



      for i=0, 7, 1 do

        SetVehicleTyreBurst(vehicle,  i,  true,  1000)

      end



    end



  end



end)



AddEventHandler('esx_ballasjob:hasExitedEntityZone', function(entity)



  if CurrentAction == 'remove_entity' then

    CurrentAction = nil

  end



end)



RegisterNetEvent('esx_ballasjob:handcuff')

AddEventHandler('esx_ballasjob:handcuff', function()



  IsHandcuffed    = not IsHandcuffed;

  local playerPed = PlayerPedId()



  Citizen.CreateThread(function()



    if IsHandcuffed then



      RequestAnimDict('mp_arresting')



      while not HasAnimDictLoaded('mp_arresting') do

        Wait(100)

      end



      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

      SetEnableHandcuffs(playerPed, true)

      SetPedCanPlayGestureAnims(playerPed, false)

      FreezeEntityPosition(playerPed,  true)



    else



      ClearPedSecondaryTask(playerPed)

      SetEnableHandcuffs(playerPed, false)

      SetPedCanPlayGestureAnims(playerPed,  true)

      FreezeEntityPosition(playerPed, false)



    end



  end)

end)



RegisterNetEvent('esx_ballasjob:drag')

AddEventHandler('esx_ballasjob:drag', function(cop)

  TriggerServerEvent('esx:clientLog', 'starting dragging')

  IsDragged = not IsDragged

  CopPed = tonumber(cop)

end)



Citizen.CreateThread(function()

  while true do

    Wait(0)

    if IsHandcuffed then

      if IsDragged then

        local ped = GetPlayerPed(GetPlayerFromServerId(CopPed))

        local myped = PlayerPedId()

        AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

      else

        DetachEntity(PlayerPedId(), true, false)

      end

    end

  end

end)



RegisterNetEvent('esx_ballasjob:putInVehicle')

AddEventHandler('esx_ballasjob:putInVehicle', function()



  local playerPed = PlayerPedId()

  local coords    = GetEntityCoords(playerPed)



  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then



    local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  5.0,  0,  71)



    if DoesEntityExist(vehicle) then



      local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)

      local freeSeat = nil



      for i=maxSeats - 1, 0, -1 do

        if IsVehicleSeatFree(vehicle,  i) then

          freeSeat = i

          break

        end

      end



      if freeSeat ~= nil then

        TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)

      end



    end



  end



end)



RegisterNetEvent('esx_ballasjob:OutVehicle')

AddEventHandler('esx_ballasjob:OutVehicle', function(t)

  local ped = GetPlayerPed(t)

  ClearPedTasksImmediately(ped)

  plyPos = GetEntityCoords(PlayerPedId(),  true)

  local xnew = plyPos.x+2

  local ynew = plyPos.y+2



  SetEntityCoords(PlayerPedId(), xnew, ynew, plyPos.z)

end)



-- Handcuff

Citizen.CreateThread(function()

  while true do

    Wait(0)

    if IsHandcuffed then

      DisableControlAction(0, 142, true) -- MeleeAttackAlternate

      DisableControlAction(0, 30,  true) -- MoveLeftRight

      DisableControlAction(0, 31,  true) -- MoveUpDown

    end

  end

end)



-- Display markers

Citizen.CreateThread(function()

  while true do



    Wait(0)



    if (PlayerData.job ~= nil and PlayerData.job.name == 'ballas') or (PlayerData.job2 ~= nil and PlayerData.job2.name == 'ballas') or (PlayerData.job3 ~= nil and PlayerData.job3.name == 'ballas') then



      local playerPed = PlayerPedId()

      local coords    = GetEntityCoords(playerPed)



      for k,v in pairs(Config.YakuzaStations) do



        for i=1, #v.Cloakrooms, 1 do

          if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.DrawDistance then

            DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)

          end

        end



        for i=1, #v.Armories, 1 do

          if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.DrawDistance then

            DrawMarker(Config.MarkerType, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)

          end

        end



        for i=1, #v.Vehicles, 1 do

          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.DrawDistance then

            DrawMarker(Config.MarkerType, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)

          end

        end



        for i=1, #v.VehicleDeleters, 1 do

          if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.DrawDistance then

            DrawMarker(Config.MarkerType, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)

          end

        end



        if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'ballas' and PlayerData.job.grade_name == 'boss' then



          for i=1, #v.BossActions, 1 do

            if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.DrawDistance then

              DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)

            end

          end



        end

		

		if Config.EnablePlayerManagement and PlayerData.job2 ~= nil and PlayerData.job2.name == 'ballas' and PlayerData.job2.grade_name == 'boss' then



          for i=1, #v.BossActions, 1 do

            if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.DrawDistance then

              DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)

            end

          end



        end

		

		if Config.EnablePlayerManagement and PlayerData.job3 ~= nil and PlayerData.job3.name == 'ballas' and PlayerData.job3.grade_name == 'boss' then



          for i=1, #v.BossActions, 1 do

            if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.DrawDistance then

              DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)

            end

          end



        end



      end



    end



  end

end)



-- Enter / Exit marker events

Citizen.CreateThread(function()



  while true do



    Wait(0)



    if (PlayerData.job ~= nil and PlayerData.job.name == 'ballas') or (PlayerData.job2 ~= nil and PlayerData.job2.name == 'ballas') or (PlayerData.job3 ~= nil and PlayerData.job3.name == 'ballas') then



      local playerPed      = PlayerPedId()

      local coords         = GetEntityCoords(playerPed)

      local isInMarker     = false

      local currentStation = nil

      local currentPart    = nil

      local currentPartNum = nil



      for k,v in pairs(Config.YakuzaStations) do



        for i=1, #v.Cloakrooms, 1 do

          if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.MarkerSize.x then

            isInMarker     = true

            currentStation = k

            currentPart    = 'Cloakroom'

            currentPartNum = i

          end

        end



        for i=1, #v.Armories, 1 do

          if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.MarkerSize.x then

            isInMarker     = true

            currentStation = k

            currentPart    = 'Armory'

            currentPartNum = i

          end

        end



        for i=1, #v.Vehicles, 1 do



          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.MarkerSize.x then

            isInMarker     = true

            currentStation = k

            currentPart    = 'VehicleSpawner'

            currentPartNum = i

          end



          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].SpawnPoint.x,  v.Vehicles[i].SpawnPoint.y,  v.Vehicles[i].SpawnPoint.z,  true) < Config.MarkerSize.x then

            isInMarker     = true

            currentStation = k

            currentPart    = 'VehicleSpawnPoint'

            currentPartNum = i

          end



        end



        for i=1, #v.VehicleDeleters, 1 do

          if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.MarkerSize.x then

            isInMarker     = true

            currentStation = k

            currentPart    = 'VehicleDeleter'

            currentPartNum = i

          end

        end



        if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'ballas' and PlayerData.job.grade_name == 'boss' then



          for i=1, #v.BossActions, 1 do

            if GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.MarkerSize.x then

              isInMarker     = true

              currentStation = k

              currentPart    = 'BossActions'

              currentPartNum = i

            end

          end



        end

		

		if Config.EnablePlayerManagement and PlayerData.job2 ~= nil and PlayerData.job2.name == 'ballas' and PlayerData.job2.grade_name == 'boss' then



          for i=1, #v.BossActions, 1 do

            if GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.MarkerSize.x then

              isInMarker     = true

              currentStation = k

              currentPart    = 'BossActions'

              currentPartNum = i

            end

          end



        end

		

		if Config.EnablePlayerManagement and PlayerData.job3 ~= nil and PlayerData.job3.name == 'ballas' and PlayerData.job3.grade_name == 'boss' then



          for i=1, #v.BossActions, 1 do

            if GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.MarkerSize.x then

              isInMarker     = true

              currentStation = k

              currentPart    = 'BossActions'

              currentPartNum = i

            end

          end



        end



      end



      local hasExited = false



      if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) ) then



        if

          (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and

          (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)

        then

          TriggerEvent('esx_ballasjob:hasExitedMarker', LastStation, LastPart, LastPartNum)

          hasExited = true

        end



        HasAlreadyEnteredMarker = true

        LastStation             = currentStation

        LastPart                = currentPart

        LastPartNum             = currentPartNum



        TriggerEvent('esx_ballasjob:hasEnteredMarker', currentStation, currentPart, currentPartNum)

      end



      if not hasExited and not isInMarker and HasAlreadyEnteredMarker then



        HasAlreadyEnteredMarker = false



        TriggerEvent('esx_ballasjob:hasExitedMarker', LastStation, LastPart, LastPartNum)

      end



    end



  end

end)



-- Enter / Exit entity zone events

Citizen.CreateThread(function()



  local trackedEntities = {

    'prop_roadcone02a',

    'prop_barrier_work06a',

    'p_ld_stinger_s',

    'prop_boxpile_07d',

    'hei_prop_cash_crate_half_full'

  }



  while true do



    Citizen.Wait(0)



    local playerPed = PlayerPedId()

    local coords    = GetEntityCoords(playerPed)



    local closestDistance = -1

    local closestEntity   = nil



    for i=1, #trackedEntities, 1 do



      local object = GetClosestObjectOfType(coords.x,  coords.y,  coords.z,  3.0,  GetHashKey(trackedEntities[i]), false, false, false)



      if DoesEntityExist(object) then



        local objCoords = GetEntityCoords(object)

        local distance  = GetDistanceBetweenCoords(coords.x,  coords.y,  coords.z,  objCoords.x,  objCoords.y,  objCoords.z,  true)



        if closestDistance == -1 or closestDistance > distance then

          closestDistance = distance

          closestEntity   = object

        end



      end



    end



    if closestDistance ~= -1 and closestDistance <= 3.0 then



      if LastEntity ~= closestEntity then

        TriggerEvent('esx_ballasjob:hasEnteredEntityZone', closestEntity)

        LastEntity = closestEntity

      end



    else



      if LastEntity ~= nil then

        TriggerEvent('esx_ballasjob:hasExitedEntityZone', LastEntity)

        LastEntity = nil

      end



    end



  end

end)



-- Key Controls

Citizen.CreateThread(function()

  while true do



    Citizen.Wait(0)



    if CurrentAction ~= nil then



      SetTextComponentFormat('STRING')

      AddTextComponentString(CurrentActionMsg)

      DisplayHelpTextFromStringLabel(0, 0, 1, -1)



      if IsControlPressed(0,  Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'ballas' and (GetGameTimer() - GUI.Time) > 150 then



        if CurrentAction == 'menu_cloakroom' then

          OpenCloakroomMenu()

        end



        if CurrentAction == 'menu_armory' then

          OpenArmoryMenu(CurrentActionData.station)

        end



        if CurrentAction == 'menu_vehicle_spawner' then

          OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)

        end



        if CurrentAction == 'delete_vehicle' then



          if Config.EnableSocietyOwnedVehicles then



            local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)

            TriggerServerEvent('esx_society:putVehicleInGarage', 'ballas', vehicleProps)



          else



            if

              GetEntityModel(vehicle) == GetHashKey('schafter3')  or

              GetEntityModel(vehicle) == GetHashKey('kuruma2') or

              GetEntityModel(vehicle) == GetHashKey('sandking') or

              GetEntityModel(vehicle) == GetHashKey('mule3') or

              GetEntityModel(vehicle) == GetHashKey('guardian') or

              GetEntityModel(vehicle) == GetHashKey('burrito3') or

              GetEntityModel(vehicle) == GetHashKey('mesa')

            then

              TriggerServerEvent('esx_service:disableService', 'ballas')

            end



          end



          ESX.Game.DeleteVehicle(CurrentActionData.vehicle)

        end



        if CurrentAction == 'menu_boss_actions' then



          ESX.UI.Menu.CloseAll()



          TriggerEvent('esx_society:openBossMenu', 'ballas', function(data, menu)



            menu.close()



            CurrentAction     = 'menu_boss_actions'

            CurrentActionMsg  = _U('open_bossmenu')

            CurrentActionData = {}



          end)



        end



        if CurrentAction == 'remove_entity' then

          DeleteEntity(CurrentActionData.entity)

        end



        CurrentAction = nil

        GUI.Time      = GetGameTimer()



      end



    end



   if IsControlPressed(0,  Keys['F7']) and PlayerData.job ~= nil and PlayerData.job.name == 'ballas' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'ballas_actions') and (GetGameTimer() - GUI.Time) > 150 then

     OpenYakuzaActionsMenu()

     GUI.Time = GetGameTimer()

    end



  end

end)



-- double job

-- Key Controls

Citizen.CreateThread(function()

  while true do



    Citizen.Wait(0)



    if CurrentAction ~= nil then



      SetTextComponentFormat('STRING')

      AddTextComponentString(CurrentActionMsg)

      DisplayHelpTextFromStringLabel(0, 0, 1, -1)



      if IsControlPressed(0,  Keys['E']) and PlayerData.job2 ~= nil and PlayerData.job2.name == 'ballas' and (GetGameTimer() - GUI.Time) > 150 then



        if CurrentAction == 'menu_cloakroom' then

          OpenCloakroomMenu()

        end



        if CurrentAction == 'menu_armory' then

          OpenArmoryMenu(CurrentActionData.station)

        end



        if CurrentAction == 'menu_vehicle_spawner' then

          OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)

        end



        if CurrentAction == 'delete_vehicle' then



          if Config.EnableSocietyOwnedVehicles then



            local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)

            TriggerServerEvent('esx_society:putVehicleInGarage', 'ballas', vehicleProps)



          else



            if

              GetEntityModel(vehicle) == GetHashKey('schafter3')  or

              GetEntityModel(vehicle) == GetHashKey('kuruma2') or

              GetEntityModel(vehicle) == GetHashKey('sandking') or

              GetEntityModel(vehicle) == GetHashKey('mule3') or

              GetEntityModel(vehicle) == GetHashKey('guardian') or

              GetEntityModel(vehicle) == GetHashKey('burrito3') or

              GetEntityModel(vehicle) == GetHashKey('mesa')

            then

              TriggerServerEvent('esx_service:disableService', 'ballas')

            end



          end



          ESX.Game.DeleteVehicle(CurrentActionData.vehicle)

        end



        if CurrentAction == 'menu_boss_actions' then



          ESX.UI.Menu.CloseAll()



          TriggerEvent('esx_society:openBossMenu', 'ballas', function(data, menu)



            menu.close()



            CurrentAction     = 'menu_boss_actions'

            CurrentActionMsg  = _U('open_bossmenu')

            CurrentActionData = {}



          end)



        end



        if CurrentAction == 'remove_entity' then

          DeleteEntity(CurrentActionData.entity)

        end



        CurrentAction = nil

        GUI.Time      = GetGameTimer()



      end



    end



   if IsControlPressed(0,  Keys['F9']) and PlayerData.job2 ~= nil and PlayerData.job2.name == 'ballas' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'ballas_actions') and (GetGameTimer() - GUI.Time) > 150 then

     OpenYakuzaActionsMenu()

     GUI.Time = GetGameTimer()

    end



  end

end)



-- triple job

-- Key Controls

Citizen.CreateThread(function()

  while true do



    Citizen.Wait(0)



    if CurrentAction ~= nil then



      SetTextComponentFormat('STRING')

      AddTextComponentString(CurrentActionMsg)

      DisplayHelpTextFromStringLabel(0, 0, 1, -1)



      if IsControlPressed(0,  Keys['E']) and PlayerData.job3 ~= nil and PlayerData.job3.name == 'ballas' and (GetGameTimer() - GUI.Time) > 150 then



        if CurrentAction == 'menu_cloakroom' then

          OpenCloakroomMenu()

        end



        if CurrentAction == 'menu_armory' then

          OpenArmoryMenu(CurrentActionData.station)

        end



        if CurrentAction == 'menu_vehicle_spawner' then

          OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)

        end



        if CurrentAction == 'delete_vehicle' then



          if Config.EnableSocietyOwnedVehicles then



            local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)

            TriggerServerEvent('esx_society:putVehicleInGarage', 'ballas', vehicleProps)



          else



            if

              GetEntityModel(vehicle) == GetHashKey('schafter3')  or

              GetEntityModel(vehicle) == GetHashKey('kuruma2') or

              GetEntityModel(vehicle) == GetHashKey('sandking') or

              GetEntityModel(vehicle) == GetHashKey('mule3') or

              GetEntityModel(vehicle) == GetHashKey('guardian') or

              GetEntityModel(vehicle) == GetHashKey('burrito3') or

              GetEntityModel(vehicle) == GetHashKey('mesa')

            then

              TriggerServerEvent('esx_service:disableService', 'ballas')

            end



          end



          ESX.Game.DeleteVehicle(CurrentActionData.vehicle)

        end



        if CurrentAction == 'menu_boss_actions' then



          ESX.UI.Menu.CloseAll()



          TriggerEvent('esx_society:openBossMenu', 'ballas', function(data, menu)



            menu.close()



            CurrentAction     = 'menu_boss_actions'

            CurrentActionMsg  = _U('open_bossmenu')

            CurrentActionData = {}



          end)



        end



        if CurrentAction == 'remove_entity' then

          DeleteEntity(CurrentActionData.entity)

        end



        CurrentAction = nil

        GUI.Time      = GetGameTimer()



      end



    end



   if IsControlPressed(0,  Keys['F9']) and PlayerData.job3 ~= nil and PlayerData.job3.name == 'ballas' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'ballas_actions') and (GetGameTimer() - GUI.Time) > 150 then

     OpenYakuzaActionsMenu()

     GUI.Time = GetGameTimer()

    end



  end

end)



---------------------------------------------------------------------------------------------------------

--NB : gestion des menu

---------------------------------------------------------------------------------------------------------



RegisterNetEvent('NB:openMenuYakuza')

AddEventHandler('NB:openMenuYakuza', function()

	OpenYakuzaActionsMenu()

end)