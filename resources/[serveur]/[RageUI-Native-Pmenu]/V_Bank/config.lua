Config = {}
Config.DrawDistance = 15
Config.Size         = {x = 0.8, y = 1.0, z = 0.5}
Config.Color        = {r = 255, g = 0, b = 0}
Config.Type         = 2
Config.OnlyFirstname     = true

-- Solde

Config.GetPlayerMoney = function(action)
    TriggerServerEvent("bank:solde", action)
end

-- Blips 

Config.kBank = {
    {x = 149.92, y = -1040.83, z = 29.37}, 
	{x=-1212.980, y=-330.841, z=37.56},
	{x=-2962.582, y=482.627, z=15.703},
	{x=-112.202, y=6469.295, z=31.626},
	{x=314.187, y=-278.621, z=54.170},
	{x=-351.534, y=-49.529, z=49.042},
	{x=1175.0643310547, y=2706.6435546875, z=38.094036102295}
  }