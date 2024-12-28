-- Function to highlight all players and add name tags above their heads
print("script injected")
while do true
wait (5)
local function highlightPlayers()
    -- Loop through all the players in the game
    for _, player in pairs(game.Players:GetPlayers()) do
        -- Ensure the player has a character
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            -- Create the Highlight object if it doesn't already exist
            local highlight = player.Character:FindFirstChild("Highlight")
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = "Highlight"
                highlight.Parent = player.Character
                highlight.Adornee = player.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color (can be changed)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- White outline
                highlight.FillTransparency = 0.5 -- Transparency for the body
                highlight.OutlineTransparency = 0 -- Outline is fully visible
                highlight.Enabled = true -- Enable the highlight effect
            end

            -- Add a name tag above the player if it doesn't exist
            local nameTag = player.Character:FindFirstChild("NameTag")
            if not nameTag then
                -- Create the BillboardGui
                nameTag = Instance.new("BillboardGui")
                nameTag.Name = "NameTag"
                nameTag.Parent = player.Character
                nameTag.Adornee = player.Character:WaitForChild("Head")
                nameTag.Size = UDim2.new(0, 200, 0, 50)
                nameTag.StudsOffset = Vector3.new(0, 3, 0) -- Position above the head
                nameTag.AlwaysOnTop = true

                -- Create the TextLabel inside the BillboardGui
                local textLabel = Instance.new("TextLabel")
                textLabel.Parent = nameTag
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1 -- Make background invisible
                textLabel.Text = player.Name -- Set text to the player's name
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text (can be changed)
                textLabel.TextSize = 18 -- Set the text size
                textLabel.TextStrokeTransparency = 0.8 -- Adds stroke effect to make text stand out
                textLabel.TextAlign = Enum.TextXAlignment.Center
                textLabel.TextVerticalAlignment = Enum.TextVerticalAlignment.Center
            end
        end
    end
end

-- Call the function to highlight players and add name tags when the game starts
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        highlightPlayers()
    end)
end)

-- Continuously check for new players and add highlights with name tags
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        highlightPlayers()
    end)
end)
end
