---@type table
ValUI.LastControl = false

---IsMouseInBounds
---@param X number
---@param Y number
---@param Width number
---@param Height number
---@return number
---@public
function ValUI.IsMouseInBounds(X, Y, Width, Height)
    local MX, MY = math.round(GetControlNormal(0, 239) * 1920) / 1920, math.round(GetControlNormal(0, 240) * 1080) / 1080
    X, Y = X / 1920, Y / 1080
    Width, Height = Width / 1920, Height / 1080
    return (MX >= X and MX <= X + Width) and (MY > Y and MY < Y + Height)
end

---GetSafeZoneBounds
---@return table
---@public
function ValUI.GetSafeZoneBounds()
    local SafeSize = GetSafeZoneSize()
    SafeSize = math.round(SafeSize, 2)
    SafeSize = (SafeSize * 100) - 90
    SafeSize = 10 - SafeSize

    local W, H = 1920, 1080

    return { X = math.round(SafeSize * ((W / H) * 5.4)), Y = math.round(SafeSize * 5.4) }
end
---GoUp
---@param Options number
---@return nil
---@public
function ValUI.GoUp(Options)
    if ValUI.CurrentMenu ~= nil then
        Options = ValUI.CurrentMenu.Options
        if ValUI.CurrentMenu() then
            if (Options ~= 0) then
                if Options > ValUI.CurrentMenu.Pagination.Total then
                    if ValUI.CurrentMenu.Index <= ValUI.CurrentMenu.Pagination.Minimum then
                        if ValUI.CurrentMenu.Index == 1 then
                            ValUI.CurrentMenu.Pagination.Minimum = Options - (ValUI.CurrentMenu.Pagination.Total - 1)
                            ValUI.CurrentMenu.Pagination.Maximum = Options
                            ValUI.CurrentMenu.Index = Options
                        else
                            ValUI.CurrentMenu.Pagination.Minimum = (ValUI.CurrentMenu.Pagination.Minimum - 1)
                            ValUI.CurrentMenu.Pagination.Maximum = (ValUI.CurrentMenu.Pagination.Maximum - 1)
                            ValUI.CurrentMenu.Index = ValUI.CurrentMenu.Index - 1
                        end
                    else
                        ValUI.CurrentMenu.Index = ValUI.CurrentMenu.Index - 1
                    end
                else
                    if ValUI.CurrentMenu.Index == 1 then
                        ValUI.CurrentMenu.Pagination.Minimum = Options - (ValUI.CurrentMenu.Pagination.Total - 1)
                        ValUI.CurrentMenu.Pagination.Maximum = Options
                        ValUI.CurrentMenu.Index = Options
                    else
                        ValUI.CurrentMenu.Index = ValUI.CurrentMenu.Index - 1
                    end
                end

                local Audio = ValUI.Settings.Audio
                ValUI.PlaySound(Audio[Audio.Use].UpDown.audioName, Audio[Audio.Use].UpDown.audioRef)
                ValUI.LastControl = true
            else
                local Audio = ValUI.Settings.Audio
                ValUI.PlaySound(Audio[Audio.Use].Error.audioName, Audio[Audio.Use].Error.audioRef)
            end
        end
    end
end

