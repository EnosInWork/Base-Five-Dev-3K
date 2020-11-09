Config = {}
Config.Locale = 'fr'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--


	-- Bahama
	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = -1389.212, y = -588.040, z = 30.491},
		textCoords = {x = -1388.212, y = -588.40, z = 30.491},
		authorizedJobs = { 'bahama' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = -1387.025, y = -586.613, z = 30.495},
		textCoords = {x = -1387.250, y = -587.50, z = 30.500},
		authorizedJobs = { 'bahama' },
		locked = false,
		distance = 2.5
	},

	--
	-- Sandy Shores
	--

	{
		objName = 'v_ilev_gc_door01',
		objCoords  = {x = -450.978, y = 6006.074, z = 31.994},
		textCoords = {x = -450.978, y = 6006.074, z = 31.994},
		authorizedJobs = { 'sheriff' },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_gc_door01',
		objCoords  = {x = -447.226, y = 6002.328, z = 31.839},
		textCoords = {x = -447.226, y = 6002.328, z = 31.839},
		authorizedJobs = { 'sheriff' },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -428.064, y = 5996.671, z = 31.873},
		textCoords = {x = -428.064, y = 5996.671, z = 31.873},
		authorizedJobs = { 'sheriff' },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -431.192, y = 5999.741, z = 31.873},
		textCoords = {x = -431.192, y = 5999.741, z = 31.873},
		authorizedJobs = { 'sheriff' },
		locked = true,
		distance = 2.5
	},

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objCoords  = {x = -447.226, y = 6002.328, z = 31.8394},
		textCoords = {x = -447.226, y = 6002.328, z = 31.8394},
		authorizedJobs = { 'sheriff' },
		distance = 2,
		locked = false
	},
	-- 2 portes à gauche
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 1849.9934, y = 3684.140, z = 34.40},
		textCoords = {x = 1849.9934, y = 3684.140, z = 34.60},
		authorizedJobs = { 'sheriff' },
		distance = 2.5,
		locked = true
	},
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 1851.266, y = 3681.8745, z = 34.40},
		textCoords = {x = 1851.266, y = 3681.8745, z = 34.60},
		authorizedJobs = { 'sheriff' },
		distance = 2.5,
		locked = true
	},
	-- 2 portes en face
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 1849.4135, y = 3691.21, z = 34.42},
		textCoords = {x = 1849.4135, y = 3691.21, z = 34.62},
		authorizedJobs = { 'sheriff' },
		distance = 2.5,
		locked = true
	},
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 1847.1620, y = 3689.912, z = 34.42},
		textCoords = {x = 1847.1620, y = 3689.912, z = 34.62},
		authorizedJobs = { 'sheriff' },
		distance = 2.5,
		locked = true
	},
	-- à droite
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 1856.1451, y = 3689.6758, z = 34.43},
		textCoords = {x = 1856.1451, y = 3689.6758, z = 34.63},
		authorizedJobs = { 'sheriff' },
		distance = 2,
		locked = true
	},
	-- armurie
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 1858.7694, y = 3691.1582, z = 34.43},
		textCoords = {x = 1858.7694, y = 3691.1582, z = 34.63},
		authorizedJobs = { 'sheriff' },
		locked = true
	},
	-- cellules 1, 2, 3
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 1847.65, y = 3682.35, z = 34.20},
		textCoords = {x = 1847.65, y = 3682.35, z = 34.40},
		authorizedJobs = { 'sheriff' },
		locked = true
	},
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 1845.93, y = 3685.43, z = 34.20},
		textCoords = {x = 1845.93, y = 3685.43, z = 34.40},
		authorizedJobs = { 'sheriff' },
		locked = true
	},
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 1844.52, y = 3687.1582, z = 34.20},
		textCoords = {x = 1844.52, y = 3687.6582, z = 34.40},
		authorizedJobs = { 'sheriff' },
		locked = true
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.14, y = 6015.685, z = 31.716},
		textCoords = {x = -443.14, y = 6015.685, z = 32.00},
		authorizedJobs = { 'sheriff' },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.951, y = 6016.622, z = 31.716},
		textCoords = {x = -443.951, y = 6016.622, z = 32.00},
		authorizedJobs = { 'sheriff' },
		locked = true,
		distance = 2.5
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1844.998, y = 2604.810, z = 44.638},
		textCoords = {x = 1844.998, y = 2608.50, z = 48.00},
		authorizedJobs = { 'sheriff' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1818.542, y = 2604.812, z = 44.611},
		textCoords = {x = 1818.542, y = 2608.40, z = 48.00},
		authorizedJobs = { 'sheriff' },
		locked = true,
		distance = 12,
		size = 2
	},
	
-------------------------------------------------------------------- Ammu
	{
		objName = 'v_ilev_gc_door04',
		objCoords  = {x = 813.177, y = -2148.269, z = 29.768},
		textCoords = {x = 813.177, y = -2148.269, z = 29.768},
		authorizedJobs = { 'armurier' },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_gc_door03',
		objCoords  = {x = 810.576, y = -2148.269, z = 29.768},
		textCoords = {x = 810.576, y = -2148.269, z = 29.768},
		authorizedJobs = { 'armurier' },
		locked = true,
		distance = 2.5
	},

---------------------------------------------------------------------------
	--
	-- MECANO
	--
	
	{
		objName = 'lr_prop_supermod_door_01',
		objCoords  = {x = -205.6828, y = -1310.683, z = 30.29572},
		textCoords = {x = -205.73, y = -1310.55, z = 32.37},
		authorizedJobs = { 'mechanic' },
		locked = true,
		distance = 12,
		size = 2
	},
	

	--
	-- Unicorn
	--

	{
		objName = 'prop_magenta_door',
		objCoords  = {x = 96.092, y = -1284.854, z = 29.438},
		textCoords = {x = 95.392, y = -1284.854, z = 29.738},
		authorizedJobs = { 'unicorn' },
		locked = true,
		distance = 2.5,
		size = 1
	},
        {
		objName = 'prop_strip_door_01',
		objCoords  = {x = 127.955, y = -1298.503, z = 29.419},
		textCoords = {x = 128.500, y = -1298.053, z = 29.719},
		authorizedJobs = { 'unicorn' },
		locked = true,
		distance = 10,
		size = 2
	},
	

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = {x = 420.133, y = -1017.301, z = 28.086},
		textCoords = {x = 420.133, y = -1021.00, z = 32.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	}
	--]]
}