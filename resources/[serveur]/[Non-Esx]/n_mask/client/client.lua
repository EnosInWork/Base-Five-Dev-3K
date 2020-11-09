
ESX								= nil
playerGroup = nil
Config = {}


local attente = 250

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	attente = 200
end)
-----------------------------------
     --Magasin de masque--
------------------------------------

-----------------------
     --Save Mask--
-----------------------

function LinkedSaveSkins()
	TriggerEvent('skinchanger:getSkin', function(skin)
		LastSkin = skin
	end)
	TriggerEvent('skinchanger:getSkin', function(skin)
	TriggerServerEvent('Linked:saveMask', skin)
	end)
end


function destorycam() 	
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    TriggerServerEvent('barbershop:removeposition')
end


function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end


local yoyo = {
	"Normal",
	"Cochon",
	"Skelet",
	"Singe",
	"Hockey 1",
	"Singe 2",
	"Clown",
	"Devil",
	"Pernowell",
	"Serre",
	"Bonome de neige",
	"Lunettes",
	"Lunettes 2",
	"Baby",
	"Hockey 2",
	"Hockey 3",
	"Terminator",
	"Chat",
	"Renard",
	"Hibout",
	"Raton",
	"Ours",
	"Boeuf",
	"Boeuf 2",
	"Tête",
	"Tête 2",
	"Loup",
	"Casque d'avion",
	"Monster",
	"Monster 2",
	"Hockey 4",
	"Pingouin",
	"Cagoule",
	"Cookies",
	"Old",
	"Cagoule 2",
	"Mask oxygen",
	"Cagoule 3",
	"Mask oxygen 2",
	"Monster 3",
	"Monster 4",
	"Monster 5",
	"Monster 6",
	"Man 1",
	"Girl",
	"Man 2",
	"Mask oxygen 3",
	"Bandana",
	"Bandana 2",
	"Papier",
	"Hockey 5",
	"Foulard",
	"Cagoule 4",
	"Cagoule 5",
	"Bandana 3",
	"Cagoule 6",
	"Cagoule 7",
	"Cagoule 8",
	"Cagoule 9",
	"Monster 7",
	"Citrouille",
}

local Couleur = {
	"1",
	"2",
	"3",
}
local Couleurs = {
	"1",
	"2",

}
local Couleurss = {
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"10",
}
-----------------------
     --Menu--
-----------------------

