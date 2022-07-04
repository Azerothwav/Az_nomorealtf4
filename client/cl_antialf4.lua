RegisterNetEvent('az_nomorealtf4:sync', function(coordsplayer, playersource, data, havetoban)
	if havetoban then
		TriggerServerEvent("az_bansql:altf4", "Alt-F4", data, playersource)
	end
	havetodraw = true
	Citizen.SetTimeout(15000, function()
		havetodraw = false
	end)
	while havetodraw do
		koords = GetEntityCoords(PlayerPedId())
		dist = GetDistanceBetweenCoords(koords, coordsplayer, true)
		if dist <= 15 then
			Draw3DText(coordsplayer.x, coordsplayer.y, coordsplayer.z + 1.23, '[ID: ' ..playersource.. '] disconnect')
		end
		Citizen.Wait(0)
	end
end)

function Draw3DText(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 159)
end