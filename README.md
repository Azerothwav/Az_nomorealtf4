# Az_nomorealtf4

Tired of alt-f4 on your role-play server that ruins scenes for you? Fix your worries with az_nomorealtf4, a script using the bansql script by default but modulable for your needs. 

Condition to have for the player to be detected as banned:
- The player is dead by a player
- A disconnection (crash or other problems do not make ban)
- A second player on the server (to execute the client side code since the banned player is disconnected)

This is a small script made without much pretension except to help you, use it at your own will, it was created at the base for a server but it seems that they are too stupid to understand the interest...

If you just want to integrate it to bansql you just have to copy the code in the github read me and put it on the server side so that everything works directly !

Sincerely, Azeroth


# Exemple of bansql plugin

```
RegisterServerEvent('az_bansql:altf4')
AddEventHandler('az_bansql:altf4', function(reason, data, target)
	local duree     = 2
	local reason    = reason
	target = tonumber(target)

	if not reason then reason = "Az_anticheat" end

	local sourceplayername = "Az_anticheat"
	local targetplayername = 'Alt-F4'

	local license = data.license
	local identifier = data.identifier
	local liveid = data.liveid
	local xblid  = data.xblid
	local discord = data.discord
	local playerip = data.playerip
	
	ban(target,license,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,reason,0)
end)
```