local ClosesShops = {
    Base = { Header = {"shopui_title_highendfashion", "shopui_title_highendfashion"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Masque", Blocked = true },
    Data = { currentMenu = "Masque disponibles: ", "Test" },
    Events = {

		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum 
			local btn = btn.name
			local check = btn.unkCheckbox


			if btn == "Masque" then
				OpenMenu('Masque disponibles: ')
			
elseif btn == "~r~Quitter le menu" then
	PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)
				SetEntityInvincible(GetPlayerPed(-1), false)   
				FreezeEntityPosition(GetPlayerPed(-1), false)
				DrawSub('', 1)
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
				end)
	destorycam()
	CloseMenu('ClosesShops')
				---------cochon
			elseif slide == 2 and btn == "Tester Masque:" then
				OpenMenu('Cochon')
			elseif slide == 1 and btn == "Masque Cochon" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque1", "Masque1")
			elseif slide == 2 and btn == "Masque Cochon" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque1_2", "Masque1_2")
			elseif slide == 3 and btn == "Masque Cochon" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque1_3", "Masque1_3")
				---------Sekelet
			elseif slide == 3 and btn == "Tester Masque:" then
				OpenMenu('Skelet')
			elseif slide == 1 and btn == "Masque Skelet" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque2", "Masque2")
			elseif slide == 2 and btn == "Masque Skelet" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque2_1", "Masque2_1")
			elseif slide == 3 and btn == "Masque Skelet" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque2_2", "Masque2_2")
					---------Singe
			elseif slide == 4 and btn == "Tester Masque:" then  TriggerServerEvent('KrXDarkShop:buy', 1, "Masque3", "Masque3")
				---------Hockey 1
			elseif slide == 5 and btn == "Tester Masque:" then
				OpenMenu('Hockey 1')
			elseif slide == 1 and btn == "Masque Hockey 1" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque4", "Masque4")
			elseif slide == 2 and btn == "Masque Hockey 1" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque4_1", "Masque4_1")
			elseif slide == 3 and btn == "Masque Hockey 1" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque4_2", "Masque4_2")
					---------Singe 2
			elseif slide == 6 and btn == "Tester Masque:" then
				OpenMenu('Singe 2')
			elseif slide == 1 and btn == "Masque Singe 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque5", "Masque5")
			elseif slide == 2 and btn == "Masque Singe 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque5_1", "Masque5_1")
			elseif slide == 3 and btn == "Masque Singe 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque5_2", "Masque5_2")
				---------Clown
			elseif slide == 7 and btn == "Tester Masque:" then
				OpenMenu('Clown')
			elseif slide == 1 and btn == "Masque Clown" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque6", "Masque6")
			elseif slide == 2 and btn == "Masque Clown" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque6_1", "Masque6_1")
			elseif slide == 3 and btn == "Masque Clown" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque6_2", "Masque6_2")
					---------Devil
			elseif slide == 8 and btn == "Tester Masque:" then
				OpenMenu('Devil')
			elseif slide == 1 and btn == "Masque Devil" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque7", "Masque7")
			elseif slide == 2 and btn == "Masque Devil" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque7_1", "Masque7_1")
			elseif slide == 3 and btn == "Masque Devil" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque7_2", "Masque7_2")
				---------Pernowell
			elseif slide == 9 and btn == "Tester Masque:" then
				OpenMenu('Pernowell')
			elseif slide == 1 and btn == "Masque Pernowell" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque8", "Masque8")
			elseif slide == 2 and btn == "Masque Pernowell" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque8_1", "Masque8_1")
			elseif slide == 3 and btn == "Masque Pernowell" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque8_2", "Masque8_2")
				---------Serre
			elseif slide == 10 and btn == "Tester Masque:" then  	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque9", "Masque9")
					---------Serre
			elseif slide == 11 and btn == "Tester Masque:" then  	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque10", "Masque10")
				---------Lunettes
			elseif slide == 12 and btn == "Tester Masque:" then
				OpenMenu('Lunettes')
			elseif slide == 1 and btn == "Masque Lunettes" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque11", "Masque11")
			elseif slide == 2 and btn == "Masque Lunettes" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque11_1", "Masque11_1")
			elseif slide == 3 and btn == "Masque Lunettes" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque11_2", "Masque11_2")
						---------Lunettes2
			elseif slide == 13 and btn == "Tester Masque:" then
				OpenMenu('Lunettes 2')
			elseif slide == 1 and btn == "Masque Lunettes 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque12", "Masque12")
			elseif slide == 2 and btn == "Masque Lunettes 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque12_1", "Masque12_1")
			elseif slide == 3 and btn == "Masque Lunettes 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque12_2", "Masque12_2")
				---------Serre
			elseif slide == 14 and btn == "Tester Masque:" then  	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque13", "Masque13")
						---------Hockey2
			elseif slide == 15 and btn == "Tester Masque:" then
				OpenMenu('Hockey 2')
			elseif slide == 1 and btn == "Masque Hockey 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque14", "Masque14")
			elseif slide == 2 and btn == "Masque Hockey 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque14_1", "Masque14_1")
			elseif slide == 3 and btn == "Masque Hockey 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque14_2", "Masque14_2")
						---------Hockey3
			elseif slide == 16 and btn == "Tester Masque:" then
				OpenMenu('Hockey 3')
			elseif slide == 1 and btn == "Masque Hockey 3" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque15", "Masque15")
			elseif slide == 2 and btn == "Masque Hockey 3" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque15_1", "Masque15_1")
			elseif slide == 3 and btn == "Masque Hockey 3" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque15_2", "Masque15_2")
					---------Terminator
			elseif slide == 17 and btn == "Tester Masque:" then
				OpenMenu('Terminator')
			elseif slide == 1 and btn == "Masque Terminator" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque16", "Masque16")
			elseif slide == 2 and btn == "Masque Terminator" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque16_1", "Masque16_1")
			elseif slide == 3 and btn == "Masque Terminator" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque16_2", "Masque16_2")
				---------Chat
			elseif slide == 18 and btn == "Tester Masque:" then
				OpenMenu('Chat')
			elseif slide == 1 and btn == "Masque Chat" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque17", "Masque17")
			elseif slide == 2 and btn == "Masque Chat" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque17_1", "Masque17_1")
			elseif slide == 3 and btn == "Masque Chat" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque17_2", "Masque17_2")
				---------Renard
			elseif slide == 19 and btn == "Tester Masque:" then
				OpenMenu('Renard')
			elseif slide == 1 and btn == "Masque Renard" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque18", "Masque18")
			elseif slide == 2 and btn == "Masque Renard" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque18_1", "Masque18_1")
			elseif slide == 3 and btn == "Masque Renard" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque18_2", "Masque18_2")
				---------Hibout
			elseif slide == 20 and btn == "Tester Masque:" then
				OpenMenu('Hibout')
			elseif slide == 1 and btn == "Masque Hibout" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque19", "Masque19")
			elseif slide == 2 and btn == "Masque Hibout" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque19_1", "Masque19_1")
			elseif slide == 3 and btn == "Masque Hibout" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque19_2", "Masque19_2")
					---------Raton
			elseif slide == 21 and btn == "Tester Masque:" then
				OpenMenu('Raton')
			elseif slide == 1 and btn == "Masque Raton" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque20", "Masque20")
			elseif slide == 2 and btn == "Masque Raton" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque20_1", "Masque20_1")
			elseif slide == 3 and btn == "Masque Raton" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque20_2", "Masque20_2")
					---------Ours Boeuf
			elseif slide == 22 and btn == "Tester Masque:" then
				OpenMenu('Ours')
			elseif slide == 1 and btn == "Masque Ours" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque21", "Masque21")
			elseif slide == 2 and btn == "Masque Ours" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque21_1", "Masque21_1")
			elseif slide == 3 and btn == "Masque Ours" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque21_2", "Masque21_2")
						---------Boeuf
			elseif slide == 23 and btn == "Tester Masque:" then
				OpenMenu('Boeuf')
			elseif slide == 1 and btn == "Masque Boeuf" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque22", "Masque22")
			elseif slide == 2 and btn == "Masque Boeuf" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque22_1", "Masque22_1")
			elseif slide == 3 and btn == "Masque Boeuf" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque22_2", "Masque22_2")
					---------Boeuf 2
			elseif slide == 24 and btn == "Tester Masque:" then
				OpenMenu('Boeuf 2')
			elseif slide == 1 and btn == "Masque Boeuf 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque23", "Masque23")
			elseif slide == 2 and btn == "Masque Boeuf 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque23_1", "Masque23_1")
			elseif slide == 3 and btn == "Masque Boeuf 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque23_2", "Masque23_2")
					---------Tête
			elseif slide == 25 and btn == "Tester Masque:" then
				OpenMenu('Tête')
			elseif slide == 1 and btn == "Masque Tête" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque24", "Masque24")
			elseif slide == 2 and btn == "Masque Tête" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque24_1", "Masque24_1")
			elseif slide == 3 and btn == "Masque Tête" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque24_2", "Masque24_2")
						---------Tête 2
			elseif slide == 26 and btn == "Tester Masque:" then
				OpenMenu('Tête 2')
			elseif slide == 1 and btn == "Masque Tête 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque25", "Masque25")
			elseif slide == 2 and btn == "Masque Tête 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque25_1", "Masque25_1")
			elseif slide == 3 and btn == "Masque Tête 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque25_2", "Masque25_2")
				---------Loup
			elseif slide == 27 and btn == "Tester Masque:" then
				OpenMenu('Loup')
			elseif slide == 1 and btn == "Masque Loup" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque26", "Masque26")
			elseif slide == 2 and btn == "Masque Loup" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque26_1", "Masque26_1")
			elseif slide == 3 and btn == "Masque Loup" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque26_2", "Masque26_2")
				---------Casque d'avion
			elseif slide == 28 and btn == "Tester Masque:" then  	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque27", "Masque27")
					---------Monster 1
			elseif slide == 29 and btn == "Tester Masque:" then
				OpenMenu('Monster')
			elseif slide == 1 and btn == "Masque Monster" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque28", "Masque28")
			elseif slide == 2 and btn == "Masque Monster" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque28_1", "Masque28_1")
			elseif slide == 3 and btn == "Masque Monster" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque28_2", "Masque28_2")
				---------Monster 2
			elseif slide == 30 and btn == "Tester Masque:" then
				OpenMenu('Monster 2')
			elseif slide == 1 and btn == "Masque Monster 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque29", "Masque29")
			elseif slide == 2 and btn == "Masque Monster 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque29_1", "Masque29_1")
			elseif slide == 3 and btn == "Masque Monster 2" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque29_2", "Masque29_2")
				---------Hockey 4
			elseif slide == 31 and btn == "Tester Masque:" then  	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque30", "Masque30")
				---------Hockey 4
			elseif slide == 32 and btn == "Tester Masque:" then  	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque31", "Masque31")
					---------Cagoule
			elseif slide == 33 and btn == "Tester Masque:" then  	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque32", "Masque32")
				---------Coukies
			elseif slide == 34 and btn == "Tester Masque:" then  	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque33", "Masque33")
				---------old
			elseif slide == 35 and btn == "Tester Masque:" then
				OpenMenu('Old')
			elseif slide == 1 and btn == "Masque Old" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque34", "Masque34")
			elseif slide == 2 and btn == "Masque Old" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque34_1", "Masque34_1")
			elseif slide == 3 and btn == "Masque Old" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque34_2", "Masque34_2")
					---------Cagoule 1
			elseif slide == 36 and btn == "Tester Masque:" then  TriggerServerEvent('KrXDarkShop:buy', 1, "Masque35", "Masque35")
				---------Mask oxygen
			elseif slide == 37 and btn == "Tester Masque:" then  TriggerServerEvent('KrXDarkShop:buy', 1, "Masque36", "Masque36")
					---------Cagoule 3
			elseif slide == 38 and btn == "Tester Masque:" then  TriggerServerEvent('KrXDarkShop:buy', 1, "Masque37", "Masque37")
				---------Mask oxygen 2
			elseif slide == 39 and btn == "Tester Masque:" then  TriggerServerEvent('KrXDarkShop:buy', 1, "Masque38", "Masque38")
					---------Monster 3
			elseif slide == 40 and btn == "Tester Masque:" then
				OpenMenu('Monster 3')
			elseif slide == 1 and btn == "Masque Monster 3" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque39", "Masque39")
			elseif slide == 2 and btn == "Masque Monster 3" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque39_1", "Masque39_1")
			elseif slide == 3 and btn == "Masque Monster 3" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque39_2", "Masque39_2")
					---------Monster 4
			elseif slide == 41 and btn == "Tester Masque:" then
				OpenMenu('Monster 4')
			elseif slide == 1 and btn == "Masque Monster 4" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque40", "Masque40")
			elseif slide == 2 and btn == "Masque Monster 4" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque40_1", "Masque40_1")
			elseif slide == 3 and btn == "Masque Monster 4" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque40_2", "Masque40_2")
					---------Monster 5
			elseif slide == 42 and btn == "Tester Masque:" then
				OpenMenu('Monster 4')
			elseif slide == 1 and btn == "Masque Monster 5" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque41", "Masque41")
			elseif slide == 2 and btn == "Masque Monster 5" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque41_1", "Masque41_1")
			elseif slide == 3 and btn == "Masque Monster 5" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque41_1", "Masque41_1")
										---------Monster 6
			elseif slide == 43 and btn == "Tester Masque:" then
				OpenMenu('Monster 4')
			elseif slide == 1 and btn == "Masque Monster 6" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque42", "Masque42")
			elseif slide == 2 and btn == "Masque Monster 6" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque42_1", "Masque42_1")
			elseif slide == 3 and btn == "Masque Monster 6" then
				TriggerServerEvent('KrXDarkShop:buy', 1, "Masque42_2", "Masque42_2")
