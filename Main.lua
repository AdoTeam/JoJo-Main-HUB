local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Sol Aç/Kapat Butonu
local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "ToggleButton"
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0,100,0,90)
toggleButton.Position = UDim2.new(0,20,0.5,-45)
toggleButton.BackgroundTransparency = 1
toggleButton.Image = "rbxassetid://111412181088124"
toggleButton.Active = true

-- Ana Menü
local mainMenu = Instance.new("ImageLabel")
mainMenu.Name = "MainMenu"
mainMenu.Parent = screenGui
mainMenu.Size = UDim2.new(0,600,0,420)
mainMenu.Position = UDim2.new(0.5,-300,0.5,-250)
mainMenu.BackgroundTransparency = 1
mainMenu.Image = "rbxassetid://84079870619799"
mainMenu.Visible = false

-- Reklam GUI
local adGui = Instance.new("ImageLabel")
adGui.Name = "AdGui"
adGui.Parent = screenGui
adGui.Size = UDim2.new(0,250,0,320)
adGui.Position = UDim2.new(0.5,-600,0.5,-200)
adGui.BackgroundTransparency = 1
adGui.Image = "rbxassetid://71591013400418"
adGui.Visible = false

-- Menü Sağ Üst Kapatma Butonu
local closeButton = Instance.new("ImageButton")
closeButton.Name = "CloseButton"
closeButton.Parent = mainMenu
closeButton.Size = UDim2.new(0,70,0,70)
closeButton.Position = UDim2.new(1,-72,0,2)
closeButton.BackgroundTransparency = 1
closeButton.Image = "rbxassetid://84867259489121"
closeButton.Visible = false

-- Menü Aç/Kapat Sistemi
local opened = false

local function setMenu(state)
	opened = state
	
	mainMenu.Visible = state
	adGui.Visible = state
	closeButton.Visible = state
end

toggleButton.MouseButton1Click:Connect(function()
	setMenu(not opened)
end)

closeButton.MouseButton1Click:Connect(function()
	setMenu(false)
end)

-- Sürükleme Sistemi
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart

	toggleButton.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

toggleButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPos = toggleButton.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

toggleButton.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch then

		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
