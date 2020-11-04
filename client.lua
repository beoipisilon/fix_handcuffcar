local checar = false

RegisterNetEvent('checarCarregado')
AddEventHandler('checarCarregado',function(status)
    checar = status
end)

Citizen.CreateThread(function()
    while true do
	    local idle = 500
	    if checar then
		   idle = 100
		   local playerPed = GetPlayerPed(-1)
		   local vehicle = GetVehiclePedIsIn(playerPed, false)
 
		  	if (GetPedInVehicleSeat(vehicle,-1) == playerPed) or (GetPedInVehicleSeat(vehicle,0) == playerPed) or (GetPedInVehicleSeat(vehicle,1) == playerPed) or (GetPedInVehicleSeat(vehicle,2) == playerPed) or (GetPedInVehicleSeat(vehicle,3) == playerPed) or (GetPedInVehicleSeat(vehicle,4) == playerPed) then else
		    	TriggerServerEvent("checar:cv",source)
		    end
	    end
		Citizen.Wait(idle)
	end
end)
