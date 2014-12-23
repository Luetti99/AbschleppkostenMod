-- Zusatzkosten
-- Author: Lütti
-- fügt Zusatzkosten hinzu

Zusatzkosten = {};
Freibetrag = 15000;
print ("extendedFinaceModel loaded");

function Zusatzkosten:loadMap(name)
	g_currentMission.environment:addDayChangeListener(self); 
	--print ("extendedFinaceModel loaded");
end;

function Zusatzkosten:deleteMap()
end;

function Zusatzkosten:mouseEvent(posX, posY, isDown, isUp, button)

end;

function Zusatzkosten:keyEvent(unicode, sym, modifier, isDown)
end;

function Zusatzkosten:update(dt)
end;

function Zusatzkosten:draw()
end;

function Zusatzkosten:dayChanged()
	local difficulty = g_currentMission.missionStats.difficulty;
	print ("Schwierigkeit: "..difficulty);	
	local multiplikator = 0.2/difficulty;
	print("multiplikator: "..multiplikator);
	
	
	-- local Kost1 = g_currentMission.economyManager.financeStats.newVehiclesCost;
	-- print ("Kost1 ="..Kost1);
	-- local Kost2 = g_currentMission.economyManager.financeStatsHistory.financeStats.newAnimalsCost;
	-- local Kost3 = g_currentMission.economyManager.constructionCost;
	-- local Kost4 = g_currentMission.economyManager.vehicleRunningCost;
	-- local Kost5 = g_currentMission.economyManager.propertyMaintenance;
	-- local Kost6 = g_currentMission.economyManager.wagePayment;
	
	-- local Gewinn1 = g_currentMission.economyManager.harvestIncome;
	-- local Gewinn2 = g_currentMission.economyManager.missionIncome;
	
	-- local Anderes1 = g_currentMission.economyManager.loanInterest;
	-- local Anderes2 = g_currentMission.economyManager.other;
	
	-- local Gewinn = Kost1 + Kost2 + Kost3 + Kost4 + Kost5 + Kost6 + Gewinn1 + Gewinn2 + Anderes1 + Anderes2;
	
	
	local Finanzen = g_currentMission.economyManager.financeStatsHistory;

	print (Finanzen[1].newAnimalsCost);
	
	--print ("Gewinn ="..Gewinn);
	if Gewinn >= Freibetrag then
		local Steuern = (Gewinn - Freibetrag) * multiplikator;
		g_currentMission.missionStats.money = g_currentMission.missionStats.money + Steuern;
		print ("Es wurden Steuern in Hoehe von "..Steuern.." abgezogen.");
	end;
end; 

addModEventListener(Zusatzkosten);