---------Man
elseif slide == 44 and btn == "Tester Masque:" then  TriggerServerEvent('KrXDarkShop:buy', 1, "Masque43", "Masque43")
	---------Girl
elseif slide == 45 and btn == "Tester Masque:" then  TriggerServerEvent('KrXDarkShop:buy', 1, "Masque44", "Masque44")
	---------Mask Oxygen 3
elseif slide == 46 and btn == "Tester Masque:" then  TriggerServerEvent('KrXDarkShop:buy', 1, "Masque45", "Masque45")
	---------Bandana
elseif slide == 48 and btn == "Tester Masque:" then
	OpenMenu('Bandana')
elseif slide == 1 and btn == "Masque Bandana" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque47", "Masque47")
elseif slide == 2 and btn == "Masque Bandana" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque47_1", "Masque47_1")
elseif slide == 3 and btn == "Masque Bandana" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque47_2", "Masque47_2")
		---------Bandana 2
elseif slide == 49 and btn == "Tester Masque:" then
	OpenMenu('Bandana 2')
elseif slide == 1 and btn == "Masque Bandana 2" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque48", "Masque48")
elseif slide == 2 and btn == "Masque Bandana 2" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque48_1", "Masque48_1")
elseif slide == 3 and btn == "Masque Bandana 2" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque48_2", "Masque48_2")

	---------Papier
