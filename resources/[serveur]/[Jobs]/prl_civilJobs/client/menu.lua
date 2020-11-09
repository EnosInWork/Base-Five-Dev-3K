RMenu.Add('Pole Emploie', 'main', RageUI.CreateMenu("", " "))
RMenu:Get('Pole Emploie', 'main'):SetSubtitle("~b~Pole Emploie Central d'Intérim")
RMenu:Get('Pole Emploie', 'main').EnableMouse = false;
RMenu:Get('Pole Emploie', 'main').Closed = function()
    RenderScriptCams(0, 1, 1500, 1, 1)
    DestroyCam(cam, 1)
    SetBlockingOfNonTemporaryEvents(Ped, 1)
end

local metier = {
    jardinier = {
        nom = "Nettoyer le golf",
        desc = "Viens aider les jardiniers du golf à faire leur travaille !",
        coords = zone.Jardinier,
    },
    Mine = {
        nom = "Travailler à la mine",
        desc = "Viens travailler à la mine !",
        coords = zone.mine,
    },
    Bucheron = {
        nom = "Travailler en temps que bucheron",
        desc = "Viens travailler dans la forêt !",
        coords = zone.bucheron,
    },
    chantier = {
        nom = "Travailler au chantier",
        desc = "Viens travailler au chantier !",
        coords = zone.Chantier,
    },
}

RageUI.Text({
    message = string.format("message")
})

RageUI.CreateWhile(1.0, function()
    local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), zone.Lifeinveders, true)
    if distance <= 3.0 then
        HelpMsg("Appuyer sur ~b~E~w~ pour parler avec la personne.")
        if IsControlJustPressed(1, 51) and distance <= 3.0 then
            RageUI.Visible(RMenu:Get('Pole Emploie', 'main'), not RageUI.Visible(RMenu:Get('Pole Emploie', 'main')))
            CreateCamera()
        end
    end

    if RageUI.Visible(RMenu:Get('Pole Emploie', 'main')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()


        
            for _,v in pairs(metier) do
                RageUI.Button(v.nom, v.desc, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        SetNewWaypoint(v.coords)
                        RageUI.Visible(RMenu:Get('Pole Emploie', 'main'), not RageUI.Visible(RMenu:Get('Pole Emploie', 'main')))
                        RenderScriptCams(0, 1, 1500, 1, 1)
                        DestroyCam(cam, 1)
                        RageUI.Popup({
                            message = "Vous avez choisis de ~b~"..v.nom.."~w~ ? Très bien, je vous ai donné les coordonées GPS sur votre téléphone. ~g~Merci d'utiliser les services Pole Emploie !",
                            sound = {
                                audio_name = "BASE_JUMP_PASSED",
                                audio_ref = "HUD_AWARDS",
                            }
                        })
                    end
                end)
            end
        end, function()
            ---Panels
        end)
    end
end, 1)