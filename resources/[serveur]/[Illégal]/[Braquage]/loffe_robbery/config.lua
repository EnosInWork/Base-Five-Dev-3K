Config = {}
Translation = {}

Config.Shopkeeper = 416176080 -- hash of the shopkeeper ped
Config.Locale = 'custom' -- 'en', 'sv' or 'custom'

Config.Shops = {
    -- {coords = vector3(x, y, z), heading = peds heading, money = {min, max}, cops = amount of cops required to rob, blip = true: add blip on map false: don't add blip, name = name of the store (when cops get alarm, blip name etc)}
    {coords = vector3(24.03, -1345.63, 29.5-0.98), heading = 266.0, money = {5000, 15000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
  --{coords = vector3(-705.73, -914.91, 19.22-0.98), heading = 91.0, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1134.16, -982.320, 46.41-0.98), heading = 271.4, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1164.65, -322.70, 69.20-0.98), heading = 100.5, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2556.99, 380.85, 108.62-0.98), heading = 355.794, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2678.033, 3279.38, 55.24-0.98), heading = 331.351, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1221.860, -908.20, 12.32-0.98), heading = 35.34, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1820.232, 794.332, 138.08-0.98), heading = 134.317, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3038.66, 584.583, 7.90-0.98), heading = 15.84, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3242.20, 999.97, 12.83-0.98), heading = 357.33, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(549.038, 2671.31, 12.15-0.98), heading = 97.53, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1392.80, 3606.40, 34.98-0.98), heading = 34.98, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1960.15, 3739.96, 32.34-0.98), heading = 306.89, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1727.95, 6415.356, 35.03-0.98), heading = 245.873, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
  --  {coords = vector3(1698.15, 4922.85, 42.06-0.98), heading = 331.26, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-47.10, -1758.30, 29.42-0.98), heading = 56.73, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1486.243, -378.03, 40.16-0.98), heading = 135.32, money = {7500, 20000}, cops = 2, blip = false, name = 'Holdup', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false}
}

Translation = {
    ['en'] = {
        ['shopkeeper'] = 'shopkeeper',
        ['robbed'] = "I was just robbed and ~r~don't ~w~have any money left!",
        ['cashrecieved'] = 'You got:',
        ['currency'] = '$',
        ['scared'] = 'Scared:',
        ['no_cops'] = 'There are ~r~not~w~ enough cops online!',
        ['cop_msg'] = 'We have sent a photo of the robber taken by the CCTV camera!',
        ['set_waypoint'] = 'Set waypoint to the store',
        ['hide_box'] = 'Close this box',
        ['robbery'] = 'Robbery in progress',
        ['walked_too_far'] = 'You walked too far away!'
    },
    ['sv'] = {
        ['shopkeeper'] = 'butiksbiträde',
        ['robbed'] = 'Jag blev precis rånad och har inga pengar kvar!',
        ['cashrecieved'] = 'Du fick:',
        ['currency'] = 'SEK',
        ['scared'] = 'Rädd:',
        ['no_cops'] = 'Det är inte tillräckligt med poliser online!',
        ['cop_msg'] = 'Vi har skickat en bild på rånaren från övervakningskamerorna!',
        ['set_waypoint'] = 'Sätt GPS punkt på butiken',
        ['hide_box'] = 'Stäng denna rutan',
        ['robbery'] = 'Pågående butiksrån',
        ['walked_too_far'] = 'Du gick för långt bort!'
    },
    ['custom'] = { -- edit this to your language
        ['shopkeeper'] = 'Commerçant',
        ['robbed'] = 'Je vien juste d\'être volé et ~r~ je n\'ai pas ~w~ d\'argent!',
        ['cashrecieved'] = 'Braquage réussi tu gagne :',
        ['currency'] = '$',
        ['scared'] = 'Effrayée:',
        ['no_cops'] = 'Il n\'y a ~r~ pas ~w~ assez de flics en ligne!',
        ['cop_msg'] = 'Nous avons envoyé une photo du voleur prise par la caméra de la superette',
        ['set_waypoint'] = 'Placer un point',
        ['hide_box'] = 'Fermer ce cadrant',
        ['robbery'] = 'Braquage en cours',
        ['walked_too_far'] = 'Tu t\'es trop éloigné'
    }
}