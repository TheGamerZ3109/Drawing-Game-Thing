local load = {}

function load.loadData(player, MainDataStore, Http)
	local plrUserId = "Player_".. player.UserId
	local gameData = player:WaitForChild("leaderstats")
	local User_Data = nil

	local Success, Error_Message = pcall(function()

		User_Data = MainDataStore:GetAsync(plrUserId)	

	end)

	if Success == true then

		if User_Data ~= nil then

			local Decoded_User_Data = Http:JSONDecode(User_Data)
			for Index, Value in pairs(Decoded_User_Data) do
				if gameData:FindFirstChild(Index) then
					gameData:WaitForChild(Index).Value = Value
				end
			end
		else
			print("players data is nil setting default values")
			for Index, Value in pairs(gameData:GetChildren()) do
				if Value:IsA("IntValue") then
					Value.Value = 0
				end
			end
		end
	else
		print("failed to load data for "..player.Name)
	end
end

return load
