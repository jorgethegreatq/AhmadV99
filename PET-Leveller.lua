
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

-- Add Blur Effect
local blur = Instance.new("BlurEffect")
blur.Size = 12
blur.Parent = Lighting

-- Create ScreenGui
local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "SPEEDHUBX"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

-- Main Panel
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 460, 0, 160)
frame.Position = UDim2.new(0.5, -230, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 0

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)
Instance.new("UIStroke", frame).ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Shadow
local shadow = Instance.new("ImageLabel", frame)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.75
shadow.Size = UDim2.new(1, 80, 1, 80)
shadow.Position = UDim2.new(0.5, -240, 0.5, -90)
shadow.BackgroundTransparency = 1
shadow.ZIndex = -1

-- Glowing Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -40, 0, 60)
title.Position = UDim2.new(0, 20, 0, 10)
title.Text = "SPEED HUB X"
title.TextColor3 = Color3.fromRGB(0, 200, 255)
title.TextTransparency = 0.2
title.TextStrokeTransparency = 0.6
title.Font = Enum.Font.FredokaOne
title.TextScaled = true
title.BackgroundTransparency = 1

-- Title Pulse
task.spawn(function()
	while title and title.Parent do
		TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 0.05}):Play()
		task.wait(1)
		TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 0.25}):Play()
		task.wait(1)
	end
end)

-- Loading Dots Animation
local loading = Instance.new("TextLabel", frame)
loading.Size = UDim2.new(1, -40, 0, 30)
loading.Position = UDim2.new(0, 20, 0, 70)
loading.Text = "Loading"
loading.TextColor3 = Color3.fromRGB(200, 200, 200)
loading.Font = Enum.Font.FredokaOne
loading.TextScaled = true
loading.BackgroundTransparency = 1
loading.TextStrokeTransparency = 1

-- Dots Cycle
task.spawn(function()
	local dots = {"", ".", "..", "..."}
	local index = 1
	while loading and loading.Parent do
		loading.Text = "Loading" .. dots[index]
		index = (index % #dots) + 1
		task.wait(0.4)
	end
end)

-- Loading Bar BG
local barBg = Instance.new("Frame", frame)
barBg.Size = UDim2.new(1, -40, 0, 18)
barBg.Position = UDim2.new(0, 20, 1, -40)
barBg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(0, 10)

-- Loading Bar Fill
local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BorderSizePixel = 0
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 10)

-- Gradient Fill
local grad = Instance.new("UIGradient", barFill)
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 170, 255))
}
grad.Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(1, 0.2)
}

-- Animate Fill
TweenService:Create(barFill, TweenInfo.new(5, Enum.EasingStyle.Sine), {
	Size = UDim2.new(1, 0, 1, 0)
}):Play()

-- Optional: Play soft chime sound
local sound = Instance.new("Sound", frame)
sound.SoundId = "rbxassetid://9118823106"
sound.Volume = 0.5
sound:Play()

-- Optional: Star Particle Twinkle
--[[
local particle = Instance.new("ParticleEmitter", frame)
particle.Texture = "rbxassetid://243660364"
particle.LightEmission = 1
particle.Rate = 3
particle.Lifetime = NumberRange.new(3)
particle.Speed = NumberRange.new(0.5)
particle.Size = NumberSequence.new(0.3)
]]

