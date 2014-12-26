-- Zusatzkosten
-- Author: Lütti
-- fügt Zusatzkosten hinzu

Zusatzkosten = {};
local Freibetrag = 15000;

function Zusatzkosten:loadMap(name)
	g_currentMission.environment:addDayChangeListener(self); 
	print ("extendedFinaceModel(by Luetti) loaded");
		
end;

function Zusatzkosten:deleteMap()
end;

function Zusatzkosten:mouseEvent(posX, posY, isDown, isUp, button)

end;

function Zusatzkosten:keyEvent(unicode, sym, modifier, isDown)
	-- for _,v in pairs( g_currentMission.missionStats.financeStats) do
		-- print (_);
		-- print(v);
		-- print ("---------");
	-- end;
-- end;

function Zusatzkosten:update(dt)
end;

function Zusatzkosten:draw()
end;

function Zusatzkosten:dayChanged()
	if g_currentMission:getIsServer() then
		local difficulty = g_currentMission.missionStats.difficulty;
		print ("Schwierigkeit: "..difficulty);	
		local multiplikator = 0.2/difficulty;
		print("multiplikator: "..multiplikator);
	
	
		local Kost1 = g_currentMission.missionStats.financeStats.newVehiclesCost;
		print ("Kost1 ="..Kost1);
		local Kost2 = g_currentMission.missionStats.financeStats.newAnimalsCost;
		local Kost3 = g_currentMission.missionStats.financeStats.constructionCost;
		local Kost4 = g_currentMission.missionStats.financeStats.vehicleRunningCost;
		local Kost5 = g_currentMission.missionStats.financeStats.propertyMaintenance;
		local Kost6 = g_currentMission.missionStats.financeStats.wagePayment;
		
		local Gewinn1 = g_currentMission.missionStats.financeStats.harvestIncome;
		local Gewinn2 = g_currentMission.missionStats.financeStats.missionIncome;
	
		local Anderes1 = g_currentMission.missionStats.financeStats.loanInterest;
		local Anderes2 = g_currentMission.missionStats.financeStats.other;
	
		local Gewinn = Kost1 + Kost2 + Kost3 + Kost4 + Kost5 + Kost6 + Gewinn1 + Gewinn2 + Anderes1 + Anderes2;
	
		print ("Gewinn ="..Gewinn);
		if Gewinn >= Freibetrag then
			local Steuern = (Gewinn - Freibetrag) * multiplikator;
			g_currentMission:addMoney(Steuern, "other")
			print ("Es wurden Steuern in Hoehe von "..Steuern.." abgezogen.");
		end;
	end;
end; 

addModEventListener(Zusatzkosten);