elseif slide == 50 and btn == "Tester Masque:" then
	OpenMenu('Papier')
elseif slide == 1 and btn == "Masque Papier" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque49", "Masque49")
elseif slide == 2 and btn == "Masque Papier" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque49_1", "Masque49_1")
elseif slide == 3 and btn == "Masque Papier" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque49_2", "Masque49_2")

---------Hockey
elseif slide == 51 and btn == "Tester Masque:" then
	OpenMenu('Hockey 5')
elseif slide == 1 and btn == "Masque Hockey 5" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque50", "Masque50")
elseif slide == 2 and btn == "Masque Hockey 5" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque50_1", "Masque50_1")
elseif slide == 3 and btn == "Masque Hockey 5" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque50_2", "Masque50_2")

	---------Foulard
elseif slide == 52 and btn == "Tester Masque:" then
	OpenMenu('Foulard')
elseif slide == 1 and btn == "Masque Foulard" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque51", "Masque51")
elseif slide == 2 and btn == "Masque Foulard" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque51_1", "Masque51_1")
elseif slide == 3 and btn == "Masque Foulard" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque51_2", "Masque51_2")
elseif slide == 4 and btn == "Masque Foulard" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque51_3", "Masque51_3")
elseif slide == 5 and btn == "Masque Foulard" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque51_4", "Masque51_4")
elseif slide == 6 and btn == "Masque Foulard" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque51_5", "Masque51_5")
elseif slide == 7 and btn == "Masque Foulard" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque51_6", "Masque51_6")
elseif slide == 8 and btn == "Masque Foulard" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque51_7", "Masque51_7")
elseif slide == 9 and btn == "Masque Foulard" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque51_8", "Masque51_8")
elseif slide == 10 and btn == "Masque Foulard" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque51_9", "Masque51_9")
	---------Foulard