-- Fade out and destroy
task.delay(5, function()
	TweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(title, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
	TweenService:Create(loading, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
	TweenService:Create(barFill, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(barBg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(shadow, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
	wait(0.6)
	blur:Destroy()
	gui:Destroy()
end)ransparency = 1}):Play()
	TweenService:Create(barFill, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(barBg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(shadow, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
	wait(0.6)
	blur:Destroy()
	gui:Destroy()
end)


local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "SPEEDHUBX"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Active = true
frame.Draggable = true
frame.Name = "PetAgeFrame"
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

-- Title
local title = Instance.new("TextLabel", frame)
title.Text = "Pet Age Leveller v2"
title.Font = Enum.Font.FredokaOne
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 5)

-- Close Button
local closeButton = Instance.new("TextButton", frame)
closeButton.Text = "X"
closeButton.Font = Enum.Font.FredokaOne
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
closeButton.Size = UDim2.new(0, 28, 0, 28)
closeButton.Position = UDim2.new(1, -34, 0, 6)
Instance.new("UICorner", closeButton)

closeButton.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

-- Equipped Pet Label
local petInfo = Instance.new("TextLabel", frame)
petInfo.Text = "Equipped Pet: [None]"
petInfo.Font = Enum.Font.FredokaOne
petInfo.TextSize = 16
petInfo.TextColor3 = Color3.fromRGB(255, 255, 160)
petInfo.BackgroundTransparency = 1
petInfo.Position = UDim2.new(0, 12, 0, 40)
petInfo.Size = UDim2.new(1, -24, 0, 24)
petInfo.TextXAlignment = Enum.TextXAlignment.Left

-- "Set Age to 50" Button (White Style)
local button = Instance.new("TextButton", frame)
button.Text = "Set Age to 50"
button.Font = Enum.Font.FredokaOne
button.TextSize = 16
button.TextColor3 = Color3.fromRGB(40, 40, 40)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.Size = UDim2.new(0, 220, 0, 36)
button.Position = UDim2.new(0.5, -110, 0, 76)
Instance.new("UICorner", button)

-- "Add +1 Age" Button (White Style)
local addAgeButton = Instance.new("TextButton", frame)
addAgeButton.Text = "Add +1 Age"
addAgeButton.Font = Enum.Font.FredokaOne
addAgeButton.TextSize = 16
addAgeButton.TextColor3 = Color3.fromRGB(40, 40, 40)
addAgeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
addAgeButton.Size = UDim2.new(0, 220, 0, 36)
addAgeButton.Position = UDim2.new(0.5, -110, 0, 122)
Instance.new("UICorner", addAgeButton)

-- Footer Label
local footer = Instance.new("TextLabel", frame)
footer.Text = "Tiktok: @SpeedHubX"
footer.Font = Enum.Font.FredokaOne
footer.TextSize = 13
footer.TextColor3 = Color3.fromRGB(180, 180, 180)
footer.BackgroundTransparency = 1
footer.Size = UDim2.new(1, 0, 0, 20)
footer.Position = UDim2.new(0, 0, 1, -20)

-- Function to get equipped pet tool
local function getEquippedPetTool()
	character = player.Character or player.CharacterAdded:Wait()
	for _, child in pairs(character:GetChildren()) do
		if child:IsA("Tool") and child.Name:find("Age") then
			return child
		end
	end
	return nil
end

-- Update GUI pet name
local function updateGUI()
	local pet = getEquippedPetTool()
	if pet then
		petInfo.Text = "Equipped Pet: " .. pet.Name
	else
		petInfo.Text = "Equipped Pet: [None]"
	end
end

-- Set Age to 50 Button Logic (with 20s countdown)
button.MouseButton1Click:Connect(function()
	local tool = getEquippedPetTool()
	if tool then
		for i = 20, 1, -1 do
			button.Text = "Changing Age in " .. i .. "..."
			task.wait(1)
		end
		local newName = tool.Name:gsub("%[Age%s%d+%]", "[Age 50]")
		tool.Name = newName
		petInfo.Text = "Equipped Pet: " .. tool.Name
		button.Text = "Set Age to 50"
	else
		button.Text = "No Pet Equipped!"
		task.wait(2)
		button.Text = "Set Age to 50"
	end
end)

-- Add +1 Age Button Logic (with 5s countdown, up to 100)
addAgeButton.MouseButton1Click:Connect(function()
	local tool = getEquippedPetTool()
	if tool then
		local currentAge = tonumber(tool.Name:match("%[Age%s(%d+)%]"))
		if currentAge and currentAge < 100 then
			for i = 5, 1, -1 do
				addAgeButton.Text = "Adding +1 in " .. i .. "..."
				task.wait(1)
			end
			local newAge = currentAge + 1
			local newName = tool.Name:gsub("%[Age%s%d+%]", "[Age " .. newAge .. "]")
			tool.Name = newName
			petInfo.Text = "Equipped Pet: " .. tool.Name
			addAgeButton.Text = "Add +1 Age"
		elseif currentAge and currentAge >= 100 then
			addAgeButton.Text = "Max Age is 100!"
			task.wait(2)
			addAgeButton.Text = "Add +1 Age"
		else
			addAgeButton.Text = "Invalid Age Format!"
			task.wait(2)
			addAgeButton.Text = "Add +1 Age"
		end
	else
		addAgeButton.Text = "No Pet Equipped!"
		task.wait(2)
		addAgeButton.Text = "Add +1 Age"
	end
end)

-- Auto refresh equipped pet display
task.spawn(function()
	while true do
		updateGUI()
		task.wait(1)
	end
end)utton.Text = "Invalid Age Format!"
			task.wait(2)
			addAgeButton.Text = "Add +1 Age"
		end
	else
		addAgeButton.Text = "No Pet Equipped!"
		task.wait(2)
		addAgeButton.Text = "Add +1 Age"
	end
end)

-- Auto refresh equipped pet display
task.spawn(function()
	while true do
		updateGUI()
		task.wait(1)
	end
end)
