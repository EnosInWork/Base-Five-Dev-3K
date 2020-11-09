locksound = false
local pillused = true

RegisterNetEvent('dix-oblivionpill:piluleoubli')
AddEventHandler('dix-oblivionpill:piluleoubli', function()
Citizen.CreateThread(function()
   while true do
       Citizen.Wait(0)      
            if pillused == true then
			
					StartScreenEffect("DeathFailOut", 0, 0)
					if not locksound then
                    PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
					locksound = true
					pillused = true
					end
					ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
					
					local scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")

					if HasScaleformMovieLoaded(scaleform) then
						Citizen.Wait(0)

					PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
					BeginTextComponent("STRING")
					AddTextComponentString(_U('fall_oubli'))
					EndTextComponent()
					PopScaleformMovieFunctionVoid()

				    Citizen.Wait(100)
					PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)
                    while pillused == true do
					  DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
					  SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
					  DisablePlayerFiring(PlayerId(), true)
					  Citizen.Wait(0)
                    end

				  StopScreenEffect("DeathFailOut")
				  locksound = false

			end
		end
    end
end)
end)

RegisterNetEvent('dix-oblivionpill:stoppill')
AddEventHandler('dix-oblivionpill:stoppill', function()
        stopPill()
end)

function stopPill()
    pillused = false
end