elseif slide == 53 and btn == "Tester Masque:" then
	OpenMenu('Cagoule 4')
elseif slide == 1 and btn == "Masque Cagoule 4" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque52", "Masque52")
elseif slide == 2 and btn == "Masque Cagoule 4" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque52_1", "Masque52_1")
elseif slide == 3 and btn == "Masque Cagoule 4" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque52_2", "Masque52_2")
elseif slide == 4 and btn == "Masque Cagoule 4" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque52_3", "Masque52_3")
elseif slide == 5 and btn == "Masque Cagoule 4" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque52_4", "Masque52_4")
elseif slide == 6 and btn == "Masque Cagoule 4" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque52_5", "Masque52_5")
elseif slide == 7 and btn == "Masque Cagoule 4" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque52_6", "Masque52_6")
elseif slide == 8 and btn == "Masque Cagoule 4" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque52_7", "Masque52_7")
elseif slide == 9 and btn == "Masque Cagoule 4" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque52_8", "Masque52_8")
elseif slide == 10 and btn == "Masque Cagoule 4" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque52_9", "Masque52_9")

		---------Cagoule 5
elseif slide == 54 and btn == "Tester Masque:" then
	OpenMenu('Cagoule 5')
elseif slide == 1 and btn == "Masque Cagoule 5" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque53", "Masque53")
elseif slide == 2 and btn == "Masque Cagoule 5" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque53_1", "Masque53_1")
elseif slide == 3 and btn == "Masque Cagoule 5" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque53_2", "Masque53_2")
		---------Bandana 3
elseif slide == 55 and btn == "Tester Masque:" then
	OpenMenu('Bandana 3')
