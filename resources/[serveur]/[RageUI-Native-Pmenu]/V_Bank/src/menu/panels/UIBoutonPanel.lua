local TextPanels = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 42 },
    Text = {
        Left = { X = 8, Y = 10, Scale = 0.27 },
        Right = { X = 8, Y = 10, Scale = 0.28 },
    },
}

---BoutonPanel
---@param LeftText string
---@param RightText string
---@public
function ValUI.BoutonPanel(LeftText, RightText, Index)
    local CurrentMenu = ValUI.CurrentMenu
    if CurrentMenu ~= nil then
        local leftTextSize = MeasureStringWidth(LeftText)
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            RenderRectangle(CurrentMenu.X, CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + ValUI.ItemOffset + (ValUI.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height, 0, 0, 0, 170)
            RenderText(LeftText or "", CurrentMenu.X + TextPanels.Text.Left.X, (ValUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Left.Y + CurrentMenu.SubtitleHeight + ValUI.ItemOffset, 0, TextPanels.Text.Left.Scale, 245, 245, 245, 255, 0)
            RenderText(RightText or "", CurrentMenu.X + TextPanels.Background.Width + CurrentMenu.WidthOffset - leftTextSize, (ValUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Left.Y + CurrentMenu.SubtitleHeight + ValUI.ItemOffset, 0, TextPanels.Text.Left.Scale, 245, 245, 245, 255, 2)
            ValUI.StatisticPanelCount = ValUI.StatisticPanelCount + 1
        end
    end
end