AddEventHandler('playerDropped', function(reason)
	local coords = GetEntityCoords(GetPlayerPed(source))
	local pedid = source

	if reason == 'Exiting' then
		local license,identifier,liveid,xblid,discord,playerip,target
		for k,v in ipairs(GetPlayerIdentifiers(source))do
			if string.sub(v, 1, string.len("license:")) == "license:" then
				license = v
			elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
				identifier = v
			elseif string.sub(v, 1, string.len("live:")) == "live:" then
				liveid = v
			elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
				xblid  = v
			elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
				discord = v
			elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
				playerip = v
			end
		end
		local dataplayer = {
			license = license,
			identifier = identifier,
			liveid = liveid,
			xblid = xblid,
			discord = discord,
			playerip = playerip,
		}
		if GetPedSourceOfDeath(GetPlayerPed(source)) == 0 then
			havetoban = false
		else
			havetoban = true
		end
	else
		havetoban = false
	end

	TriggerClientEvent('az_nomorealtf4:sync', -1, coords, pedid, dataplayer, havetoban)
end)