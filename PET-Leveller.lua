-- Ensure it's running in the client
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local playerGui = player:WaitForChild("PlayerGui")

-- GUI Setup
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "SpeedHubX_Leveller"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "Pet Age Leveller"
title.Font = Enum.Font.FredokaOne
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1

local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0, 28, 0, 28)
closeButton.Position = UDim2.new(1, -34, 0, 6)
closeButton.Text = "X"
closeButton.Font = Enum.Font.FredokaOne
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Instance.new("UICorner", closeButton)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local petInfo = Instance.new("TextLabel", frame)
petInfo.Position = UDim2.new(0, 12, 0, 40)
petInfo.Size = UDim2.new(1, -24, 0, 24)
petInfo.Text = "Equipped Pet: [None]"
petInfo.Font = Enum.Font.FredokaOne
petInfo.TextSize = 16
petInfo.TextColor3 = Color3.fromRGB(255, 255, 160)
petInfo.BackgroundTransparency = 1
petInfo.TextXAlignment = Enum.TextXAlignment.Left

-- Set Age Button
local setAgeButton = Instance.new("TextButton", frame)
setAgeButton.Size = UDim2.new(0, 220, 0, 36)
setAgeButton.Position = UDim2.new(0.5, -110, 0, 76)
setAgeButton.Text = "Set Age to 50"
setAgeButton.Font = Enum.Font.FredokaOne
setAgeButton.TextSize = 16
setAgeButton.TextColor3 = Color3.fromRGB(40, 40, 40)
setAgeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", setAgeButton)

-- Add +1 Age Button
local addAgeButton = Instance.new("TextButton", frame)
addAgeButton.Size = UDim2.new(0, 220, 0, 36)
addAgeButton.Position = UDim2.new(0.5, -110, 0, 122)
addAgeButton.Text = "Add +1 Age"
addAgeButton.Font = Enum.Font.FredokaOne
addAgeButton.TextSize = 16
addAgeButton.TextColor3 = Color3.fromRGB(40, 40, 40)
addAgeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", addAgeButton)

-- Get Equipped Pet
local function getEquippedPet()
    local char = player.Character or player.CharacterAdded:Wait()
    for _, tool in pairs(char:GetChildren()) do
        if tool:IsA("Tool") and tool.Name:match("%[Age%s%d+%]") then
            return tool
        end
    end
    return nil
end

-- Update GUI
local function updateGUI()
    local pet = getEquippedPet()
    if pet then
        petInfo.Text = "Equipped Pet: " .. pet.Name
    else
        petInfo.Text = "Equipped Pet: [None]"
    end
end

-- Set Age to 50
setAgeButton.MouseButton1Click:Connect(function()
    local pet = getEquippedPet()
    if pet then
        for i = 5, 1, -1 do
            setAgeButton.Text = "Setting in " .. i .. "..."
            task.wait(1)
        end
        pet.Name = pet.Name:gsub("%[Age%s%d+%]", "[Age 50]")
        updateGUI()
        setAgeButton.Text = "Set Age to 50"
    else
        setAgeButton.Text = "No Pet!"
        task.wait(2)
        setAgeButton.Text = "Set Age to 50"
    end
end)

-- Add +1 Age
addAgeButton.MouseButton1Click:Connect(function()
    local pet = getEquippedPet()
    if pet then
        local age = tonumber(pet.Name:match("%[Age%s(%d+)%]"))
        if age and age < 100 then
            for i = 3, 1, -1 do
                addAgeButton.Text = "Adding in " .. i .. "..."
                task.wait(1)
            end
            pet.Name = pet.Name:gsub("%[Age%s%d+%]", "[Age " .. (age + 1) .. "]")
            updateGUI()
            addAgeButton.Text = "Add +1 Age"
        else
            addAgeButton.Text = "Max Age!"
            task.wait(2)
            addAgeButton.Text = "Add +1 Age"
        end
    else
        addAgeButton.Text = "No Pet!"
        task.wait(2)
        addAgeButton.Text = "Add +1 Age"
    end
end)

-- Auto Refresh
task.spawn(function()
    while screenGui.Parent do
        updateGUI()
        task.wait(1)
    end
end)
