local serverStorage = game:GetService("ServerStorage")

local DTS = game:GetService("DataStoreService")
local Http = game:GetService("HttpService")
local MainDataStore = DTS:GetDataStore("LeaderstatsDataStore")

local saveModule = require(script.SaveData)
local loadModule = require(script.LoadData)



game.Players.PlayerAdded:Connect(function(player)
	local gameData = Instance.new("Folder")
	gameData.Name = "leaderstats"
	gameData.Parent = player
	
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Parent = gameData	
	
	loadModule.loadData(player, MainDataStore, Http)
end)

game.Players.PlayerRemoving:Connect(function(plr)
	saveModule.saveData(plr, MainDataStore, Http)
end)