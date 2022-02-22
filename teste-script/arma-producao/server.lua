-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("arma-producao",src)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local armas = {
	{ item = "ak103" },
    { item = "five" },
    { item = "mp5mk2" },
    { item = "tec9" },
    { item = "shotgun" },
    { item = "g36c" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAIN MENU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("produzir-arma")
AddEventHandler("produzir-arma",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(armas) do
			if item == v.item then
				if item == "ak103" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_ASSAULTRIFLE_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodearma") >= 250 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 80000 then
                                if vRP.tryGetInventoryItem(user_id,"armacaodearma",250) then
                                    TriggerClientEvent("fechar-nui-armas",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wbody|WEAPON_ASSAULTRIFLE_MK2",1)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa <b>Armação de Arma</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "mp5mk2" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_SMG_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodearma") >= 200 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 90000 then
                                if vRP.tryGetInventoryItem(user_id,"armacaodearma",200) then
                                    TriggerClientEvent("fechar-nui-armas",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wbody|WEAPON_SMG_MK2",1)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa <b>Armação de Arma</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")               
			    end
			
                elseif item == "five" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_PISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodearma") >= 100 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 30000 then
                                if vRP.tryGetInventoryItem(user_id,"armacaodearma",100) then
                                    TriggerClientEvent("fechar-nui-armas",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wbody|WEAPON_PISTOL_MK2",1)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa <b>Armação de Arma</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "tec9" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_MACHINEPISTOL") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodetec") >= 3 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 70000 then
                                if vRP.tryGetInventoryItem(user_id,"armacaodetec",3) then
                                    TriggerClientEvent("fechar-nui-armas",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wbody|WEAPON_MACHINEPISTOL",1)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem <b>Armação de Arma</b> na mochila.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "g36c" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_SPECIALCARBINE_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodearma") >= 250 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 80000 then
                                if vRP.tryGetInventoryItem(user_id,"armacaodearma",250) then
                                    TriggerClientEvent("fechar-nui-armas",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wbody|WEAPON_SPECIALCARBINE_MK2",1)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem <b>Armação de Arma</b> na mochila.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "shotgun" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_SAWNOFFSHOTGUN") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"armacaodearma") >= 400 then
                            if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 50000 then
                                if vRP.tryGetInventoryItem(user_id,"armacaodearma",400) then
                                    TriggerClientEvent("fechar-nui-armas",source)

                                    TriggerClientEvent("progress",source,10000,"FABRICANDO")
                                    TriggerClientEvent("cancelando",source,true)
                                    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                    SetTimeout(10000,function()
                                        TriggerClientEvent("cancelando",source,false)
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,"wbody|WEAPON_SAWNOFFSHOTGUN",1)
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>Dinheiro Sujo</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem <b>Armação de Arma</b> na mochila.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"bloods.permissao") or vRP.hasPermission(user_id,"crips.permissao") or vRP.hasPermission(user_id,"megipcia.permissao") then
        return true
    end
end