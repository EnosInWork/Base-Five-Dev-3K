Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 23
Config.MarkerSize                 = { x = 1.3, y = 1.3, z = 1.5 }
Config.MarkerColor                = { r = 255, g = 0, b = 255 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.YakuzaStations = {
  Yakuza = {

    Blip = {
      Pos     = {},
      Sprite  = -1,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },



	  AuthorizedVehicles = {
		  { name = 'sultan',    label = 'Voiture' },
		  { name = 'manchez',  label = 'Moto' },
		  { name = 'rumpo3',     label = '4x4' },
	  },

    Cloakrooms = {
      --{ x = 117.73, y = -1964.22, z = 21.33 }, -- fait
    },

    Armories = {
      { x = 107.92, y = -1980.26, z = 20.96 }, -- fait
    },

    Vehicles = {
      {
        Spawner    = { x = 102.95, y = -1955.98, z = 19.75 }, -- fait
        SpawnPoint = { x = 103.60777282714, y = -1937.7110595704, z = 20.803720474244 }, -- fait
        Heading    = 211.314, -- fait
      }
    },

    VehicleDeleters = {
      { x = 85.97, y = -1970.80, z = 19.75 }, -- fait
    },

    BossActions = {
      { x = 117.09, y = -1962.01, z = 20.40 } -- fait
    },

  },

}