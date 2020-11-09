Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 0, g = 165, b = 255 }
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.ReviveReward               = 0  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.MaxInService               = 10
local second = 1000
local minute = 60 * second

-- How much time before auto respawn at hospital
Config.RespawnDelayAfterRPDeath   = 10 * minute

-- How much time before a menu opens to ask the player if he wants to respawn at hospital now
-- The player is not obliged to select YES, but he will be auto respawn
-- at the end of RespawnDelayAfterRPDeath just above.
Config.RespawnToHospitalMenuTimer   = true
Config.MenuRespawnToHospitalDelay   = 5 * minute

Config.EnablePlayerManagement       = true
Config.EnableSocietyOwnedVehicles   = false

Config.RemoveWeaponsAfterRPDeath    = true
Config.RemoveCashAfterRPDeath       = true
Config.RemoveItemsAfterRPDeath      = true

-- Will display a timer that shows RespawnDelayAfterRPDeath time remaining
Config.ShowDeathTimer               = true

-- Will allow to respawn at any time, don't use RespawnToHospitalMenuTimer at the same time !
Config.EarlyRespawn                 = false
-- The player can have a fine (on bank account)
Config.RespawnFine                  = true
Config.RespawnFineAmount            = 1250
Config.NPCJobEarnings               = {min = 200, max = 400}

Config.Locale                       = 'fr'

Config.Blip = {
  Pos     = { x = 295.1805, y = -584.1231, z = 43.1590 },
  Sprite  = 61,
  Display = 4,
  Scale   = 0.7,
  Colour  = 2,
}

Config.HelicopterSpawner = {
  SpawnPoint  = { x = 351.07, y = -587.77, z = 74.17 },
  Heading     = 225.0
}

Config.Zones = {

  --HospitalInteriorEntering1 = { -- ok
  --  Pos  = { x = 294.6, y = -1448.01, z = 28.9 },
  --  Type = 0
 -- },

  HospitalInteriorInside1 = { -- ok
     Pos  = { x = 331.5456, y = -595.3471, z = 43.2840 },
    Type = -1
  },

  --HospitalInteriorOutside1 = { -- ok
   -- Pos  = { x = 295.8, y = -1446.5, z = 28.9 },
   -- Type = -1
 -- },

 -- HospitalInteriorExit1 = { -- ok
 --   Pos  = { x = 275.7, y = -1361.5, z = 23.5 },
 --   Type = 0
 -- },

  --HospitalInteriorEntering2 = { -- Ascenseur aller au toit
   -- Pos  = { x = 331.5456, y = -595.3471, z = 43.2840 },
   -- Type = 0
 -- },

 -- HospitalInteriorInside2 = { -- Toit sortie
  --  Pos  = { x = 333.1,  y = -1434.9, z = 45.5 },
  --  Type = -1
 -- },

 -- HospitalInteriorOutside2 = { -- Ascenseur retour depuis toit
  --  Pos  = { x = 249.1,  y = -1369.6, z = 23.5 },
  --  Type = -1
 -- },

--  HospitalInteriorExit2 = { -- Toit entrée
 --   Pos  = { x = 335.5, y = -1432.0, z = 45.5 },
  --  Type = 0
 -- },

  AmbulanceActions = { -- CLOACKROOM
    Pos  = { x = 300.8627, y = -597.1746, z = 43.28 },
    Type = 0
  },

  VehicleSpawner = {
    Pos  = { x = 300.0652, y = -575.1685, z = 43.2608 },
    Type = 0
  },

  VehicleSpawnPoint = {
    Pos  = { x = 290.2639, y = -572.3502, z = 43.1954 },
    Type = -1
  },

  VehicleDeleter = {
    Pos  = { x = 278.5648, y = -606.1807, z = 42.0382 },
    Type = 0
  },

  Pharmacy = {
    Pos  = { x = 306.5901, y = -600.9744, z = 43.28 },
    Type = 0
  }

  --ParkingDoorGoOutInside = {
 --   Pos  = { x = 234.56, y = -1373.77, z = 20.97 },
 --   Type = 0
 -- },

 -- ParkingDoorGoOutOutside = {
 --   Pos  = { x = 320.98, y = -1478.62, z = 28.81 },
 --   Type = -1
 -- },

  --ParkingDoorGoInInside = {
  --  Pos  = { x = 238.64, y = -1368.48, z = 23.53 },
  --  Type = -1
  --},

 -- ParkingDoorGoInOutside = {
 --   Pos  = { x = 317.97, y = -1476.13, z = 28.97 },
  --  Type = 0
 -- },

 -- StairsGoTopTop = {
  --  Pos  = { x = 251.91, y = -1363.3, z = 38.53 },
  --  Type = -1
 -- },

  --StairsGoTopBottom = {
 --   Pos  = { x = 237.45, y = -1373.89, z = 26.30 },
 --   Type = -1
 -- },

 -- StairsGoBottomTop = {
 --   Pos  = { x = 256.58, y = -1357.7, z = 37.30 },
 --   Type = -1
 -- },

 -- StairsGoBottomBottom = {
  --  Pos  = { x = 235.45, y = -1372.89, z = 26.30 },
  --  Type = -1
 -- }

}

Config.JobLocations = {
  {x = 1163.50, y = -1536.22, z = 39.00},
  {x = 290.18, y = -1440.89, z = 29.56},
  {x = -497.59, y = -336.16, z = 34.10},
  {x = 360.91, y = -584.04, z = 28.42},
}