elseif slide == 1 and btn == "Masque Bandana 3" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque54", "Masque54")
elseif slide == 2 and btn == "Masque Bandana 3" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque54_1", "Masque54_1")
elseif slide == 3 and btn == "Masque Bandana 3" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque54_2", "Masque54_2")
elseif slide == 4 and btn == "Masque Bandana 3" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque54_3", "Masque54_3")
elseif slide == 5 and btn == "Masque Bandana 3" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque54_4", "Masque54_4")
elseif slide == 6 and btn == "Masque Bandana 3" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque54_5", "Masque54_5")
elseif slide == 7 and btn == "Masque Bandana 3" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque54_6", "Masque54_6")
elseif slide == 8 and btn == "Masque Bandana 3" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque54_7", "Masque54_7")
elseif slide == 9 and btn == "Masque Bandana 3" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque54_8", "Masque54_8")
elseif slide == 10 and btn == "Masque Bandana 3" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque54_9", "Masque54_9")

		---------Mask Oxygen 3
elseif slide == 56 and btn == "Tester Masque:" then  TriggerServerEvent('KrXDarkShop:buy', 1, "Masque55", "Masque55")
---------Cagoule 7
elseif slide == 57 and btn == "Tester Masque:" then
	OpenMenu('Cagoule 7')
elseif slide == 1 and btn == "Masque Cagoule 7" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque56", "Masque56")
elseif slide == 2 and btn == "Masque Cagoule 7" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque56_1", "Masque56_1")
elseif slide == 3 and btn == "Masque Cagoule 7" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque56_2", "Masque56_2")
	---------Cagoule 8
elseif slide == 58 and btn == "Tester Masque:" then
	OpenMenu('Cagoule 8')
elseif slide == 1 and btn == "Masque Cagoule 8" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque57", "Masque57")
elseif slide == 2 and btn == "Masque Cagoule 8" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque57_1", "Masque57_1")
elseif slide == 3 and btn == "Masque Cagoule 8" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque57_2", "Masque57_2")
	---------Cagoule 9
elseif slide == 59 and btn == "Tester Masque:" then
	OpenMenu('Cagoule 9')
elseif slide == 1 and btn == "Masque Cagoule 9" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque58", "Masque58")
elseif slide == 2 and btn == "Masque Cagoule 9" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque58_1", "Masque58_1")
elseif slide == 3 and btn == "Masque Cagoule 9" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque58_2", "Masque58_2")
	---------Monster 7
elseif slide == 60 and btn == "Tester Masque:" then  TriggerServerEvent('KrXDarkShop:buy', 1, "Masque59", "Masque59")
	--------Citrouille
elseif slide == 61 and btn == "Tester Masque:" then
	OpenMenu('Citrouille')
