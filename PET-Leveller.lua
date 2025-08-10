-- SKIDDED BY SIGMA @rizzify101
-- LOADING SCREEN START
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local blur = Instance.new("BlurEffect")
blur.Size = 12
blur.Parent = Lighting

local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "SpeedHubX"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 460, 0, 160)
frame.Position = UDim2.new(0.5, -230, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 0

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)
Instance.new("UIStroke", frame).ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local shadow = Instance.new("ImageLabel", frame)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.75
shadow.Size = UDim2.new(1, 80, 1, 80)
shadow.Position = UDim2.new(0.5, -240, 0.5, -90)
shadow.BackgroundTransparency = 1
shadow.ZIndex = -1

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -40, 0, 60)
title.Position = UDim2.new(0, 20, 0, 10)
title.Text = "Speed Hub X"
title.TextColor3 = Color3.fromRGB(0, 200, 255)
title.TextTransparency = 0.2
title.TextStrokeTransparency = 0.6
title.Font = Enum.Font.FredokaOne
title.TextScaled = true
title.BackgroundTransparency = 1

task.spawn(function()
	while title and title.Parent do
		TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 0.05}):Play()
		task.wait(1)
		TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 0.25}):Play()
		task.wait(1)
	end
end)

local loading = Instance.new("TextLabel", frame)
loading.Size = UDim2.new(1, -40, 0, 30)
loading.Position = UDim2.new(0, 20, 0, 70)
loading.Text = "Loading"
loading.TextColor3 = Color3.fromRGB(200, 200, 200)
loading.Font = Enum.Font.FredokaOne
loading.TextScaled = true
loading.BackgroundTransparency = 1
loading.TextStrokeTransparency = 1

task.spawn(function()
	local dots = {"", ".", "..", "..."}
	local index = 1
	while loading and loading.Parent do
		loading.Text = "Loading" .. dots[index]
		index = (index % #dots) + 1
		task.wait(0.4)
	end
end)

local barBg = Instance.new("Frame", frame)
barBg.Size = UDim2.new(1, -40, 0, 18)
barBg.Position = UDim2.new(0, 20, 1, -40)
barBg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(0, 10)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BorderSizePixel = 0
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 10)

local grad = Instance.new("UIGradient", barFill)
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 170, 255))
}
grad.Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(1, 0.2)
}

TweenService:Create(barFill, TweenInfo.new(5, Enum.EasingStyle.Sine), {
	Size = UDim2.new(1, 0, 1, 0)
}):Play()

local sound = Instance.new("Sound", frame)
sound.SoundId = "rbxassetid://9118823106"
sound.Volume = 0.5
sound:Play()

-- Wait 5 seconds, then remove blur/loading screen and load main GUI
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

	-- LOAD MAIN GUI
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

	local setAgeButton = Instance.new("TextButton", frame)
	setAgeButton.Size = UDim2.new(0, 220, 0, 36)
	setAgeButton.Position = UDim2.new(0.5, -110, 0, 76)
	setAgeButton.Text = "Set Age to 50"
	setAgeButton.Font = Enum.Font.FredokaOne
	setAgeButton.TextSize = 16
	setAgeButton.TextColor3 = Color3.fromRGB(40, 40, 40)
	setAgeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Instance.new("UICorner", setAgeButton)

	local addAgeButton = Instance.new("TextButton", frame)
	addAgeButton.Size = UDim2.new(0, 220, 0, 36)
	addAgeButton.Position = UDim2.new(0.5, -
