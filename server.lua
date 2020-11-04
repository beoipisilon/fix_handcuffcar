local actived = {}

-----------------------------------------------------------------------------------------------------------------------------------------
-- CV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
		    local nuser_id = vRP.getUserId(nplayer)
		  
			if actived[parseInt(nuser_id)] then
			   actived[parseInt(nuser_id)] = nil
			end

			actived[parseInt(nuser_id)] = nuser_id		
			TriggerClientEvent("checarCarregado",nplayer,true)
			vRPclient.putInNearestVehicleAsPassenger(nplayer,7)
		end
	end
end)

RegisterServerEvent("checar:cv")
AddEventHandler("checar:cv",function()
    local user_id = vRP.getUserId(source)
    for k,v in pairs (actived) do
	    if user_id == v then
		  --  vRP.kick(user_id,"Bugando né safadu?")
			TriggerClientEvent("checarCarregado",source,false)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
	    	local nuser_id = vRP.getUserId(nplayer)

			actived[parseInt(nuser_id)] = nil
			TriggerClientEvent("checarCarregado",nplayer,false)

			vRPclient.ejectVehicle(nplayer)
		end
	end
end)