---GoDown
---@param Options number
---@return nil
---@public
function ValUI.GoDown(Options)
    if ValUI.CurrentMenu ~= nil then
        Options = ValUI.CurrentMenu.Options
        if ValUI.CurrentMenu() then
            if (Options ~= 0) then
                if Options > ValUI.CurrentMenu.Pagination.Total then
                    if ValUI.CurrentMenu.Index >= ValUI.CurrentMenu.Pagination.Maximum then
                        if ValUI.CurrentMenu.Index == Options then
                            ValUI.CurrentMenu.Pagination.Minimum = 1
                            ValUI.CurrentMenu.Pagination.Maximum = ValUI.CurrentMenu.Pagination.Total
                            ValUI.CurrentMenu.Index = 1
                        else
                            ValUI.CurrentMenu.Pagination.Maximum = (ValUI.CurrentMenu.Pagination.Maximum + 1)
                            ValUI.CurrentMenu.Pagination.Minimum = ValUI.CurrentMenu.Pagination.Maximum - (ValUI.CurrentMenu.Pagination.Total - 1)
                            ValUI.CurrentMenu.Index = ValUI.CurrentMenu.Index + 1
                        end
                    else
                        ValUI.CurrentMenu.Index = ValUI.CurrentMenu.Index + 1
                    end
                else
                    if ValUI.CurrentMenu.Index == Options then
                        ValUI.CurrentMenu.Pagination.Minimum = 1
                        ValUI.CurrentMenu.Pagination.Maximum = ValUI.CurrentMenu.Pagination.Total
                        ValUI.CurrentMenu.Index = 1
                    else
                        ValUI.CurrentMenu.Index = ValUI.CurrentMenu.Index + 1
                    end
                end
                local Audio = ValUI.Settings.Audio
                ValUI.PlaySound(Audio[Audio.Use].UpDown.audioName, Audio[Audio.Use].UpDown.audioRef)
                ValUI.LastControl = false
            else
                local Audio = ValUI.Settings.Audio
                ValUI.PlaySound(Audio[Audio.Use].Error.audioName, Audio[Audio.Use].Error.audioRef)
            end
        end
    end
end

function ValUI.GoLeft(Controls)
    if Controls.Left.Enabled then
        for Index = 1, #Controls.Left.Keys do
            if not Controls.Left.Pressed then
                if IsDisabledControlJustPressed(Controls.Left.Keys[Index][1], Controls.Left.Keys[Index][2]) then
                    Controls.Left.Pressed = true

                    Citizen.CreateThread(function()
                        Controls.Left.Active = true

                        Citizen.Wait(0.01)

                        Controls.Left.Active = false

                        Citizen.Wait(174.99)

                        while Controls.Left.Enabled and IsDisabledControlPressed(Controls.Left.Keys[Index][1], Controls.Left.Keys[Index][2]) do
                            Controls.Left.Active = true

                            Citizen.Wait(0.01)

                            Controls.Left.Active = false

                            Citizen.Wait(124.99)
                        end

                        Controls.Left.Pressed = false
                        Wait(10)
                    end)

                    break
                end
            end
        end
    end
end

function ValUI.GoRight(Controls)
    if Controls.Right.Enabled then
        for Index = 1, #Controls.Right.Keys do
            if not Controls.Right.Pressed then
                if IsDisabledControlJustPressed(Controls.Right.Keys[Index][1], Controls.Right.Keys[Index][2]) then
                    Controls.Right.Pressed = true

                    Citizen.CreateThread(function()
                        Controls.Right.Active = true

                        Citizen.Wait(0.01)

                        Controls.Right.Active = false

                        Citizen.Wait(174.99)

                        while Controls.Right.Enabled and IsDisabledControlPressed(Controls.Right.Keys[Index][1], Controls.Right.Keys[Index][2]) do
                            Controls.Right.Active = true

                            Citizen.Wait(1)

                            Controls.Right.Active = false

                            Citizen.Wait(124.99)
                        end

                        Controls.Right.Pressed = false
                        Wait(10)
                    end)

                    break
                end
            end
        end
    end
end

function ValUI.GoSliderLeft(Controls)
    if Controls.SliderLeft.Enabled then
        for Index = 1, #Controls.SliderLeft.Keys do
            if not Controls.SliderLeft.Pressed then
                if IsDisabledControlJustPressed(Controls.SliderLeft.Keys[Index][1], Controls.SliderLeft.Keys[Index][2]) then
                    Controls.SliderLeft.Pressed = true
                    Citizen.CreateThread(function()
                        Controls.SliderLeft.Active = true
                        Citizen.Wait(1)
                        Controls.SliderLeft.Active = false
                        while Controls.SliderLeft.Enabled and IsDisabledControlPressed(Controls.SliderLeft.Keys[Index][1], Controls.SliderLeft.Keys[Index][2]) do
                            Controls.SliderLeft.Active = true
                            Citizen.Wait(1)
                            Controls.SliderLeft.Active = false
                        end
                        Controls.SliderLeft.Pressed = false
                    end)
                    break
                end
            end
        end
    end
