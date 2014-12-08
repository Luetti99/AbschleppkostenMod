--
-- Abschleppkosten
--
-- Author: Lütti
-- 
-- fügt Abschleppkosten hinzu
--

Abschleppkosten = {};

function Abschleppkosten:loadMap(name)
end;

function Abschleppkosten:deleteMap()
end;

function Abschleppkosten:mouseEvent(posX, posY, isDown, isUp, button)
	if ... = true then 								-- Zurücksetz Event
											-- evtl. ModDesc Pfad abfragen
		Wert = getXMLInt(...modDesc(modDesc.storeItems.storeItem.price)) 	-- ... = Pfad zur ModDesc des zuletzt zurückgesetztem Objekts
		AbKosten = Wert*0,02
		g_currentMission.missionStats.money = g_currentMission.missionStats.money - AbKosten
		print("Es wurden Abschleppkosten in Höhe von "..AbKosten.."€ abgezogen.")
	end;
end;

function Abschleppkosten:keyEvent(unicode, sym, modifier, isDown)
	if InputBinding.isPressed(InputBinding.moneyplus) then
		g_currentMission.missionStats.money = g_currentMission.missionStats.money + 100000;
		print("add 100.000 Euro")
	end;
	if InputBinding.isPressed(InputBinding.moneyminus) then
		g_currentMission.missionStats.money = g_currentMission.missionStats.money - 100000;
		print("delete 100.000 Euro")	
    end;
end;

--[[function Abschleppkosten: 	-- zurücksetz Event
	if ... then
		-- moddesc path von zurückgesetztem Objekt abfragen
		Wert = getXMLInt(modDesc(modDesc.storeItems.storeItem.price))
		AbKosten = Wert*0,02
		g_currentMission.missionStats.money = g_currentMission.missionStats.money - AbKosten
		print("Es wurden Abschleppkosten in Höhe von "..AbKosten.."€ abgezogen.")
	end;	
end;]]

function Abschleppkosten:update(dt)
end;

function Abschleppkosten:draw()
end;

addModEventListener(Abschleppkosten);
