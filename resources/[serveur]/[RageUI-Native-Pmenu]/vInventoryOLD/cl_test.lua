Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
RMenu.Add('personal', 'main', RageUI.CreateMenu("Inventaire", "", 10,222))
--RMenu.Add('personal', 'poing', RageUI.CreateSubMenu(RMenu:Get('armurie', 'main'), "Armurie", "List des armes de poings"))
RMenu:Get('personal', 'main'):SetSubtitle("~r~3K")
RMenu:Get('personal', 'main').EnableMouse = false
RMenu:Get('personal', 'main').Closed = function()
    open = false
        end
    end;
end)

local menuColor = {66, 173, 245}
Citizen.CreateThread(function()
    Wait(1000)
    menuColor[1] = GetResourceKvpInt("menuR")
    menuColor[2] = GetResourceKvpInt("menuG")
    menuColor[3] = GetResourceKvpInt("menuB")
    ReloadColor()
end)

local AllMenuToChange = nil
function ReloadColor()
    Citizen.CreateThread(function()
        if AllMenuToChange == nil then
            AllMenuToChange = {}
            for Name, Menu in pairs(RMenu['personal']) do
                if Menu.Menu.Sprite.Dictionary == "commonmenu" then
                    table.insert(AllMenuToChange, Name)
                end
            end
        end
        for k,v in pairs(AllMenuToChange) do
            RMenu:Get('personal', v):SetRectangleBanner(menuColor[1], menuColor[2], menuColor[3], 255)
        end
    end)
end

open = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    if IsControlJustPressed(0,327) then
        openInventory()
        end
    end
end)

function openInventory()
    if open then
        open = false
    else
        open = true
        RageUI.Visible(RMenu:Get('personal', 'main'), true)

    Citizen.CreateThread(function()
        while open do
            Citizen.Wait(1)

            RageUI.IsVisible(RMenu:Get('personal', 'main'), true, true, true, function()


                end,function()
                end)
            end
        end)
    end
end
