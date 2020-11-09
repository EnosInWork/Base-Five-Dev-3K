Config                            = {}

Config.DrawDistance = 15.0
Config.MarkerType = 1
Config.MarkerSize = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement = true
Config.EnableArmoryManagement = true
Config.EnableESXIdentity = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds = false -- turn this on if you want custom peds
Config.EnableLicenses = true -- enable if you're using esx_license
Config.EnableHandcuffTimer = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer = 10 * 60000 -- 10 mins
Config.EnableJobBlip = false -- enable blips for colleagues, requires esx_society
Config.MaxInService = -1
Config.Locale = 'fr'

Config.CripsStations = {

	Crips = {

		Blip = {
			Coords  = vector3(-140.85, -1601.746, 35.06),
			Sprite  = 310,
			Display = 4,
			Scale   = 0.8,
			Colour  = 1
		},
	}
}