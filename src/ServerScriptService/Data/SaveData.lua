local save = {}

function save.saveData(plr, MainDataStore, Http)

	-- Player_1862008444

	local plrUserId = "Player_"..plr.UserId

	local data = {}

	for i, v in pairs(plr:WaitForChild("leaderstats"):GetChildren()) do

		data[v.Name] = v.Value

	end

	local Encoded_Data = Http:JSONEncode(data)

	local Success, Error_Message = pcall(function()

		MainDataStore:SetAsync(plrUserId, Encoded_Data)

	end)

	if Success == true then

		print("saved data")

	else

		plr:Kick("Hi! Your account has not been moderated, there was an issue saving your data, please send this to a developer with your roblox UserID!")

	end	

end

return save
