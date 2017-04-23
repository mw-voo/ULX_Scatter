local CATEGORY_NAME = "Fun"

function ulx.scatter(calling_ply,targets)

	if IsValid(calling_ply) and calling_ply ~= "Console" then 
		local player_positions = {}
		for _ , v in pairs(targets) do
			if IsValid(v) and v:IsInWorld() and v:Alive() then
				table.insert(player_positions,v:GetPos())
			end
		end
		ulx.fancyLogAdmin( calling_ply, "Scattering: #T", targets )
		for _ , p in pairs(targets) do
			local ran_element = table.Random(player_positions)
			if IsValid(p) and p:IsInWorld() and p:Alive() then
				p:SetPos(ran_element)
				p:ChatPrint('You have been forced to a new position.')
				table.RemoveByValue(player_positions, ran_element)
			end
		end
	end
end
local scatter = ulx.command(CATEGORY_NAME, "ulx scatter", ulx.scatter, "!scatter", true)
scatter:defaultAccess( ULib.ACCESS_SUPERADMIN )
scatter:addParam{ type=ULib.cmds.PlayersArg }
scatter:help("Randomize everyone's position with an existing player's position.")
