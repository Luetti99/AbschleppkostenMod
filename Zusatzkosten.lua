-- Zusatzkosten
-- Author: Lütti
-- fügt Zusatzkosten hinzu

Zusatzkosten = {};
Freibetrag = 15000;
print ("extendedFinaceModel loaded");

function Zusatzkosten:loadMap(name)
	--print ("extendedFinaceModel loaded");
	if g_currentMission.missionStats.difficulty == 1 then
		multiplikator = 0.2;
	elseif g_currentMission.missionStats.difficulty == 2 then
		multiplikator = 0.12;
	elseif g_currentMission.missionStats.difficulty == 3 then
		multiplikator = 0.08;
	end;
	print("multiplikator = "..multiplikator);
end;

function Zusatzkosten:deleteMap()
end;

function Zusatzkosten:mouseEvent(posX, posY, isDown, isUp, button)

end;

function Zusatzkosten:keyEvent(unicode, sym, modifier, isDown)
end;

function Zusatzkosten:update(dt)
	if dt == 24 then
		Kost1 = g_currentMission.financeStats.newVehiclesCost;
		Kost2 = g_currentMission.financeStats.newAnimalsCost;
		Kost3 = g_currentMission.financeStats.constructionCost;
		Kost4 = g_currentMission.financeStats.vehicleRunningCost;
		Kost5 = g_currentMission.financeStats.propertyMaintenance;
		Kost6 = g_currentMission.financeStats.wagePayment;
		
		Gewinn1 = g_currentMission.financeStats.harvestIncome;
		Gewinn2 = g_currentMission.financeStats.missionIncome;
		
		Anderes1 = g_currentMission.financeStats.loanInterest;
		Anderes2 = g_currentMission.financeStats.other;
		
		Gewinn = Kost1 + Kost2 + Kost3 + Kost4 + Kost5 + Kost6 + Gewinn1 + Gewinn2 + Anderes1 + Anderes2;
		print ("Gewinn ="..Gewinn);
		if Gewinn >= Freibetrag then
			Steuern = (Gewinn - Freibetrag) * multiplikator;
			g_currentMission.missionStats.money = g_currentMission.missionStats.money + Steuern;
			print ("Es wurden Steuern in Hoehe von "..Steuern.." abgezogen.");
		end;
	end;
end;

function Zusatzkosten:draw()
end;

addModEventListener(Zusatzkosten);
