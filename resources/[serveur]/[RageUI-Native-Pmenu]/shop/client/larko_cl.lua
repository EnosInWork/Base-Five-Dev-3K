local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)


_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("","Superette", nil, nil, "shopui_title_conveniencestore", "shopui_title_conveniencestore", 0, 255, 255, 255, 255)
_menuPool:Add(mainMenu)

function AddShopsMenu(menu)
    local shopsmenu = _menuPool:AddSubMenu(menu, "Boissons", "Tout les meilleurs breuvages de la ville", 5, 100,"","","",210,0,0)
    shopsmenu.Item:RightLabel("→") 
    
    local shopsmenu2 = _menuPool:AddSubMenu(menu, "Nourritures", "Vous avez une petite faim ? Apu est la", 5, 100,"","","",210,0,0)
    shopsmenu2.Item:RightLabel("→") 

    local gpsmenu = _menuPool:AddSubMenu(menu, "Utilitaires", "", 5, 100,"","","",210,0,0)
    gpsmenu.Item:RightLabel("→") 

    local eau = NativeUI.CreateItem("Eau", "")
    shopsmenu.SubMenu:AddItem(eau)
    eau:RightLabel("~g~20$")

    local limonade = NativeUI.CreateItem("Limonade", "")
    shopsmenu.SubMenu:AddItem(limonade)
    limonade:RightLabel("~g~30$")

    local icetea = NativeUI.CreateItem("Ice-Tea", "")
    shopsmenu.SubMenu:AddItem(icetea)
    icetea:RightLabel("~g~30$")

    local redbull = NativeUI.CreateItem("Redbull", "")
    shopsmenu.SubMenu:AddItem(redbull)
    redbull:RightLabel("~g~30$")

    local menergy = NativeUI.CreateItem("Monster Energy", "")
    shopsmenu.SubMenu:AddItem(menergy)
    menergy:RightLabel("~g~30$")

    local pain = NativeUI.CreateItem("Pain", "")
    shopsmenu2.SubMenu:AddItem(pain)
    pain:RightLabel("~g~20$")

    local sandwich = NativeUI.CreateItem("Sandwich", "")
    shopsmenu2.SubMenu:AddItem(sandwich)
    sandwich:RightLabel("~g~20$")

    local saucisson = NativeUI.CreateItem("Saucisson", "")
    shopsmenu2.SubMenu:AddItem(saucisson)
    saucisson:RightLabel("~g~30$")

    local cupcake = NativeUI.CreateItem("CupCake", "")
    shopsmenu2.SubMenu:AddItem(cupcake)
    cupcake:RightLabel("~g~30$")

    --local sac = NativeUI.CreateItem("Sac a dos", "")
    --gpsmenu.SubMenu:AddItem(sac)
    --sac:RightLabel("~g~600$")

    shopsmenu.SubMenu.OnItemSelect = function(menu, item)
    if item == eau then
            TriggerServerEvent('buyWater')
            ESX.ShowNotification('Vous avez payez ~r~20$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter de l'~b~eau", "", "CHAR_MULTIPLAYER", 1)
        elseif item == chocolat then
            TriggerServerEvent('buyChocolat')
            ESX.ShowNotification('Vous avez payez ~r~40$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter du ~b~chocolat", "", "CHAR_MULTIPLAYER", 1)
        elseif item == limonade then
            TriggerServerEvent('BuyLimonade')
            ESX.ShowNotification('Vous avez payez ~r~30$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter une bouteille de la ~b~limonade", "", "CHAR_MULTIPLAYER", 1)
        elseif item == icetea then
            TriggerServerEvent('buyIcetea')
            ESX.ShowNotification('Vous avez payez ~r~30$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter une bouteille d'~b~ice Tea", "", "CHAR_MULTIPLAYER", 1)
        elseif item == coffe then
            TriggerServerEvent('buyCafe')
            ESX.ShowNotification('Vous avez payez ~r~10$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter un ~b~Café", "", "CHAR_MULTIPLAYER", 1)
        elseif item == milk then
            TriggerServerEvent('buyLait')
            ESX.ShowNotification('Vous avez payez ~r~15$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter du ~b~Lait", "", "CHAR_MULTIPLAYER", 1)
        elseif item == redbull then
            TriggerServerEvent('buyRedbull')
            ESX.ShowNotification('Vous avez payez ~r~15$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter une canette de ~b~RedBull", "", "CHAR_MULTIPLAYER", 1)
        elseif item == menergy then
            TriggerServerEvent('buyMenergy')
            ESX.ShowNotification('Vous avez payez ~r~15$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter une canette de ~g~Monster Energy", "", "CHAR_MULTIPLAYER", 1)
        end
    end
    
    shopsmenu2.SubMenu.OnItemSelect = function(menu, item)
    if item == pain then
            TriggerServerEvent('buyPain')
            ESX.ShowNotification('Vous avez payez ~r~20$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter du ~b~pain", "", "CHAR_MULTIPLAYER", 1)
        elseif item == sandwich then
            TriggerServerEvent('buySandwich')
            ESX.ShowNotification('Vous avez payez ~r~35$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter un ~b~sandwich", "", "CHAR_MULTIPLAYER", 1)
        elseif item == saucisson then
            TriggerServerEvent('BuySaucisson')
            ESX.ShowNotification('Vous avez payez ~r~30$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter un ~b~Saucisson", "", "CHAR_MULTIPLAYER", 1)
        elseif item == cupcake then
            TriggerServerEvent('buyCupCake')
            ESX.ShowNotification('Vous avez payez ~r~35$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter un ~b~CupCake", "", "CHAR_MULTIPLAYER", 1)
        elseif item == sandwich then
            TriggerServerEvent('buySandwich')
            ESX.ShowNotification('Vous avez payez ~r~35$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter un ~b~Sandwich", "", "CHAR_MULTIPLAYER", 1)
        end
    end

    gpsmenu.SubMenu.OnItemSelect = function(menu, item)
    if item == gps then
            TriggerServerEvent('buyGPS')
            ESX.ShowNotification('Vous avez payez ~r~100$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter un ~b~GPS", "", "CHAR_MULTIPLAYER", 1)
        elseif item == tel then
            TriggerServerEvent('buyTEL')
            ESX.ShowNotification('Vous avez payez ~r~500$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter une ~b~Télephone", "", "CHAR_MULTIPLAYER", 1)
        elseif item == sim then
            TriggerServerEvent('buySIM')
            ESX.ShowNotification('Vous avez payez ~r~75$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter une ~b~Carte SIM", "", "CHAR_MULTIPLAYER", 1)
            ESX.ShowAdvancedNotification("Vendeur", "Vous pouvez l'utiliser via votre menu inventaire", "", "CHAR_MULTIPLAYER", 2)
        elseif item == jum then
            TriggerServerEvent('buyJUM')
            ESX.ShowNotification('Vous avez payez ~r~200$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Apu", "Vous avez acheter des ~b~jumelles", "", "CHAR_MULTIPLAYER", 1)
       --elseif item == sac then
       --    TriggerServerEvent('buySAC')
       --    ESX.ShowNotification('Vous avez payez ~r~600$')
       --    Citizen.Wait(1)
       --    ESX.ShowAdvancedNotification("Apu", "Vous avez acheter un ~b~sac a dos", "", "CHAR_MULTIPLAYER", 1)
        end
    end
end

AddShopsMenu(mainMenu)
_menuPool:RefreshIndex()

local zikoz = {
    {x = 25.742, y = -1345.741, z = 28.497},
    {x = 373.875, y = 325.896, z = 102.57},
    {x = 2557.458, y = 382.282, z = 100.319},
    {x = -3038.939, y = 585.954, z = 6.908},
    {x = -3241.927, y = 1001.462, z = 11.830},
    {x = 547.431, y = 2671.710, z = 41.156},
    {x = 1961.464, y = 3740.672, z = 31.343},
    {x = 2678.916, y = 3280.671, z = 54.241},
    {x = 1729.216, y = 6414.131, z = 34.037},
    {x = 1135.808, y = -982.281, z = 45.415},
    {x = -1222.915, y = -906.983, z = 11.326},
    {x = -1487.553, y = -379.107, z = 39.163},
    {x = -2968.243, y = 390.910, z = 14.043},
    {x = 1166.024, y = 2708.930, z = 37.157},
    {x = 1392.562, y = 3604.648, z = 33.980},
    {x = -48.519, y = -1757.514, z = 28.421},
    {x = 1163.373, y = -323.801, z = 68.205},
 --   {x = -707.501, y = -914.260, z = 18.215},
    {x = -1820.523, y = 792.518, z = 137.118},
   -- {x = 1698.388, y = 4924.404, z = 41.063}
    
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(zikoz) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, zikoz[k].x, zikoz[k].y, zikoz[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour discuter avec le ~b~vendeur")
				if IsControlJustPressed(1,51) then 
                    mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)

local blips = {
    {title="Epicerie d'Apu", colour=69, id=52, x = 25.742, y = -1345.741, z = 28.497},
    {title="Epicerie d'Apu", colour=69, id=52,x = 373.875, y = 325.896, z = 100.319},
    {title="Epicerie d'Apu", colour=69, id=52,x = 2557.458, y = 382.282, z = 100.319},
    {title="Epicerie d'Apu", colour=69, id=52,x = -3038.939, y = 585.954, z = 6.908},
    {title="Epicerie d'Apu", colour=69, id=52,x = -3241.927, y = 1001.462, z = 11.830},
    {title="Epicerie d'Apu", colour=69, id=52,x = 547.431, y = 2671.710, z = 41.156},
    {title="Epicerie d'Apu", colour=69, id=52,x = 1961.464, y = 3740.672, z = 31.343},
    {title="Epicerie d'Apu", colour=69, id=52,x = 2678.916, y = 3280.671, z = 54.241},
    {title="Epicerie d'Apu", colour=69, id=52,x = 1729.216, y = 6414.131, z = 34.037},
    {title="Epicerie d'Apu", colour=69, id=52,x = 1135.808, y = -982.281, z = 45.415},
    {title="Epicerie d'Apu", colour=69, id=52,x = -1222.915, y = -906.983, z = 11.326},
    {title="Epicerie d'Apu", colour=69, id=52,x = -1487.553, y = -379.107, z = 39.163},
    {title="Epicerie d'Apu", colour=69, id=52,x = -2968.243, y = 390.910, z = 14.043},
    {title="Epicerie d'Apu", colour=69, id=52,x = 1166.024, y = 2708.930, z = 37.157},
    {title="Epicerie d'Apu", colour=69, id=52,x = 1392.562, y = 3604.648, z = 33.980},
    {title="Epicerie d'Apu", colour=69, id=52,x = -48.519, y = -1757.514, z = 28.421},
    {title="Epicerie d'Apu", colour=69, id=52,x = 1163.373, y = -323.801, z = 68.205},
    {title="LTD Sud", colour=44, id=52,x = -707.501, y = -914.260, z = 18.215},
    {title="Epicerie d'Apu", colour=69, id=52,x = -1820.523, y = 792.518, z = 137.118},
    {title="LTD Nord", colour=44, id=52,x = 1698.388, y = 4924.404, z = 41.063}

}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)
