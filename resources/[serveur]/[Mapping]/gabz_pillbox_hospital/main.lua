Citizen.CreateThread(function()


RequestIpl("gabz_pillbox_milo_")
	local interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)
	local int = {
		"rc12b_fixed",
		"rc12b_destroyed",
		"rc12b_default",
		"rc12b_hospitalinterior_lod",
		"rc12b_hospitalinterior"
	}
	Wait(10000)
	for i = 1, #int, 1 do
		if IsIplActive(int[i]) then
			RemoveIpl(int[i])
		end
	end
	RefreshInterior(interiorID)
	LoadInterior(interiorID)
end)