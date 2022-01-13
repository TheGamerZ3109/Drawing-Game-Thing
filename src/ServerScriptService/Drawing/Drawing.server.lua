local event = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DrawingServerConnections")

event.OnServerEvent:Connect(function(plr, mouse)
    local canDraw = plr:WaitForChild("canDraw")
    local target = mouse.target

    if target:IsA("Part") then

        print(mouse.Hit)
        print(mouse.target)

        if target.Parent == game.Workspace.drawParts then
            if canDraw == true then
                


            end
        end
    end
end)