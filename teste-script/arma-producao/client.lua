-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
src = Tunnel.getInterface("arma-producao")
-----------------------------------------------------------------------------------------------------------------------------------------
-- MENU
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
local onmenu = false

function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "produzir-ak103" then
		TriggerServerEvent("produzir-arma","ak103")

	elseif data == "produzir-mp5mk2" then
		TriggerServerEvent("produzir-arma","mp5mk2")

	elseif data == "produzir-five" then
		TriggerServerEvent("produzir-arma","five")

	elseif data == "produzir-tec9" then
		TriggerServerEvent("produzir-arma","tec9")

	elseif data == "produzir-shotgun" then
		TriggerServerEvent("produzir-arma","shotgun")
		
	elseif data == "produzir-g36c" then
		TriggerServerEvent("produzir-arma","g36c")

	elseif data == "fechar" then
		ToggleActionMenu()
		onmenu = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EVENTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("fechar-nui-armas")
AddEventHandler("fechar-nui-armas", function()
	ToggleActionMenu()
	onmenu = false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	-- {1275.38,-1710.8,54.78},  -- CRIPS
	{-1062.82, -1662.28, 4.56},  -- BLOODS
	-- {2329.16,2571.82,46.68}  -- MAFIAE
}

Citizen.CreateThread(function()
    SetNuiFocus(false,false)
    while true do
        local cruz = 1000
        for _,mark in pairs(marcacoes) do
            local x,y,z = table.unpack(mark)
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
            if distance <= 1.0 then
                cruz = 5
                DrawMarker(21,x,y,z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0,0,255,50,0,0,0,1)
                if IsControlJustPressed(0,38) then
                    if src.checkPermissao() then
                        ToggleActionMenu()
                        else TriggerEvent("Notify","negado","Você não tem permissão!")
                    end
                end
            end
        end
        Citizen.Wait(cruz)
    end
end)