end

function ValUI.GoSliderRight(Controls)
    if Controls.SliderRight.Enabled then
        for Index = 1, #Controls.SliderRight.Keys do
            if not Controls.SliderRight.Pressed then
                if IsDisabledControlJustPressed(Controls.SliderRight.Keys[Index][1], Controls.SliderRight.Keys[Index][2]) then
                    Controls.SliderRight.Pressed = true
                    Citizen.CreateThread(function()
                        Controls.SliderRight.Active = true
                        Citizen.Wait(1)
                        Controls.SliderRight.Active = false
                        while Controls.SliderRight.Enabled and IsDisabledControlPressed(Controls.SliderRight.Keys[Index][1], Controls.SliderRight.Keys[Index][2]) do
                            Controls.SliderRight.Active = true
                            Citizen.Wait(1)
                            Controls.SliderRight.Active = false
                        end
                        Controls.SliderRight.Pressed = false
                    end)
                    break
                end
            end
        end
    end
end

---Controls
---@return nil
---@public
function ValUI.Controls()
    if ValUI.CurrentMenu ~= nil then
        if ValUI.CurrentMenu() then
            if ValUI.CurrentMenu.Open then

                local Controls = ValUI.CurrentMenu.Controls;
                ---@type number
                local Options = ValUI.CurrentMenu.Options
                ValUI.Options = ValUI.CurrentMenu.Options
                if ValUI.CurrentMenu.EnableMouse then
                    DisableAllControlActions(2)
                end

                if not IsInputDisabled(2) then
                    for Index = 1, #Controls.Enabled.Controller do
                        EnableControlAction(Controls.Enabled.Controller[Index][1], Controls.Enabled.Controller[Index][2], true)
                    end
                else
                    for Index = 1, #Controls.Enabled.Keyboard do
                        EnableControlAction(Controls.Enabled.Keyboard[Index][1], Controls.Enabled.Keyboard[Index][2], true)
                    end
                end

                if Controls.Up.Enabled then
                    for Index = 1, #Controls.Up.Keys do
                        if not Controls.Up.Pressed then
                            if IsDisabledControlJustPressed(Controls.Up.Keys[Index][1], Controls.Up.Keys[Index][2]) then
                                Controls.Up.Pressed = true

                                Citizen.CreateThread(function()
                                    ValUI.GoUp(Options)

                                    Citizen.Wait(175)

                                    while Controls.Up.Enabled and IsDisabledControlPressed(Controls.Up.Keys[Index][1], Controls.Up.Keys[Index][2]) do
                                        ValUI.GoUp(Options)

                                        Citizen.Wait(50)
                                    end

                                    Controls.Up.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if Controls.Down.Enabled then
                    for Index = 1, #Controls.Down.Keys do
                        if not Controls.Down.Pressed then
                            if IsDisabledControlJustPressed(Controls.Down.Keys[Index][1], Controls.Down.Keys[Index][2]) then
                                Controls.Down.Pressed = true

                                Citizen.CreateThread(function()
                                    ValUI.GoDown(Options)

                                    Citizen.Wait(175)

                                    while Controls.Down.Enabled and IsDisabledControlPressed(Controls.Down.Keys[Index][1], Controls.Down.Keys[Index][2]) do
                                        ValUI.GoDown(Options)

                                        Citizen.Wait(50)
                                    end

                                    Controls.Down.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                ValUI.GoLeft(Controls)
                --- Default Left navigation
                ValUI.GoRight(Controls) --- Default Right navigation

                ValUI.GoSliderLeft(Controls)
                ValUI.GoSliderRight(Controls)

                if Controls.Select.Enabled then
                    for Index = 1, #Controls.Select.Keys do
                        if not Controls.Select.Pressed then
                            if IsDisabledControlJustPressed(Controls.Select.Keys[Index][1], Controls.Select.Keys[Index][2]) then
                                Controls.Select.Pressed = true

                                Citizen.CreateThread(function()
                                    Controls.Select.Active = true

                                    Citizen.Wait(0.01)

                                    Controls.Select.Active = false

                                    Citizen.Wait(174.99)

                                    while Controls.Select.Enabled and IsDisabledControlPressed(Controls.Select.Keys[Index][1], Controls.Select.Keys[Index][2]) do
                                        Controls.Select.Active = true

                                        Citizen.Wait(0.01)

                                        Controls.Select.Active = false

                                        Citizen.Wait(124.99)
                                    end

                                    Controls.Select.Pressed = false

                                end)

                                break
                            end
                        end
                    end
                end

                if Controls.Click.Enabled then
                    for Index = 1, #Controls.Click.Keys do
                        if not Controls.Click.Pressed then
                            if IsDisabledControlJustPressed(Controls.Click.Keys[Index][1], Controls.Click.Keys[Index][2]) then
                                Controls.Click.Pressed = true

                                Citizen.CreateThread(function()
                                    Controls.Click.Active = true

                                    Citizen.Wait(0.01)

                                    Controls.Click.Active = false

                                    Citizen.Wait(174.99)

                                    while Controls.Click.Enabled and IsDisabledControlPressed(Controls.Click.Keys[Index][1], Controls.Click.Keys[Index][2]) do
                                        Controls.Click.Active = true

                                        Citizen.Wait(0.01)

                                        Controls.Click.Active = false

                                        Citizen.Wait(124.99)
                                    end

                                    Controls.Click.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end
                if Controls.Back.Enabled then
                    for Index = 1, #Controls.Back.Keys do
                        if not Controls.Back.Pressed then
                            if IsDisabledControlJustPressed(Controls.Back.Keys[Index][1], Controls.Back.Keys[Index][2]) then
                                Controls.Back.Pressed = true
                                Wait(10)
                                break
                            end
                        end
                    end
                end

            end
        end
    end
end

---Navigation
---@return nil
---@public
function ValUI.Navigation()
    if ValUI.CurrentMenu ~= nil then
        if ValUI.CurrentMenu() then
            if ValUI.CurrentMenu.EnableMouse then
                ShowCursorThisFrame()
            end
            if ValUI.Options > ValUI.CurrentMenu.Pagination.Total then

                ---@type boolean
                local UpHovered = false

                ---@type boolean
                local DownHovered = false

                if not ValUI.CurrentMenu.SafeZoneSize then
                    ValUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if ValUI.CurrentMenu.Safezone then
                        ValUI.CurrentMenu.SafeZoneSize = ValUI.GetSafeZoneBounds()

                        SetScriptGfxAlign(76, 84)
                        SetScriptGfxAlignParams(0, 0, 0, 0)
                    end
                end

                UpHovered = ValUI.IsMouseInBounds(ValUI.CurrentMenu.X + ValUI.CurrentMenu.SafeZoneSize.X, ValUI.CurrentMenu.Y + ValUI.CurrentMenu.SafeZoneSize.Y + ValUI.CurrentMenu.SubtitleHeight + ValUI.ItemOffset, ValUI.Settings.Items.Navigation.Rectangle.Width + ValUI.CurrentMenu.WidthOffset, ValUI.Settings.Items.Navigation.Rectangle.Height)
                DownHovered = ValUI.IsMouseInBounds(ValUI.CurrentMenu.X + ValUI.CurrentMenu.SafeZoneSize.X, ValUI.CurrentMenu.Y + ValUI.Settings.Items.Navigation.Rectangle.Height + ValUI.CurrentMenu.SafeZoneSize.Y + ValUI.CurrentMenu.SubtitleHeight + ValUI.ItemOffset, ValUI.Settings.Items.Navigation.Rectangle.Width + ValUI.CurrentMenu.WidthOffset, ValUI.Settings.Items.Navigation.Rectangle.Height)

                if ValUI.CurrentMenu.EnableMouse then


                    if ValUI.CurrentMenu.Controls.Click.Active then
                        if UpHovered then
                            ValUI.GoUp(ValUI.Options)
                        elseif DownHovered then
                            ValUI.GoDown(ValUI.Options)
                        end
                    end

                    if UpHovered then
                        RenderRectangle(ValUI.CurrentMenu.X, ValUI.CurrentMenu.Y + ValUI.CurrentMenu.SubtitleHeight + ValUI.ItemOffset, ValUI.Settings.Items.Navigation.Rectangle.Width + ValUI.CurrentMenu.WidthOffset, ValUI.Settings.Items.Navigation.Rectangle.Height, 30, 30, 30, 255)
                    else
                        RenderRectangle(ValUI.CurrentMenu.X, ValUI.CurrentMenu.Y + ValUI.CurrentMenu.SubtitleHeight + ValUI.ItemOffset, ValUI.Settings.Items.Navigation.Rectangle.Width + ValUI.CurrentMenu.WidthOffset, ValUI.Settings.Items.Navigation.Rectangle.Height, 0, 0, 0, 200)
                    end

                    if DownHovered then
                        RenderRectangle(ValUI.CurrentMenu.X, ValUI.CurrentMenu.Y + ValUI.Settings.Items.Navigation.Rectangle.Height + ValUI.CurrentMenu.SubtitleHeight + ValUI.ItemOffset, ValUI.Settings.Items.Navigation.Rectangle.Width + ValUI.CurrentMenu.WidthOffset, ValUI.Settings.Items.Navigation.Rectangle.Height, 30, 30, 30, 255)
                    else
                        RenderRectangle(ValUI.CurrentMenu.X, ValUI.CurrentMenu.Y + ValUI.Settings.Items.Navigation.Rectangle.Height + ValUI.CurrentMenu.SubtitleHeight + ValUI.ItemOffset, ValUI.Settings.Items.Navigation.Rectangle.Width + ValUI.CurrentMenu.WidthOffset, ValUI.Settings.Items.Navigation.Rectangle.Height, 0, 0, 0, 200)
                    end
                else
                    RenderRectangle(ValUI.CurrentMenu.X, ValUI.CurrentMenu.Y + ValUI.CurrentMenu.SubtitleHeight + ValUI.ItemOffset, ValUI.Settings.Items.Navigation.Rectangle.Width + ValUI.CurrentMenu.WidthOffset, ValUI.Settings.Items.Navigation.Rectangle.Height, 0, 0, 0, 200)
                    RenderRectangle(ValUI.CurrentMenu.X, ValUI.CurrentMenu.Y + ValUI.Settings.Items.Navigation.Rectangle.Height + ValUI.CurrentMenu.SubtitleHeight + ValUI.ItemOffset, ValUI.Settings.Items.Navigation.Rectangle.Width + ValUI.CurrentMenu.WidthOffset, ValUI.Settings.Items.Navigation.Rectangle.Height, 0, 0, 0, 200)
                end
                RenderSprite(ValUI.Settings.Items.Navigation.Arrows.Dictionary, ValUI.Settings.Items.Navigation.Arrows.Texture, ValUI.CurrentMenu.X + ValUI.Settings.Items.Navigation.Arrows.X + (ValUI.CurrentMenu.WidthOffset / 2), ValUI.CurrentMenu.Y + ValUI.Settings.Items.Navigation.Arrows.Y + ValUI.CurrentMenu.SubtitleHeight + ValUI.ItemOffset, ValUI.Settings.Items.Navigation.Arrows.Width, ValUI.Settings.Items.Navigation.Arrows.Height)

                ValUI.ItemOffset = ValUI.ItemOffset + (ValUI.Settings.Items.Navigation.Rectangle.Height * 2)

            end
        end
    end
end

---GoBack
---@return nil
---@public
function ValUI.GoBack()
    if ValUI.CurrentMenu ~= nil then
        local Audio = ValUI.Settings.Audio
        ValUI.PlaySound(Audio[Audio.Use].Back.audioName, Audio[Audio.Use].Back.audioRef)
        if ValUI.CurrentMenu.Parent ~= nil then
            if ValUI.CurrentMenu.Parent() then
                ValUI.NextMenu = ValUI.CurrentMenu.Parent
            else
                ValUI.NextMenu = nil
                ValUI.Visible(ValUI.CurrentMenu, false)
            end
        else
            ValUI.NextMenu = nil
            ValUI.Visible(ValUI.CurrentMenu, false)
        end
    end
end
