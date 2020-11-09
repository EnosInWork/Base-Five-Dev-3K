local outfits = {
    ['Tenue homme uniform #02'] = {
        category = '#1',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 86, 1 },
            { 4, 48, 1 },
            { 5, 49, 1 },
            { 6, 52, 1 },
            { 7, 31, 4 },
            { 8, 55, 1 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 48, 1 },
        },
    },
    ['Tenue homme uniform #03'] = {
        category = '#1',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 86, 1 },
            { 4, 26, 4 },
            { 5, 1, 1 },
            { 6, 52, 1 },
            { 7, 31, 3 },
            { 8, 89, 1 },
            { 9, 15, 1 },
            { 10, 1, 1 },
            { 11, 41, 1 },
        },
    }, 
    ['Tenue homme uniform'] = {
        category = '#1',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 1, 1 },
            { 4, 48, 1 },
            { 5, 49, 1 },
            { 6, 52, 1 },
            { 7, 31, 1 },
            { 8, 55, 1 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 17, 1 },
        },
    },
    ['Tenue femme uniform'] = {
        category = '#1',
        ped = 'mp_s_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 110, 1 },
            { 4, 50, 1 },
            { 5, 49, 1 },
            { 6, 53, 1 },
            { 7, 15, 2 },
            { 8, 7, 1 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 33, 1 },
        },
    },
    ['Tenue homme veste'] = {
        category = '#1',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 1, 1 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 5, 1 },
            { 4, 48, 1 },
            { 5, 49, 1 },
            { 6, 52, 1 },
            { 7, 1, 1 },
            { 8, 52, 9 },
            { 9, 2, 1 },
            { 10, 1, 1 },
            { 11, 152, 6 },
        },
    },
    ['Tenue femme veste'] = {
        category = '#1',
        ped = 'mp_f_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 1, 1 },
            { 4, 50, 1 },
            { 5, 49, 1 },
            { 6, 53, 1 },
            { 7, 1, 1 },
            { 8, 46, 20 },
            { 9, 2, 1 },
            { 10, 1, 1 },
            { 11, 149, 6 },
        },
    },


}

local function setOutfit(outfit)
    local ped = PlayerPedId()

    ped = PlayerPedId()

    for _, comp in ipairs(outfit.components) do
       SetPedComponentVariation(ped, comp[1], comp[2] - 1, comp[3] - 1, 0)
    end

    for _, comp in ipairs(outfit.props) do
        if comp[2] == 0 then
            ClearPedProp(ped, comp[1])
        else
            SetPedPropIndex(ped, comp[1], comp[2] - 1, comp[3] - 1, true)
        end
    end
end

local categoryOutfits = {}

for name, outfit in pairs(outfits) do
    if not categoryOutfits[outfit.category] then
        categoryOutfits[outfit.category] = {}
    end

    categoryOutfits[outfit.category][name] = outfit
end

local menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu('LaFive', 'Sélectionnez votre tenue')

for name, list in pairs(categoryOutfits) do
    local subMenu = menuPool:AddSubMenu(mainMenu, name)

    base = NativeUI.CreateItem("Tenue de base", '')
    subMenu:AddItem(base)

    for id, outfit in pairs(list) do
        outfit.item = NativeUI.CreateItem(id, '')
        subMenu:AddItem(outfit.item)
    end

    subMenu.OnItemSelect = function(sender, item, index)
        -- find the outfit
        for _, outfit in pairs(list) do
            if outfit.item == item then
                CreateThread(function()
                    setOutfit(outfit)
                    TriggerServerEvent("player:serviceOn", "ambulance")
                end)
            end
        end
        if item == base then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				TriggerServerEvent("player:serviceOff", "ambulance")
			end)
        end
    end
end

menuPool:Add(mainMenu)

menuPool:RefreshIndex()

function openCloackroom()
	mainMenu:Visible(not mainMenu:Visible())
end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(10)
      if IsControlPressed(0, 20) then
        openCloackroom()
	  end
	end
end)

CreateThread(function()
    while true do
        Wait(0)

        menuPool:ProcessMenus()
    end
end)

RegisterNetEvent('NB:cloak')
AddEventHandler('NB:cloak', function()
	_menuPool:CloseAllMenus()
	openCloackroom()
end)