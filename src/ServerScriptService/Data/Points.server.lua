local serverStorage = game:GetService("ServerStorage")

local DTS = game:GetService("DataStoreService")
local Http = game:GetService("HttpService")
local MainDataStore = DTS:GetDataStore("LeaderstatsDataStore")

local saveModule = require(script.Parent.SaveData)
local loadModule = require(script.Parent.LoadData)



game.Players.PlayerAdded:Connect(function(player)
	local gameData = Instance.new("Folder")
	gameData.Name = "leaderstats"
	gameData.Parent = player
	
	local Points = Instance.new("IntValue")
	Points.Name = "Points"
	Points.Parent = gameData
	
	loadModule.loadData(player, MainDataStore, Http)

    --other stuff thats needed

    local canDraw = Instance.new("BoolValue")
    canDraw.Name = "canDraw"
    canDraw.Parent = player
    canDraw.Value = false
end)

game.Players.PlayerRemoving:Connect(function(plr)
	saveModule.saveData(plr, MainDataStore, Http)
end)