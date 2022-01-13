local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local event = game.ReplicatedStorage.Events.DrawingServerConnections
local canDraw = player:WaitForChild("canDraw")

mouse.MouseButton1Down:Connect(function()
    if canDraw == true then
        event:FireServer(mouse)
    end
end)