elseif slide == 1 and btn == "Masque Citrouille" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque60", "Masque60")
elseif slide == 2 and btn == "Masque Citrouille" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque60_1", "Masque60_1")
elseif slide == 3 and btn == "Masque Citrouille" then
	TriggerServerEvent('KrXDarkShop:buy', 1, "Masque60_2", "Masque60_2")



			end
		end,
		onSlide = function(menuData, currentButton, currentSlt, PMenu)
			local currentMenu, ped = menuData.currentMenu, GetPlayerPed(-1)
			if currentMenu == "Masque disponibles: " then
				if currentSlt ~= 1 then return end
				local currentButton = currentButton.slidenum - 1
                mask1 = currentButton
				TriggerEvent('skinchanger:change', 'mask_1', mask1)
			end

			if currentMenu == "Citrouille" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Cagoule 9" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
            if currentMenu == "Cagoule 8" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Cagoule 7" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Bandana 3" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Cagoule 5" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Cagoule 4" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Foulard" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Hockey 5" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Papier" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Bandana 2" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Bandana" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Monster 6" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Monster 5" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Monster 4" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Monster 3" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Old" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Monster 2" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Monster" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Loup" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Tête 2" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Tête" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Boeuf 2" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Boeuf" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Ours" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Raton" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Hibout" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Renard" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Chat" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Terminator" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Hockey 3" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Hockey 2" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Lunettes 2" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Lunettes" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Pernowell" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Devil" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Clown" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Singe 2" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Hockey 1" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Singe" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Skelet" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end
			if currentMenu == "Cochon" then if currentSlt ~= 1 then return end local currentButton = currentButton.slidenum - 1 mask2 = currentButton TriggerEvent('skinchanger:change', 'mask_2', mask2) end end,
},
	Menu = {
		["Masque disponibles: "] = {
			b = {
				{name = "Tester Masque:", slidemax = yoyo},
				{name = "~r~Quitter le menu", ask = "~r~>", askX = true},
			}
		},



		        ["Citrouille"] = { b = { {name = "Masque Citrouille", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Cagoule 9"] = { b = { {name = "Masque Cagoule 9", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Cagoule 8"] = { b = { {name = "Masque Cagoule 8", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Cagoule 7"] = { b = { {name = "Masque Cagoule 7", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Bandana 3"] = { b = { {name = "Masque Bandana 3", slidemax = Couleurss},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Cagoule 5"] = { b = { {name = "Masque Cagoule 5", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Cagoule 4"] = { b = { {name = "Masque Cagoule 4", slidemax = Couleurss},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Foulard"] = { b = { {name = "Masque Foulard", slidemax = Couleurss},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Hockey 5"] = { b = { {name = "Masque Hockey 5", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Papier"] = { b = { {name = "Masque Papier", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Bandana 2"] = { b = { {name = "Masque Bandana 2", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Bandana"] = { b = { {name = "Masque Bandana", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Monster 6"] = { b = { {name = "Masque Monster 5", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Monster 5"] = { b = { {name = "Masque Monster 5", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
	            ["Monster 4"] = { b = { {name = "Masque Monster 4", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Monster 3"] = { b = { {name = "Masque Monster 3", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Old"] = { b = { {name = "Masque Old", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Monster 2"] = { b = { {name = "Masque Monster 2", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Monster"] = { b = { {name = "Masque Monster", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Loup"] = { b = { {name = "Masque Loup", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
	            ["Tête 2"] = { b = { {name = "Masque Tête 2", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Tête"] = { b = { {name = "Masque Tête", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Boeuf 2"] = { b = { {name = "Masque Boeuf 2", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Boeuf"] = { b = { {name = "Masque Boeuf", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Ours"] = { b = { {name = "Masque Ours", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Raton"] = { b = { {name = "Masque Raton", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Hibout"] = { b = { {name = "Masque Hibout", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Renard"] = { b = { {name = "Masque Renard", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Chat"] = { b = { {name = "Masque Chat", slidemax = Couleurs},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Terminator"] = { b = { {name = "Masque Terminator", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Hockey 3"] = { b = { {name = "Masque Hockey 3", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Hockey 2"] = { b = { {name = "Masque Hockey 2", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Lunettes 2"] = { b = { {name = "Masque Lunettes 2", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Lunettes"] = { b = { {name = "Masque Lunettes", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Pernowell"] = { b = { {name = "Masque Pernowell", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Devil"] = { b = { {name = "Masque Devil", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Clown"] = { b = { {name = "Masque Clown", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Singe 2"] = { b = { {name = "Masque Singe 2", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
		        ["Cochon"] = { b = { {name = "Masque Cochon", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
				["Skelet"] = { b = { {name = "Masque Skelet", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
				["Singe"] = { b = { {name = "Masque Singe", ask = ">", askX = true},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},
				["Hockey 1"] = { b = { {name = "Masque Hockey 1", slidemax = Couleur},{name = "----------------------------"}, {name = "~h~RETOUR", ask = "~h~>", askX = true}, }},

		},
	}

local listmask = {
	{x = -1337.17, y = -1277.54, z = 4.64}
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(listmask) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, listmask[k].x, listmask[k].y, listmask[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder ~g~aux magasin de masque.")
				if IsControlJustPressed(1,51) then
					PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)		
					SetEntityInvincible(GetPlayerPed(-1), true) 
		        	FreezeEntityPosition(GetPlayerPed(-1), true) 									
					SetEntityCoords(GetPlayerPed(-1), -1336.9627, -1277.15600, 4.5238-0.98, 0.0, 0.0, 0.0, 10)
					SetEntityHeading(GetPlayerPed(-1), 80.9283561706543)
					DisplayRadar(false) 
					local cam = {}				
					Citizen.Wait(1)
					cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
                    SetCamCoord(cam, -1338.06, -1277.10, 5.6238, 0.0, 0.0, 200.455696105957, 15.0, false, 0)
                    RenderScriptCams(1000, 1000, 1000, 1000, 1000)
					PointCamAtCoord(cam, -1336.9627, -1277.15600, 5.6238)                  								 				
					DrawSub('~g~Invincible', 999999999)
                    CreateMenu(ClosesShops)
				end
            end
        end
    end
end)

local blips = {    

    {
        title   ="Magasin de masque",
        colour  =0,
        id      =362,
        x   =-1337.20,
        y   =-1276.98,
        z   =29.8
    }
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do

      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

 